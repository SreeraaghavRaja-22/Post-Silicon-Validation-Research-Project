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
    int src1 = -1;          // src1 reg index
    int src2 = -1;          // src2 reg index
    int dest = -1;          // dest reg index

    // Data values 
    int val1 = 0;           // value read from src1
    int val2 = 0;           // value read from src2
    int outVal = 0;         // Output value computed by ALU or read from mem
};

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
        if (EX_MEM.valid && EX_MEM.dest != -1 && EX_MEM.dest != 0 && EX_MEM.dest == ID_EX.src1){
            operand1 = EX_MEM.outVal; // Bypass from EX_MEM boundary
        }
        else if(MEM_WB.valid && MEM_WB.dest != -1 && MEM_WB.dest != 0 && MEM_WB.dest == ID_EX.src1){
            operand1 = MEM_WB.outVal; // Bypass from MEM_WB boundary
        }

        // Operand 2 -- Assume we aren't writing to a register with our current instruction, then we can snoop a later stage and get that data if it is going to write to that same reg
        int operand2 = ID_EX.val2; // Stale value from RegFile
        if (EX_MEM.valid && EX_MEM.dest != -1 && EX_MEM.dest != 0 && EX_MEM.dest == ID_EX.src2){
            operand2 = EX_MEM.outVal; // Bypass from EX_MEM boundary
        }
        else if(MEM_WB.valid && MEM_WB.dest != -1 && MEM_WB.dest != 0 && MEM_WB.dest == ID_EX.src2){
            operand2 = MEM_WB.outVal; // Bypass from MEM_WB boundary
        }
        if(ID_EX.opcode == 0x33){
            // EX_MEM.outVal = ID_EX.val1 + ID_EX.val2;
            EX_MEM.outVal = operand1 + operand2;
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
        bool uses_src2 = (current_opcode == 0x23 || current_opcode == 0x33);

        // Only stall for LW
        if (ID_EX.valid && ID_EX.opcode == 0x03 && ID_EX.dest != -1 && ID_EX.dest != 0){
            if(ID_EX.dest == current_src1 || uses_src2 && ID_EX.dest == current_src2){
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
            
            // Extract opCode, src1, src2, dest from IF_ID.instr
            next_latch.opcode = IF_ID.instr & 0x7F;
            next_latch.src1 = (IF_ID.instr >> 15) & 0x1F;
            next_latch.src2 = (IF_ID.instr >> 20) & 0x1F;

            if(next_latch.opcode == 0x23){ // SW
                next_latch.dest = -1;
            }
            else{
                // For R-TYPE Instructions (Will implement I-Type soon)
                next_latch.dest = (IF_ID.instr >> 7) & 0x1F;
            }

            // Read from Register File here
            next_latch.val1 = RegisterFile[ID_EX.src1];
            next_latch.val2 = RegisterFile[ID_EX.src2];

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
uint32_t pack_r_type(uint32_t opcode, uint32_t rs1, uint32_t rs2, uint32_t rd){
    return opcode | (rd << 7) | (rs1 << 15) | (rs2 << 20); // pack the instruction
}

int main(){
    // Seed some initial architectural parameters into the register file
    RegisterFile[1] = 10;
    RegisterFile[2] = 20;
    RegisterFile[4] = 5; 

    // Test Program Loop
    // Instruction 0: ADD x3, x1, x2 (10 + 20 = 30 -> targeted to x3)
    InstructionMemory[0] = pack_r_type(0x33, 1, 2, 3);

    // Instruction 1: ADD x5, x3, x4 (Reads x3 immediately! test forwarding)
    InstructionMemory[1] = pack_r_type(0x33, 3, 4, 5);

    std::cout << "---Starting Pipeline Simulation---" << std::endl;

    // Run for 10 simulated clock cycles
    for(int cycle = 0; cycle < 10; cycle++){
        clock_cycle();

        // Print cycle telemetry
        std::cout << "Cycle: " << cycle + 1
                  << " | PC: " << PC
                  << " | Stall: " << (pipeline_stall ? "YES" : "NO")
                  << " | x3: " << RegisterFile[3]
                  << " | x5: " << RegisterFile[5] 
                  << std::endl;
    }
    return 0;
}