# RAW Hazard Trace Signals — Rationale

This documents why each signal in `raw_hazard_trace.csv` (produced by
`pipeline_core.cpp` / `testbench.cpp`) was chosen, and what question it
answers when debugging a RAW-hazard bug post-silicon.

Everything else needed to reconstruct a RAW hazard (`current_src1`,
`current_src2`, `uses_src2`, the decoded opcode, etc.) is *not* traced
directly — it's derivable offline from the instruction word, which is
already captured by Tier-1 architectural tracing (PC + retiring
instruction). These four signals are the ones that can't be reconstructed
after the fact, because they represent a decision the hardware made in the
moment (a mux select or a stall assertion), not a value that was already
sitting in visible state.

---

## `pipeline_stall`

**What it answers:** *Did a RAW hazard occur at all, this cycle?*

This is the base signal — a single bit that says the hazard-detection logic
fired and the pipeline froze (injected a bubble) rather than letting a
dependent instruction read a stale value. Without this, you can't even tell
a stall happened; every other signal below only matters in cycles where
this is asserted.

## `hazard_dest`

**What it answers:** *Which register caused the stall?*

Once we know a stall happened, this identifies the specific destination
register that the load-in-flight (`ID_EX.dest`) was about to write —
the register the waiting instruction in decode depends on. This narrows
"a hazard occurred" down to "a hazard occurred *because of x11*," which is
what lets you correlate the stall against the actual data dependency in the
instruction stream rather than guessing from the PC alone.

## `forward_A_sel` / `forward_B_sel`

**What they answer:** *Which register's value actually fed each ALU
operand this cycle, and where did it come from?*

These two are the forwarding-mux select signals (`FWD_NONE` / `FWD_MEM` /
`FWD_WB`) for ALU operand1 and operand2 respectively. They're the direct
cause of a wrong result when forwarding — not stalling — is the mechanism
in play: if a bug produces a corrupted architectural value, these signals
tell you which physical source (register file, EX/MEM boundary, or MEM/WB
boundary) the hardware actually selected. That's what lets you localize the
fix to "the wrong mux input was selected" versus "the right mux input held
the wrong value" versus "no forwarding fired when it should have."

In effect, `pipeline_stall` tells you *that* something happened,
`hazard_dest` tells you *which register* was the problem, and
`forward_A_sel`/`forward_B_sel` tell you *which path was chosen to fix it*
(or should have been, if the bug is that the wrong path — or no path — was
selected).
