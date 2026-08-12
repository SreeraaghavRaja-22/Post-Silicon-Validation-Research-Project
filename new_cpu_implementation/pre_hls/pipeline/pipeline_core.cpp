#include "pipeline_core.h"

int RegisterFile[32] = {0};
int DataMemory[1024] = {0};
unsigned int InstructionMemory[1024] = {0};

PipelineLatch IF_ID, ID_EX, EX_MEM, MEM_WB;
unsigned int PC = 0;
bool pipeline_stall = false;

int forward_A_sel = FWD_NONE;
int forward_B_sel = FWD_NONE;
int hazard_dest = -1;

// Must go in reverse order on pipeline to handle stalls and forwarding + hazards
void clock_cycle(){
    // Snapshot the instruction currently completing WB *before* MEM_WB gets
    // overwritten below. This is needed for correct EX-stage forwarding: by the
    // time stage 3 runs, EX_MEM/MEM_WB have already been reassigned to hold the
    // *new* instructions entering those latches this cycle, so forwarding must
    // compare against this snapshot (WB) and the freshly-updated MEM_WB (MEM)
    // rather than against latches that have already moved on.
    PipelineLatch wb_stage_instr = MEM_WB;

    // 1. WB Stage: data comes out of MEM_WB latch and is stored into the RegFile
    if (MEM_WB.valid){
        // check if there is a valid destination register since store and branch instructions don't have one
        // register 0 is usually automatically 0, so also making sure that dest register is not reg 0
        if(MEM_WB.dest != -1 && MEM_WB.dest != 0){
            RegisterFile[MEM_WB.dest] = MEM_WB.outVal;
        }
    }

    // 2. MEM Stage: read/write from data memory or pass ALU result forward
    MEM_WB = EX_MEM; // move data down the latch
    if(EX_MEM.valid){
        if(EX_MEM.opcode == 0x03){ // Load Word
            MEM_WB.outVal = DataMemory[EX_MEM.outVal]; // load from data memory for LW
            // EX_MEM.outVal holds target memory address
            // MEM_WB.outVal holds data loaded from target address
        }
        else if(EX_MEM.opcode == 0x23){ // SW
            DataMemory[EX_MEM.outVal] = EX_MEM.val2;
            // outVal stores the memory destination address, val2 stores the data
        }
        else{
            // Standard ALU functions passing through
            MEM_WB.outVal = EX_MEM.outVal;
            // since no memory addresses are required for this, EX_MEM.outVal holds result data
        }
    }

    // 3. EX Stage: perform operations on ALU
    EX_MEM = ID_EX;
    forward_A_sel = FWD_NONE;
    forward_B_sel = FWD_NONE;
    if(ID_EX.valid){
        // Forwarding MUXes for Data Forwarding
        int operand1 = ID_EX.val1; // Stale value from RegFile
        if (MEM_WB.valid && MEM_WB.dest != -1 && MEM_WB.dest != 0 && MEM_WB.dest == ID_EX.src1){
            operand1 = MEM_WB.outVal; // Bypass from the instruction currently in MEM this cycle (nearest)
            forward_A_sel = FWD_MEM;
        }
        else if(wb_stage_instr.valid && wb_stage_instr.dest != -1 && wb_stage_instr.dest != 0 && wb_stage_instr.dest == ID_EX.src1){
            operand1 = wb_stage_instr.outVal; // Bypass from the instruction currently in WB this cycle
            forward_A_sel = FWD_WB;
        }

        // Operand 2
        int operand2 = ID_EX.val2; // Stale value from RegFile
        if (MEM_WB.valid && MEM_WB.dest != -1 && MEM_WB.dest != 0 && MEM_WB.dest == ID_EX.src2){
            operand2 = MEM_WB.outVal; // Bypass from the instruction currently in MEM this cycle (nearest)
            forward_B_sel = FWD_MEM;
        }
        else if(wb_stage_instr.valid && wb_stage_instr.dest != -1 && wb_stage_instr.dest != 0 && wb_stage_instr.dest == ID_EX.src2){
            operand2 = wb_stage_instr.outVal; // Bypass from the instruction currently in WB this cycle
            forward_B_sel = FWD_WB;
        }

        // I-type ALU (0x13), loads (0x03), and stores (0x23) use the sign-extended
        // immediate as the second ALU operand instead of a register value.
        bool useImm = (ID_EX.opcode == 0x13 || ID_EX.opcode == 0x03 || ID_EX.opcode == 0x23);
        int aluOperand2 = useImm ? ID_EX.imm : operand2;
        int aluResult = 0;

        switch(ID_EX.opcode){
            case 0x33: // R-type (OP)
            case 0x13: // I-type ALU (OP-IMM) -- shares funct3 encodings with R-type
                switch(ID_EX.funct3){
                    case 0x0: // ADD / SUB (SUB only exists as R-type, funct7 = 0x20)
                        if(ID_EX.opcode == 0x33 && ID_EX.funct7 == 0x20)
                            aluResult = operand1 - aluOperand2;   // SUB
                        else
                            aluResult = operand1 + aluOperand2;   // ADD / ADDI
                        break;
                    case 0x1: // SLL / SLLI
                        aluResult = operand1 << (aluOperand2 & 0x1F);
                        break;
                    case 0x2: // SLT / SLTI
                        aluResult = (operand1 < aluOperand2) ? 1 : 0;
                        break;
                    case 0x3: // SLTU / SLTIU
                        aluResult = ((unsigned int)operand1 < (unsigned int)aluOperand2) ? 1 : 0;
                        break;
                    case 0x4: // XOR / XORI
                        aluResult = operand1 ^ aluOperand2;
                        break;
                    case 0x5: // SRL/SRLI (funct7=0x00) or SRA/SRAI (funct7=0x20)
                        if(ID_EX.funct7 == 0x20)
                            aluResult = operand1 >> (aluOperand2 & 0x1F);                    // arithmetic shift
                        else
                            aluResult = (int)((unsigned int)operand1 >> (aluOperand2 & 0x1F)); // logical shift
                        break;
                    case 0x6: // OR / ORI
                        aluResult = operand1 | aluOperand2;
                        break;
                    case 0x7: // AND / ANDI
                        aluResult = operand1 & aluOperand2;
                        break;
                }
                break;

            case 0x03: // LW -- compute effective memory address (base + offset)
            case 0x23: // SW -- compute effective memory address (base + offset)
                aluResult = operand1 + ID_EX.imm;
                break;

            case 0x63: { // Branch -- resolved here in EX
                bool takeBranch = false;
                switch(ID_EX.funct3){
                    case 0x0: takeBranch = (operand1 == operand2); break; // BEQ
                    case 0x1: takeBranch = (operand1 != operand2); break; // BNE
                    case 0x4: takeBranch = (operand1 <  operand2); break; // BLT
                    case 0x5: takeBranch = (operand1 >= operand2); break; // BGE
                    case 0x6: takeBranch = ((unsigned int)operand1 <  (unsigned int)operand2); break; // BLTU
                    case 0x7: takeBranch = ((unsigned int)operand1 >= (unsigned int)operand2); break; // BGEU
                }
                if(takeBranch){
                    PC = ID_EX.pc + ID_EX.imm;   // redirect fetch to branch target
                    IF_ID = PipelineLatch();     // squash the wrong-path instruction already fetched
                }
                break;
            }

            case 0x6F: // JAL -- unconditional jump, link register = pc+4
                aluResult = ID_EX.pc + 4;
                PC = ID_EX.pc + ID_EX.imm;
                IF_ID = PipelineLatch();         // squash the wrong-path instruction already fetched
                break;

            case 0x67: // JALR -- unconditional jump to (rs1+imm) with LSB cleared, link register = pc+4
                aluResult = ID_EX.pc + 4;
                PC = (operand1 + ID_EX.imm) & ~1u;
                IF_ID = PipelineLatch();         // squash the wrong-path instruction already fetched
                break;

            default:
                break;
        }

        EX_MEM.outVal = aluResult;

        // Store instructions write a register value to memory; that value must also
        // go through forwarding so we don't store a stale operand2.
        if(ID_EX.opcode == 0x23){
            EX_MEM.val2 = operand2;
        }
    }

    // 4. ID Stage: decodes instructions and reads register file
    // Check for RAW Hazards here so we can stall the pipeline (control hazards are also checked for here)
    bool raw_hazard = false;
    hazard_dest = -1; // reset every cycle; set below if a stall is triggered
    if (IF_ID.valid){
        // Extract the RAW source registers from the instruction waiting in Decode
        int current_src1 = (IF_ID.instr >> 15) & 0x1F;
        int current_src2 = (IF_ID.instr >> 20) & 0x1F;
        uint32_t current_opcode = IF_ID.instr & 0x7F;

        // Special case handling: like if it's a load word, it doesn't read src2
        bool uses_src2 = (current_opcode == 0x23 || current_opcode == 0x33 || current_opcode == 0x63);
        // JAL is the only implemented instruction that doesn't read rs1 at all
        // (its bits[19:15] are part of the immediate, not a register index)
        bool uses_src1 = (current_opcode != 0x6F);

        // Only stall for LW (forwarding handles every other RAW case)
        if (ID_EX.valid && ID_EX.opcode == 0x03 && ID_EX.dest != -1 && ID_EX.dest != 0){
            if((uses_src1 && ID_EX.dest == current_src1) || (uses_src2 && ID_EX.dest == current_src2)){
                raw_hazard = true;
                hazard_dest = ID_EX.dest;
            }
        }
    }

    // the stall signal is directly tied to the raw hazard
    pipeline_stall = raw_hazard;

    if(!pipeline_stall){
        if(IF_ID.valid){
            // Parse fields out of the current IF_ID stage latch
            PipelineLatch next_latch;
            next_latch.valid = true;
            next_latch.pc = IF_ID.pc;
            next_latch.instr = IF_ID.instr;

            // Extract opCode, funct3, src1, funct7 -- same bit position across every format
            next_latch.opcode = IF_ID.instr & 0x7F;             // Bits 6:0
            next_latch.funct3 = (IF_ID.instr >> 12) & 0x07;     // Bits 14:12
            next_latch.src1 = (IF_ID.instr >> 15) & 0x1F;       // Bits 19:15
            next_latch.funct7 = (IF_ID.instr >> 25) & 0x7F;     // Bits 31:25

            // src2, dest, and immediate depend on the instruction format
            switch(next_latch.opcode){
                case 0x33: // R-type (ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU)
                    next_latch.src2 = (IF_ID.instr >> 20) & 0x1F;
                    next_latch.dest = (IF_ID.instr >> 7) & 0x1F;
                    next_latch.imm = 0;
                    break;
                case 0x13: // I-type ALU (ADDI, ANDI, ORI, XORI, SLTI, SLTIU, SLLI, SRLI, SRAI)
                    next_latch.src2 = -1;
                    next_latch.dest = (IF_ID.instr >> 7) & 0x1F;
                    next_latch.imm = imm_i(IF_ID.instr);
                    break;
                case 0x03: // Load (LW)
                    next_latch.src2 = -1;
                    next_latch.dest = (IF_ID.instr >> 7) & 0x1F;
                    next_latch.imm = imm_i(IF_ID.instr);
                    break;
                case 0x23: // Store (SW)
                    next_latch.src2 = (IF_ID.instr >> 20) & 0x1F;
                    next_latch.dest = -1;
                    next_latch.imm = imm_s(IF_ID.instr);
                    break;
                case 0x63: // Branch (BEQ, BNE, BLT, BGE, BLTU, BGEU)
                    next_latch.src2 = (IF_ID.instr >> 20) & 0x1F;
                    next_latch.dest = -1;
                    next_latch.imm = imm_b(IF_ID.instr);
                    break;
                case 0x6F: // JAL (J-type) -- doesn't read rs1, bits[19:15] are part of the immediate
                    next_latch.src1 = -1;
                    next_latch.src2 = -1;
                    next_latch.dest = (IF_ID.instr >> 7) & 0x1F;
                    next_latch.imm = imm_j(IF_ID.instr);
                    break;
                case 0x67: // JALR (I-type) -- DOES read rs1 as the jump-target base
                    next_latch.src2 = -1;
                    next_latch.dest = (IF_ID.instr >> 7) & 0x1F;
                    next_latch.imm = imm_i(IF_ID.instr);
                    break;
                default:
                    next_latch.src2 = -1;
                    next_latch.dest = -1;
                    next_latch.imm = 0;
                    break;
            }

            // Read from Register File here (src1 is always 0/x0-safe since RegisterFile[0] stays 0,
            // but JAL sets src1 = -1 since it doesn't read a register, so guard it like val2)
            next_latch.val1 = (next_latch.src1 != -1) ? RegisterFile[next_latch.src1] : 0;
            next_latch.val2 = (next_latch.src2 != -1) ? RegisterFile[next_latch.src2] : 0;

            // Pass the complete packet to the output latch boundary
            ID_EX = next_latch;
        }
        else{
            ID_EX = PipelineLatch();
        }
    }
    else{
        // Insert a Bubble if the pipeline is stalled
        ID_EX = PipelineLatch(); // NOP = Bubble
    }

    // 5. IF Stage: fetch next instruction from InstructionMemory using current PC value and increment PC
    if(!pipeline_stall){
        IF_ID.instr = InstructionMemory[PC>>2]; // get subsequent instruction
        IF_ID.pc = PC;
        IF_ID.valid = true;
        PC += 4; // increment PC by 32 bits
    }
}
