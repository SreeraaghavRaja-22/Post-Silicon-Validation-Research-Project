# Post-Silicon Validation Research Project

# In-Silicon Microarchitectural Telemetry & Hazard Tracking Framework

A synthesizable 5-stage RISC processor core with real-time hardware telemetry ports for observing Read-After-Write (RAW) data hazards, operand forwarding, and load-use interlocks on FPGA silicon.

---

## 1. Motivation & Background

Post-silicon validation often suffers from an observability bottleneck: once a processor is synthesized and running on physical silicon, internal pipeline registers and hazard resolution states become opaque. While pre-silicon architectural simulators (such as gem5) provide full software visibility, their runtime timing models do not synthesize to RTL due to non-synthesizable software abstractions (dynamic memory, STL containers, event queues).

This project bridges that gap by implementing a custom, synthesizable 5-stage RISC datapath in C++, compiling it to RTL via High-Level Synthesis (Vitis HLS), and exporting non-intrusive runtime telemetry signals directly to an on-chip Integrated Logic Analyzer (ILA) on a Xilinx Kintex-7 FPGA.

---

## 2. Microarchitecture & Datapath

The core implements a classic 5-stage in-order RISC pipeline (`IF` -> `ID` -> `EX` -> `MEM` -> `WB`) with dedicated hazard resolution logic:

- **Inter-Stage Latch Snooping:** Compares destination registers in `EX/MEM` and `MEM/WB` against decode-stage source registers (`src1`, `src2`).
- **ALU Operand Forwarding:** Supports 1-cycle EX-to-EX bypass and 2-cycle MEM-to-EX bypass without inserting pipeline bubbles.
- **Load-Use Hazard Detection Unit:** Detects when an instruction in `EX` is a memory load targeting an operand needed by the instruction in `ID`. When triggered, it freezes the PC, holds the `IF/ID` latch, and inserts a 1-cycle bubble (NOP) into `ID/EX`.

### Telemetry Probe Interface

The core exposes 5 dedicated telemetry output ports designed for direct connection to Vivado ILA probes:

| Signal Name | Width | Description |
| :--- | :---: | :--- |
| `probe0` (`stall_out`) | 1 bit | High when the Load-Use hazard unit inserts a pipeline bubble. |
| `probe1` (`forward_A_sel_out`) | 2 bits | Operand A bypass select (`0`=RegFile, `1`=EX/MEM, `2`=MEM/WB). |
| `probe2` (`forward_B_sel_out`) | 2 bits | Operand B bypass select (`0`=RegFile, `1`=EX/MEM, `2`=MEM/WB). |
| `probe3` (`hazard_dest_out`) | 5 bits | Architectural register index causing the active hazard/bypass. |
| `probe4` (`pc_out`) | 32 bits | Current program counter for instruction retirement tracking. |

---

## 3. Toolchain & Target Hardware

- **Software Simulation / Prototyping:** gem5 (`MinorCPU` timing exploration)
- **High-Level Synthesis:** AMD / Xilinx Vitis HLS
- **Implementation & Bitstream:** Vivado Design Suite
- **Target Device:** Xilinx Kintex-7 FPGA (`xc7k70t`)
- **Silicon Debug:** Vivado Integrated Logic Analyzer (ILA)

---

## 4. Verification Plan & Test Benchmarks

The verification suite evaluates four deterministic dependency scenarios:

1. **EX-to-EX Forwarding:** Executes back-to-back arithmetic instructions with immediate RAW dependencies (e.g., `ADD x1, x2, x3` followed by `ADD x4, x1, x5`). Triggering on `probe1 == 1` confirms ALU operand forwarding in 1 clock cycle with `stall_out == 0` and `hazard_dest_out == 1`.
2. **MEM-to-EX Forwarding:** Evaluates dependencies separated by one independent instruction (stage $N+2$). Verifies `probe1 == 2` routing the operand from the `MEM/WB` latch.
3. **Load-Use Hazard Interlock:** Stresses the pipeline with a memory load followed immediately by an ALU consumer (e.g., `LW x1, 0(x2)` followed by `ADD x3, x1, x4`). Verifies a 1-cycle `stall_out == 1` pulse, steady `pc_out`, and subsequent MEM/WB operand forwarding.
4. **Silicon-to-Simulation Trace Cross-Validation:** Compares cycle-accurate CSV execution traces captured from the hardware ILA against golden simulation logs to verify cycle equivalence.

---

## 5. Future Work & Research Roadmap

- **Arbitrary & Variable-Depth Pipelines:** Generalize the telemetry bus to support deeper pipelines (7+ stages, matching gem5 MinorCPU models) and multi-cycle execution lanes with variable stall durations.
- **Control & Structural Hazards:** Expand probe instrumentation to capture dynamic branch mispredictions, pipeline squashing latency, and memory port contention.
- **Out-of-Order (OoO) Support:** Scale the telemetry architecture to superscalar OoO cores to monitor Reservation Station issue queues and Reorder Buffer (ROB) commit states.
- **On-Chip Bug Localization (IFRA):** Build on Stanford’s *Instruction Footprint Recording and Analysis* (IFRA) methodology by embedding lightweight Footprint Recording Structures (FRSs) on-chip to compress runtime telemetry signatures and automate root-cause debug.