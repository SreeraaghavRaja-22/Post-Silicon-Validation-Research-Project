# Post-Silicon Validation Research Project

Learning:
## Implementation: Minor CPU Pipeline Configuration

To perform strict, deterministic pipeline validation, this project utilizes gem5’s **Minor CPU** model. Unlike complex, speculative architectures, the Minor CPU enforces an in-order execution paradigm with a rigid, configurable pipeline structure. This allows for clean isolation of microarchitectural bottlenecks and precise tracing of instruction progression.

### 1. Architectural Pipeline Framework
The Minor CPU core is structured into a four-stage execution pipeline, which is configured via Python scripts to match the target validation specification:

* **Fetch1 (Fetch & Line Buffer):** Responsible for fetching cache lines from the instruction cache and passing raw bytes into a line buffer.
* **Fetch2 (Decode & Decomposition):** Decompresses instruction stream bytes into discrete machine instructions and handles basic branch prediction.
* **Decode (Argument Parsing):** Decodes instructions into micro-operations (uops) and evaluates register dependencies.
* **Execute (Issue, Functional Execution, & Commit):** An in-order issue stage that dispatches uops to dedicated execution units (ALUs, FPUs, Memory Management Units) and manages final register commitments.

+-----------------------------------------------------------------+
|                       Minor CPU Pipeline                        |
|                                                                 |
|  [ Fetch1 ]  ---->  [ Fetch2 ]  ---->  [ Decode ]  ----> [Execute]
|  (Line Buffer)     (Branch Pred)      (uop Gen)      (In-Order Issue)
+-----------------------------------------------------------------+


### 2. Microarchitectural Tuning parameters
The implementation leverages gem5's configuration scripts to parameterize the Minor CPU pipeline for exact post-silicon alignment. Key modifications include:
* **Pipeline Widths:** Restricting or expanding the `fetch1ToFetch2BackwardDelay`, `fetch2ToDecodeForwardDelay`, and related stage-to-stage bandwidth variables to isolate structural hazards.
* **Execution Functional Units (FUs):** Customizing the `MinorFUPool` to specify the exact number of arithmetic units, their structural latencies, and issue delays to simulate specific hardware execution constraints.
* **Thread Contexts:** Configuring single-threaded operational constraints to guarantee fully deterministic execution timelines during microbenchmark stress testing.

### 3. Execution & Pipeline Trace Telemetry
Validation runs are executed using specialized debug flags to monitor the internal state of the Minor CPU pipeline stages on a cycle-by-cycle basis:

```bash
# Execute simulation while outputting exact pipeline activity and register status
./build/X86/gem5.opt --debug-flags=MinorCPU,MinorTrace,MinorExecute configs/deprecated/example/se.py --c
