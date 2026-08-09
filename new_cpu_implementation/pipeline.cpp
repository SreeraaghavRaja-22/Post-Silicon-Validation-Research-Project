#include <iostream>
#include <cstdint> // for standard bit width types an swap with ap_int.h for vivado
#include <stdbool.h>

// Struct to represent data moving through the pipeline (has all necessary registers, pc, etc)
struct PipelineLatch {
    bool valid = false;     // active instruction in pipe?
    unsigned int pc = 0;    // program counter
    unsigned int instr = 0; // Raw binary instruction

    // Decoded Fields in Instruction
    unsigned int opcode = 0; 

    // adding these fields for R-type instruction decoding
    // This will help determine between an add, sub, etc.
    unsigned int funct3 = 0; // Bits 14:12
    unsigned int funct7 = 0; // Bits 31:25

    int src1 = -1;          // src1 reg index
    int src2 = -1;          // src2 reg index
    int dest = -1;          // dest reg index
    int imm = 0;            // sign-extended immediate (I/S/B-type)

    // Data values 
    int val1 = 0;           // value read from src1
    int val2 = 0;           // value read from src2
    int outVal = 0;         // Output value computed by ALU or read from mem
};

// Sign-extend the low `bits` bits of value to a full 32-bit int
static inline int32_t sign_extend(uint32_t value, int bits){
    int32_t shift = 32 - bits;
    return ((int32_t)(value << shift)) >> shift;
}

// I-type immediate: bits [31:20]
static inline int32_t imm_i(uint32_t instr){
    return sign_extend((instr >> 20) & 0xFFF, 12);
}

// S-type immediate: bits [31:25] | [11:7]
static inline int32_t imm_s(uint32_t instr){
    uint32_t imm = ((instr >> 25) & 0x7F) << 5 | ((instr >> 7) & 0x1F);
    return sign_extend(imm, 12);
}

// B-type immediate: bits [31|7|30:25|11:8] << 1
static inline int32_t imm_b(uint32_t instr){
    uint32_t imm = ((instr >> 31) & 0x1) << 12
                  | ((instr >> 7)  & 0x1) << 11
                  | ((instr >> 25) & 0x3F) << 5
                  | ((instr >> 8)  & 0xF)  << 1;
    return sign_extend(imm, 13);
}

// Basic data structures for physical hardware like Unified Memory and RegFile (no unified memory here since data and instr memory are separate)
int RegisterFile[32] = {0};
int DataMemory[1024] = {0};
unsigned int InstructionMemory[1024] = {0};

// Physical Pipeline Latches 
PipelineLatch IF_ID, ID_EX, EX_MEM, MEM_WB;
unsigned int PC = 0;
bool pipeline_stall = false;


// Function to simulate one clock cycle of pipeline
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
    if(ID_EX.valid){
        // Forwarding MUXes for Data Forwarding
        // Operand 1 -- Assume we aren't writing to a register with our current instruction, then we can snoop a later stage and get that data if it is going to write to that same reg
        int operand1 = ID_EX.val1; // Stale value from RegFile
        if (MEM_WB.valid && MEM_WB.dest != -1 && MEM_WB.dest != 0 && MEM_WB.dest == ID_EX.src1){
            operand1 = MEM_WB.outVal; // Bypass from the instruction currently in MEM this cycle (nearest)
        }
        else if(wb_stage_instr.valid && wb_stage_instr.dest != -1 && wb_stage_instr.dest != 0 && wb_stage_instr.dest == ID_EX.src1){
            operand1 = wb_stage_instr.outVal; // Bypass from the instruction currently in WB this cycle
        }

        // Operand 2 -- Assume we aren't writing to a register with our current instruction, then we can snoop a later stage and get that data if it is going to write to that same reg
        int operand2 = ID_EX.val2; // Stale value from RegFile
        if (MEM_WB.valid && MEM_WB.dest != -1 && MEM_WB.dest != 0 && MEM_WB.dest == ID_EX.src2){
            operand2 = MEM_WB.outVal; // Bypass from the instruction currently in MEM this cycle (nearest)
        }
        else if(wb_stage_instr.valid && wb_stage_instr.dest != -1 && wb_stage_instr.dest != 0 && wb_stage_instr.dest == ID_EX.src2){
            operand2 = wb_stage_instr.outVal; // Bypass from the instruction currently in WB this cycle
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
    // RAW Hazard checking
    bool raw_hazard = false; 
    if (IF_ID.valid){
        // Extract the RAW source registers from the instruction waiting in Decode
        int current_src1 = (IF_ID.instr >> 15) & 0x1F; 
        int current_src2 = (IF_ID.instr >> 20) & 0x1F;
        uint32_t current_opcode = IF_ID.instr & 0x7F;

        // Special case handling: like if it's a load word, it doesn't read src2
        // bool uses_src2 = (current_opcode != 0x03); -- Make this explicit for HLS
        bool uses_src2 = (current_opcode == 0x23 || current_opcode == 0x33 || current_opcode == 0x63);

        // Only stall for LW
        if (ID_EX.valid && ID_EX.opcode == 0x03 && ID_EX.dest != -1 && ID_EX.dest != 0){
            if(ID_EX.dest == current_src1 || (uses_src2 && ID_EX.dest == current_src2)){
                raw_hazard = true;
            }
        }
        /** Not necessary because data forwarding should eliminate these stalls
        // Check against the instruction currently in EXecute (are the registers being used right now)
        if (ID_EX.valid && ID_EX.dest != -1 && ID_EX.dest != 0){
            if (ID_EX.dest == current_src1 || (uses_src2 && ID_EX.dest == current_src2)){
                raw_hazard = true;
            }
        }
        // Check against the instruction currently in MEMory
        if (EX_MEM.valid && EX_MEM.dest != -1 && EX_MEM.dest != 0){
            if (EX_MEM.dest == current_src1 || (uses_src2 && EX_MEM.dest == current_src2)){
                raw_hazard = true;
            }
        }
    **/
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
            
            // Extract opCode, funct3, src1, funct7 -- these fields are in the same
            // bit position across every RV32I format we support.
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
                default:
                    next_latch.src2 = -1;
                    next_latch.dest = -1;
                    next_latch.imm = 0;
                    break;
            }

            // Read from Register File here (src1 is always 0/x0-safe since RegisterFile[0] stays 0)
            next_latch.val1 = RegisterFile[next_latch.src1];
            next_latch.val2 = (next_latch.src2 != -1) ? RegisterFile[next_latch.src2] : 0;

            // Pass the complete packet to the output latch boundary
            ID_EX = next_latch;
        }
        else{
            ID_EX = PipelineLatch();
        }

    }
    else{
        // Index a Bubble if the pipeline is stalled 
        ID_EX = PipelineLatch(); // NOP = Bubble
    }

    // 5. IF Stage: fetch next instruction form InstructionMemory using current PC value and increment PC
    if(!pipeline_stall){
        IF_ID.instr = InstructionMemory[PC>>2]; // get subsequent instruction
        IF_ID.pc = PC; 
        IF_ID.valid = true;
        PC += 4; // increment PC by 32 bits
    }
}

/*********************************     TEST CODE   *********************************/
uint32_t pack_r_type(uint32_t opcode, uint32_t rs1, uint32_t rs2, uint32_t rd, uint32_t funct3 = 0, uint32_t funct7 = 0){
    return (opcode & 0x7F) | ((rd & 0x1F) << 7) | ((funct3 & 0x7) << 12)
         | ((rs1 & 0x1F) << 15) | ((rs2 & 0x1F) << 20) | ((funct7 & 0x7F) << 25);
}

uint32_t pack_i_type(uint32_t opcode, uint32_t rs1, uint32_t rd, int32_t imm, uint32_t funct3 = 0){
    return (opcode & 0x7F) | ((rd & 0x1F) << 7) | ((funct3 & 0x7) << 12)
         | ((rs1 & 0x1F) << 15) | ((imm & 0xFFF) << 20);
}

uint32_t pack_s_type(uint32_t rs1, uint32_t rs2, int32_t imm, uint32_t funct3 = 0x2){
    uint32_t imm_lo = imm & 0x1F;        // bits [4:0]  -> instr[11:7]
    uint32_t imm_hi = (imm >> 5) & 0x7F; // bits [11:5] -> instr[31:25]
    return 0x23 | (imm_lo << 7) | ((funct3 & 0x7) << 12) | ((rs1 & 0x1F) << 15) | ((rs2 & 0x1F) << 20) | (imm_hi << 25);
}

uint32_t pack_b_type(uint32_t rs1, uint32_t rs2, int32_t imm, uint32_t funct3){
    uint32_t b11    = (imm >> 11) & 0x1;
    uint32_t b4_1   = (imm >> 1)  & 0xF;
    uint32_t b10_5  = (imm >> 5)  & 0x3F;
    uint32_t b12    = (imm >> 12) & 0x1;
    return 0x63 | (b11 << 7) | (b4_1 << 8) | ((funct3 & 0x7) << 12)
         | ((rs1 & 0x1F) << 15) | ((rs2 & 0x1F) << 20) | (b10_5 << 25) | (b12 << 31);
}

int main(){
    // Seed some initial architectural parameters into the register file
    RegisterFile[1] = 10;
    RegisterFile[2] = 20;
    RegisterFile[4] = 5; 

    // Test Program
    // 0: ADD x3, x1, x2         (10 + 20 = 30 -> x3)
    InstructionMemory[0] = pack_r_type(0x33, 1, 2, 3, 0x0, 0x00);
    // 1: ADD x5, x3, x4         (reads x3 immediately -> tests EX/MEM forwarding)
    InstructionMemory[1] = pack_r_type(0x33, 3, 4, 5, 0x0, 0x00);
    // 2: ADDI x6, x1, 100       (x1 + 100 = 110 -> x6, tests I-type)
    InstructionMemory[2] = pack_i_type(0x13, 1, 6, 100, 0x0);
    // 3: SUB x7, x5, x1         (x5 - x1 = 25 -> x7, tests funct7)
    InstructionMemory[3] = pack_r_type(0x33, 5, 1, 7, 0x0, 0x20);
    // 4: SW x6, 0(x0)           (store x6 = 110 into DataMemory[0])
    InstructionMemory[4] = pack_s_type(0, 6, 0, 0x2);
    // 5: LW x8, 0(x0)           (load DataMemory[0] back into x8 -> should be 110)
    InstructionMemory[5] = pack_i_type(0x03, 0, 8, 0, 0x2);
    // 6: BEQ x1, x1, +8         (always taken -> should skip instruction at PC+4)
    InstructionMemory[6] = pack_b_type(1, 1, 8, 0x0);
    // 7: ADDI x9, x0, 999       (should be SKIPPED by the branch above)
    InstructionMemory[7] = pack_i_type(0x13, 0, 9, 999, 0x0);
    // 8: ADDI x10, x0, 42       (branch target -> x10 = 42)
    InstructionMemory[8] = pack_i_type(0x13, 0, 10, 42, 0x0);

    std::cout << "---Starting Pipeline Simulation---" << std::endl;

    // Run enough simulated clock cycles to drain the pipeline
    for(int cycle = 0; cycle < 16; cycle++){
        clock_cycle();

        // Print cycle telemetry
        std::cout << "Cycle: " << cycle + 1
                  << " | PC: " << PC
                  << " | Stall: " << (pipeline_stall ? "YES" : "NO")
                  << " | x3: " << RegisterFile[3]
                  << " | x5: " << RegisterFile[5]
                  << " | x6: " << RegisterFile[6]
                  << " | x7: " << RegisterFile[7]
                  << " | x8: " << RegisterFile[8]
                  << " | x9: " << RegisterFile[9]
                  << " | x10: " << RegisterFile[10]
                  << std::endl;
    }
    return 0;
}