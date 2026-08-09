# Instruction Lookup Table

Quick reference for the RV32I instructions implemented in `pipeline.cpp`, grouped by instruction type. All fields are given in hex.

## R-Type (opcode `0x33`)

`funct7` selects between related ops that share a `funct3`. `src2` is always used.

| funct3 | funct7 | Mnemonic | Functionality |
|--------|--------|----------|----------------|
| `0x0`  | `0x00` | ADD  | `rd = rs1 + rs2` |
| `0x0`  | `0x20` | SUB  | `rd = rs1 - rs2` |
| `0x1`  | `0x00` | SLL  | `rd = rs1 << (rs2 & 0x1F)` (shift left logical) |
| `0x2`  | `0x00` | SLT  | `rd = (rs1 < rs2) ? 1 : 0` (signed compare) |
| `0x3`  | `0x00` | SLTU | `rd = (rs1 < rs2) ? 1 : 0` (unsigned compare) |
| `0x4`  | `0x00` | XOR  | `rd = rs1 ^ rs2` |
| `0x5`  | `0x00` | SRL  | `rd = rs1 >> (rs2 & 0x1F)` (shift right logical) |
| `0x5`  | `0x20` | SRA  | `rd = rs1 >> (rs2 & 0x1F)` (shift right arithmetic, sign-extends) |
| `0x6`  | `0x00` | OR   | `rd = rs1 \| rs2` |
| `0x7`  | `0x00` | AND  | `rd = rs1 & rs2` |

## I-Type ALU (opcode `0x13`)

Same `funct3` map as R-type, but the second operand is a sign-extended 12-bit immediate (`imm[11:0]`) instead of `rs2`. Only `funct3 = 0x0` distinguishes ADD from SUB in R-type — I-type has no SUBI (use ADDI with a negative immediate).

| funct3 | Mnemonic | Functionality |
|--------|----------|----------------|
| `0x0` | ADDI  | `rd = rs1 + imm` |
| `0x1` | SLLI  | `rd = rs1 << (imm & 0x1F)` |
| `0x2` | SLTI  | `rd = (rs1 < imm) ? 1 : 0` (signed) |
| `0x3` | SLTIU | `rd = (rs1 < imm) ? 1 : 0` (unsigned) |
| `0x4` | XORI  | `rd = rs1 ^ imm` |
| `0x5` | SRLI  | `rd = rs1 >> (imm & 0x1F)` (logical, funct7 bits of imm = `0x00`) |
| `0x5` | SRAI  | `rd = rs1 >> (imm & 0x1F)` (arithmetic, funct7 bits of imm = `0x20`) |
| `0x6` | ORI   | `rd = rs1 \| imm` |
| `0x7` | ANDI  | `rd = rs1 & imm` |

## Load (opcode `0x03`)

| funct3 | Mnemonic | Functionality |
|--------|----------|----------------|
| `0x2` | LW | `rd = DataMemory[rs1 + imm]` (effective address computed in EX, load happens in MEM) |

## Store (opcode `0x23`)

| funct3 | Mnemonic | Functionality |
|--------|----------|----------------|
| `0x2` | SW | `DataMemory[rs1 + imm] = rs2` (effective address computed in EX, write happens in MEM) |

## Branch (opcode `0x63`)

Comparison and PC redirect are both resolved in the EX stage. `imm` is the sign-extended B-type offset added to the branch's own PC.

| funct3 | Mnemonic | Functionality |
|--------|----------|----------------|
| `0x0` | BEQ  | `if (rs1 == rs2) PC = pc + imm` |
| `0x1` | BNE  | `if (rs1 != rs2) PC = pc + imm` |
| `0x4` | BLT  | `if (rs1 < rs2) PC = pc + imm` (signed) |
| `0x5` | BGE  | `if (rs1 >= rs2) PC = pc + imm` (signed) |
| `0x6` | BLTU | `if (rs1 < rs2) PC = pc + imm` (unsigned) |
| `0x7` | BGEU | `if (rs1 >= rs2) PC = pc + imm` (unsigned) |

## Opcode Summary

| Opcode | Format | Category |
|--------|--------|----------|
| `0x33` | R-type | Register-register ALU |
| `0x13` | I-type | Register-immediate ALU |
| `0x03` | I-type | Load |
| `0x23` | S-type | Store |
| `0x63` | B-type | Branch |

## Not Yet Implemented

JAL (`0x6F`), JALR (`0x67`), LUI (`0x37`), AUIPC (`0x17`), and system/fence instructions are not handled by the current simulator.
