#ifndef PIPELINE_CORE_HLS_H
#define PIPELINE_CORE_HLS_H

#include <cstdint> // swap with ap_int.h for vivado
#include <stdbool.h>

// add this include to make the code HLS synthesizable
#if __has_include(<ap_int.h>)
    #include <ap_int.h>
#else
    template<int W> using ap_int = int32_t;
    template<int W> using ap_uint = uint32_t;
#endif

// Struct to represent data moving through the pipeline (has all necessary registers, pc, etc)
// remove the default values and change the types to make this HLS synthesiable
struct PipelineLatch {
    bool valid;        // active instruction in pipe?
    ap_uint<32> pc;    // program counter
    ap_uint<32> instr; // Raw binary instruction

    // Decoded Fields in Instruction
    ap_uint<7> opcode;
    ap_uint<3> funct3; // Bits 14:12
    ap_uint<7> funct7; // Bits 31:25
    
    // Source and destination 
    int src1;          // src1 reg index
    int src2;          // src2 reg index
    int dest;          // dest reg index
    ap_int<32> imm;    // sign-extended immediate (I/S/B-type)

    // Data values
    ap_int<32> val1;   // value read from src1
    ap_int<32> val2;   // value read from src2
    ap_int<32> outVal; // Output value computed by ALU or read from mem

    // Function to reset all the values to certain defaults 
    // Makes it easier to synthesize in HLS
    void reset(){
        valid = false; pc = 0; instr = 0;
        opcode = 0; funct3 = 0; funct7 = 0;
        src1 = -1; src2 = -1; dest = -1;
        imm = 0; val1 = 0; val2 = 0; outVal = 0;
    }
};

// Sign-extend the low `bits` bits of value to a full 32-bit int
// Updated to support the ap_int style
static inline ap_int<32> sign_extend(ap_uint<32> value, int bits){
    uint32_t v = (uint32_t)value;
    int32_t shift = 32 - bits;
    return (ap_int<32>)(((int32_t)(v << shift)) >> shift);
}

// I-type immediate: bits [31:20]
// Updated to support the ap_int style
static inline ap_int<32> imm_i(ap_uint<32> instr){
    return sign_extend((instr >> 20) & 0xFFF, 12);
}

// S-type immediate: bits [31:25] | [11:7]
// Updated to support the ap_int style
static inline ap_int<32> imm_s(ap_uint<32> instr){
    uint32_t imm = ((instr >> 25) & 0x7F) << 5 | ((instr >> 7) & 0x1F);
    return sign_extend(imm, 12);
}

// B-type immediate: bits [31|7|30:25|11:8] << 1
// Updated to support the ap_int style
static inline ap_int<32> imm_b(ap_uint<32> instr){
    uint32_t imm = ((instr >> 31) & 0x1) << 12
                  | ((instr >> 7)  & 0x1) << 11
                  | ((instr >> 25) & 0x3F) << 5
                  | ((instr >> 8)  & 0xF)  << 1;
    return sign_extend(imm, 13);
}

// J-type immediate (JAL): bits [31|19:12|20|30:21] << 1
static inline ap_int<32> imm_j(ap_uint<32> instr){
    uint32_t imm = ((instr >> 31) & 0x1)   << 20
                  | ((instr >> 12) & 0xFF) << 12
                  | ((instr >> 20) & 0x1)  << 11
                  | ((instr >> 21) & 0x3FF) << 1;
    return sign_extend(imm, 21);
}

// Forwarding-mux source select (traceable Tier-2 debug signal)
enum ForwardSel { FWD_NONE = 0, FWD_MEM = 1, FWD_WB = 2 };

// Basic data structures for physical hardware (RegFile, separate instr/data memory)
extern ap_int<32> RegisterFile[32];
extern ap_int<32> DataMemory[1024];
extern ap_uint<32> InstructionMemory[1024];

// Physical Pipeline Latches
extern PipelineLatch IF_ID, ID_EX, EX_MEM, MEM_WB;
extern ap_uint<32> PC;
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


// Top Level wrapper for synthesis. THis shows the most important external signals
// for Post-Silicon visibility.
void pipeline_top(
    bool& stall_out, 
    int& forward_A_sel_out,
    int& forward_B_sel_out, 
    int& hazard_dest_out,
    ap_uint<32>& pc_out
);

#endif // PIPELINE_CORE_HLS_H
