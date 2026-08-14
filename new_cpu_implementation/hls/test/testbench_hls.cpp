// Testbench for pipeline_core_hls -- NOT synthesizable, not meant to be.
// Identical test program to testbench.cpp (the golden model's testbench) so
// the two can be diffed for functional equivalence after each HLS-readiness
// change.
#include "../pipeline_core_hls.h"
#include <iostream>
#include <vector>
#include <fstream>
#include <string>
#include <cstdint>

struct TraceEntry {
    int cycle;
    uint32_t pc;
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

uint32_t pack_r_type(uint32_t opcode, uint32_t rs1, uint32_t rs2, uint32_t rd, uint32_t funct3 = 0, uint32_t funct7 = 0){
    return (opcode & 0x7F) | ((rd & 0x1F) << 7) | ((funct3 & 0x7) << 12)
         | ((rs1 & 0x1F) << 15) | ((rs2 & 0x1F) << 20) | ((funct7 & 0x7F) << 25);
}

uint32_t pack_i_type(uint32_t opcode, uint32_t rs1, uint32_t rd, int32_t imm, uint32_t funct3 = 0){
    return (opcode & 0x7F) | ((rd & 0x1F) << 7) | ((funct3 & 0x7) << 12)
         | ((rs1 & 0x1F) << 15) | ((imm & 0xFFF) << 20);
}

uint32_t pack_s_type(uint32_t rs1, uint32_t rs2, int32_t imm, uint32_t funct3 = 0x2){
    uint32_t imm_lo = imm & 0x1F;
    uint32_t imm_hi = (imm >> 5) & 0x7F;
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

uint32_t pack_j_type(uint32_t rd, int32_t imm){
    uint32_t b20    = (imm >> 20) & 0x1;
    uint32_t b19_12 = (imm >> 12) & 0xFF;
    uint32_t b11    = (imm >> 11) & 0x1;
    uint32_t b10_1  = (imm >> 1)  & 0x3FF;
    return 0x6F | ((rd & 0x1F) << 7) | (b19_12 << 12) | (b11 << 20) | (b10_1 << 21) | (b20 << 31);
}

int main(){
    RegisterFile[1] = 10;
    RegisterFile[2] = 20;
    RegisterFile[4] = 5;

    InstructionMemory[0] = pack_r_type(0x33, 1, 2, 3, 0x0, 0x00);
    InstructionMemory[1] = pack_r_type(0x33, 3, 4, 5, 0x0, 0x00);
    InstructionMemory[2] = pack_i_type(0x13, 1, 6, 100, 0x0);
    InstructionMemory[3] = pack_r_type(0x33, 5, 1, 7, 0x0, 0x20);
    InstructionMemory[4] = pack_s_type(0, 6, 0, 0x2);
    InstructionMemory[5] = pack_i_type(0x03, 0, 8, 0, 0x2);
    InstructionMemory[6] = pack_b_type(1, 1, 8, 0x0);
    InstructionMemory[7] = pack_i_type(0x13, 0, 9, 999, 0x0);
    InstructionMemory[8] = pack_i_type(0x13, 0, 10, 42, 0x0);
    InstructionMemory[9] = pack_i_type(0x03, 0, 11, 0, 0x2);
    InstructionMemory[10] = pack_i_type(0x13, 11, 12, 1, 0x0);
    InstructionMemory[11] = pack_j_type(13, 8);
    InstructionMemory[12] = pack_i_type(0x13, 0, 17, 999, 0x0);
    InstructionMemory[13] = pack_i_type(0x13, 0, 20, 64, 0x0);
    InstructionMemory[14] = pack_i_type(0x67, 20, 19, 0, 0x0);
    InstructionMemory[15] = pack_i_type(0x13, 0, 21, 888, 0x0);
    InstructionMemory[16] = pack_i_type(0x13, 0, 22, 77, 0x0);

    std::cout << "---Starting Pipeline Simulation (HLS-oriented core)---" << std::endl;

    bool stall_out;
    int forward_A_sel_out, forward_B_sel_out, hazard_dest_out;
    ap_uint<32> pc_out;

    // One-cycle power-on reset pulse
    pipeline_top(true, stall_out, forward_A_sel_out, forward_B_sel_out, hazard_dest_out, pc_out);

    for(int cycle = 0; cycle < 30; cycle++){
        // Call the actual top-level function being synthesized, not clock_cycle()
        // directly -- this is what C-sim needs to exercise so it matches what
        // co-simulation will later check against the generated RTL.
        bool reset = false;
        pipeline_top(reset, stall_out, forward_A_sel_out, forward_B_sel_out, hazard_dest_out, pc_out);

        trace_log.push_back(TraceEntry{cycle + 1, (uint32_t)pc_out, stall_out, forward_A_sel_out, forward_B_sel_out, hazard_dest_out});

        std::cout << "Cycle: " << cycle + 1
                  << " | PC: " << (uint32_t)pc_out
                  << " | Stall: " << (stall_out ? "YES" : "NO")
                  << " | x3: " << (int)RegisterFile[3]
                  << " | x5: " << (int)RegisterFile[5]
                  << " | x6: " << (int)RegisterFile[6]
                  << " | x7: " << (int)RegisterFile[7]
                  << " | x8: " << (int)RegisterFile[8]
                  << " | x9: " << (int)RegisterFile[9]
                  << " | x10: " << (int)RegisterFile[10]
                  << " | x11: " << (int)RegisterFile[11]
                  << " | x12: " << (int)RegisterFile[12]
                  << " | x13: " << (int)RegisterFile[13]
                  << " | x17: " << (int)RegisterFile[17]
                  << " | x19: " << (int)RegisterFile[19]
                  << " | x20: " << (int)RegisterFile[20]
                  << " | x21: " << (int)RegisterFile[21]
                  << " | x22: " << (int)RegisterFile[22]
                  << std::endl;
    }

    dump_trace_log("raw_hazard_trace_hls.csv");
    std::cout << "Trace log written to raw_hazard_trace_hls.csv (" << trace_log.size() << " cycles)" << std::endl;

    return 0;
}
