#ifndef PIPELINE_CORE_H
#define PIPELINE_CORE_H

#include <cstdint> // swap with ap_int.h for vivado
#include <stdbool.h>

// Struct to represent data moving through the pipeline (has all necessary registers, pc, etc)
struct PipelineLatch {
    bool valid = false;     // active instruction in pipe?
    unsigned int pc = 0;    // program counter
    unsigned int instr = 0; // Raw binary instruction

    // Decoded Fields in Instruction
    unsigned int opcode = 0;
    unsigned int funct3 = 0; // Bits 14:12
    unsigned int funct7 = 0; // Bits 31:25

    int src1 = -1;          // src1 reg index
    int src2 = -1;          // src2 reg index
    int dest = -1;          // dest reg index
    int imm = 0;             // sign-extended immediate (I/S/B-type)

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

// Forwarding-mux source select (traceable Tier-2 debug signal)
enum ForwardSel { FWD_NONE = 0, FWD_MEM = 1, FWD_WB = 2 };

// Basic data structures for physical hardware (RegFile, separate instr/data memory)
extern int RegisterFile[32];
extern int DataMemory[1024];
extern unsigned int InstructionMemory[1024];

// Physical Pipeline Latches
extern PipelineLatch IF_ID, ID_EX, EX_MEM, MEM_WB;
extern unsigned int PC;
extern bool pipeline_stall;

// Scalar debug/trace outputs -- plain wires, safe to expose as HLS output ports.
// No containers, no I/O: a testbench reads these after each clock_cycle() call.
extern int forward_A_sel;   // which source fed ALU operand1 this cycle
extern int forward_B_sel;   // which source fed ALU operand2 this cycle
extern int hazard_dest;     // dest register that caused a stall this cycle (-1 if none)

// Simulate one clock cycle of the pipeline. Synthesizable core -- no dynamic
// containers, no file/string I/O. All side effects are through the extern
// globals above (which map to registers/latches in hardware).
void clock_cycle();

#endif // PIPELINE_CORE_H
