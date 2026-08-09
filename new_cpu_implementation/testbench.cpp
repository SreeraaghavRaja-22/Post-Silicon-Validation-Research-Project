// Testbench for pipeline_core -- NOT synthesizable, and not meant to be.
// This is where all the simulation-only bookkeeping (dynamic containers, file
// I/O, strings) lives, kept out of pipeline_core so that file can go through
// HLS unmodified. This file just calls clock_cycle() in a loop and inspects
// the plain scalar globals it exposes.
#include "pipeline_core.h"
#include <iostream>
#include <vector>
#include <fstream>
#include <string>
#include <cstdint>

// --- RAW-hazard trace log (Tier-2 debug signals, testbench-side only) ------
struct TraceEntry {
    int cycle;
    unsigned int pc;
    bool stall;
    int fwd_A;
    int fwd_B;
    int hazard_dest;
};
std::vector<TraceEntry> trace_log;

void dump_trace_log(const std::string& path){
    std::ofstream out(path);
    out << "cycle,pc,stall,forward_A_sel,forward_B_sel,hazard_dest\n";
    for(const auto& t : trace_log){
        out << t.cycle << "," << t.pc << "," << (t.stall ? 1 : 0) << ","
            << t.fwd_A << "," << t.fwd_B << "," << t.hazard_dest << "\n";
    }
}

// --- Instruction encoding helpers ------------------------------------------
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
    // 9: LW x11, 0(x0)          (reload DataMemory[0] -> 110 into x11)
    InstructionMemory[9] = pack_i_type(0x03, 0, 11, 0, 0x2);
    // 10: ADDI x12, x11, 1      (uses x11 IMMEDIATELY -> classic load-use hazard, must stall)
    InstructionMemory[10] = pack_i_type(0x13, 11, 12, 1, 0x0);

    std::cout << "---Starting Pipeline Simulation---" << std::endl;

    // Run enough simulated clock cycles to drain the pipeline
    for(int cycle = 0; cycle < 20; cycle++){
        clock_cycle();

        // Testbench-side trace logging -- reads the plain scalar globals the
        // synthesizable core exposes; none of this runs on hardware.
        trace_log.push_back(TraceEntry{cycle + 1, PC, pipeline_stall, forward_A_sel, forward_B_sel, hazard_dest});

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
                  << " | x11: " << RegisterFile[11]
                  << " | x12: " << RegisterFile[12]
                  << std::endl;
    }

    dump_trace_log("raw_hazard_trace.csv");
    std::cout << "Trace log written to raw_hazard_trace.csv (" << trace_log.size() << " cycles)" << std::endl;

    return 0;
}
