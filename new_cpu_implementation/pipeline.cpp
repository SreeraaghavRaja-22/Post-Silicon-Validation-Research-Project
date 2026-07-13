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
        if(ID_EX.opcode == 0x33){
            EX_MEM.outVal = ID_EX.val1 + ID_EX.val2;
        }
    }

    // 4. ID Stage: decodes instructions and reads register file
    // Check for RAW Hazards here so we can stall the pipeline (control hazards are also checked for here)
    if(!pipeline_stall){
        ID_EX = IF_ID;
        if(IF_ID.valid){
            // Extract opCode, src1, src2, dest from IF_ID.instr
            ID_EX.opcode = IF_ID.instr & 0x7F;
            ID_EX.src1 = (IF_ID.instr >> 15) & 0x1F;
            ID_EX.src2 = (IF_ID.instr >> 20) & 0x1F;

            if(ID_EX.opcode == 0x23){ // SW
                ID_EX.dest = -1;
            }
            else{
                // For R-TYPE Instructions (Will implement I-Type soon)
                ID_EX.dest = (IF_ID.instr >> 7) & 0x1F;
            }

            // Read from Register File here
            ID_EX.val1 = RegisterFile[ID_EX.src1];
            ID_EX.val2 = RegisterFile[ID_EX.src2];
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