# Master Submission Guide: Hardware Trojan Detection via Transition-Probability ATPG

## 1. Project Overview & Methodology
This repository contains the complete, reproduction-ready implementation and benchmark evaluation for **Hardware Trojan Detection using Transition-Probability Rare-Node ATPG**. We compare two state-of-the-art algorithms:
1. **ND-ATPG (N-Detect ATPG):** Repeated excitation of rare nodes with diverse pseudo-random fills ($N=10\dots 30$).
2. **MC-ATPG (Maximal Clique ATPG):** Compatibility graph modeling of rare nodes ($G=(V, E)$), Bron-Kerbosch maximal clique discovery with Tomita pivoting, and simultaneous multi-constraint excitation.

Evaluations were performed across 11 benchmark circuits synthesized in **Synopsys Design Compiler (SCL 180nm Standard Cell Library `tsl18fs120_scl`)**, equipped with IEEE 1149.1 full internal scan chains, and verified dynamically in **Synopsys VCS**.

---

## 2. Directory Tree & Schematic / Netlist Path Mapping

Below is the complete path mapping for all architectural schematics, netlists, scan protocols, and testbenches:

| Circuit | Category | Architecture | Leaf Gate Count | Scan Flip-Flops | Primary Inputs | Netlist File Path | Scan Protocol (`.spf`) | Testbench (`.v`) | Schematic Diagram |
| :--- | :--- | :--- | :---: | :---: | :---: | :--- | :--- | :--- | :--- |
| **`c2670`** | Combinational | 12-bit ALU / Controller | 406 | Combinational (0) | 233 | [`circuits/combinational/c2670/c2670.v`](file:///circuits/combinational/c2670/c2670.v) | N/A | [`circuits/combinational/c2670/tb_c2670.v`](file:///circuits/combinational/c2670/tb_c2670.v) | [`docs/schematics/schematic_c2670_alu.png`](file:///docs/schematics/schematic_c2670_alu.png) |
| **`c5315`** | Combinational | 9-bit ALU w/ CLA | 1,162 | Combinational (0) | 178 | [`circuits/combinational/c5315/c5315.v`](file:///circuits/combinational/c5315/c5315.v) | N/A | [`circuits/combinational/c5315/tb_c5315.v`](file:///circuits/combinational/c5315/tb_c5315.v) | [`docs/schematics/schematic_c5315_alu.png`](file:///docs/schematics/schematic_c5315_alu.png) |
| **`c6288`** | Combinational | 16x16 Array Multiplier | 1,779 | Combinational (0) | 32 | [`circuits/combinational/c6288/c6288.v`](file:///circuits/combinational/c6288/c6288.v) | N/A | [`circuits/combinational/c6288/tb_c6288.v`](file:///circuits/combinational/c6288/tb_c6288.v) | [`docs/schematics/schematic_c6288_multiplier.png`](file:///docs/schematics/schematic_c6288_multiplier.png) |
| **`c7552`** | Combinational | 32-bit Comparator & Adder | 1,191 | Combinational (0) | 207 | [`circuits/combinational/c7552/c7552.v`](file:///circuits/combinational/c7552/c7552.v) | N/A | [`circuits/combinational/c7552/tb_c7552.v`](file:///circuits/combinational/c7552/tb_c7552.v) | [`docs/schematics/schematic_c7552_comparator.png`](file:///docs/schematics/schematic_c7552_comparator.png) |
| **`darkriscv`** | Sequential Core | RISC-V RV32E Pipelined | 8,110 | 1,710 | 73 | [`circuits/sequential/darkriscv/synthesised_scan.v`](file:///circuits/sequential/darkriscv/synthesised_scan.v) | [`darkriscv_scan.spf`](file:///circuits/sequential/darkriscv/darkriscv_scan.spf) | [`circuits/sequential/darkriscv/tb_scan.v`](file:///circuits/sequential/darkriscv/tb_scan.v) | [`docs/schematics/schematic_darkriscv_core.png`](file:///docs/schematics/schematic_darkriscv_core.png) |
| **`picorv1`** | Sequential Core | RISC-V RV32IMC Base | 5,659 | 1,513 | 41 | [`circuits/sequential/picorv1/synthesised_scan.v`](file:///circuits/sequential/picorv1/synthesised_scan.v) | [`picorv1_scan.spf`](file:///circuits/sequential/picorv1/picorv1_scan.spf) | [`circuits/sequential/picorv1/tb_scan.v`](file:///circuits/sequential/picorv1/tb_scan.v) | [`docs/schematics/schematic_picorv32_core.png`](file:///docs/schematics/schematic_picorv32_core.png) |
| **`picorv2`** | Sequential Core | RISC-V RV32IMC w/ Mul/Div | 5,834 | 1,567 | 41 | [`circuits/sequential/picorv2/synthesised_scan.v`](file:///circuits/sequential/picorv2/synthesised_scan.v) | [`picorv2_scan.spf`](file:///circuits/sequential/picorv2/picorv2_scan.spf) | [`circuits/sequential/picorv2/tb_scan.v`](file:///circuits/sequential/picorv2/tb_scan.v) | [`docs/schematics/schematic_picorv32_core.png`](file:///docs/schematics/schematic_picorv32_core.png) |
| **`picorv3`** | Sequential Core | RISC-V RV32IMC Full Shifter | 8,110 | 2,189 | 41 | [`circuits/sequential/picorv3/synthesised_scan.v`](file:///circuits/sequential/picorv3/synthesised_scan.v) | [`picorv3_scan.spf`](file:///circuits/sequential/picorv3/picorv3_scan.spf) | [`circuits/sequential/picorv3/tb_scan.v`](file:///circuits/sequential/picorv3/tb_scan.v) | [`docs/schematics/schematic_picorv32_core.png`](file:///docs/schematics/schematic_picorv32_core.png) |
| **`femtorv32`** | Sequential Core | RISC-V RV32I Compact Core | 5,120 | 1,401 | 37 | [`circuits/sequential/femtorv32/synthesised_scan.v`](file:///circuits/sequential/femtorv32/synthesised_scan.v) | [`femtorv32_electron_scan.spf`](file:///circuits/sequential/femtorv32/femtorv32_electron_scan.spf) | [`circuits/sequential/femtorv32/tb_scan.v`](file:///circuits/sequential/femtorv32/tb_scan.v) | [`docs/schematics/schematic_femtorv32_core.png`](file:///docs/schematics/schematic_femtorv32_core.png) |
| **`rsa`** | Sequential IP | Montgomery Mod-Exp Core | 1,285 | 250 | 39 | [`circuits/sequential/rsa/synthesised_scan.v`](file:///circuits/sequential/rsa/synthesised_scan.v) | [`rsa_scan.spf`](file:///circuits/sequential/rsa/rsa_scan.spf) | [`circuits/sequential/rsa/tb_scan.v`](file:///circuits/sequential/rsa/tb_scan.v) | [`docs/schematics/schematic_rsa_core.png`](file:///docs/schematics/schematic_rsa_core.png) |
| **`aes_128`** | Sequential IP | 128-bit Cryptographic Core | 25,740 | 6,720 | 260 | [`circuits/sequential/aes_128/synthesised_scan.v`](file:///circuits/sequential/aes_128/synthesised_scan.v) | [`aes_128_scan.spf`](file:///circuits/sequential/aes_128/aes_128_scan.spf) | [`circuits/sequential/aes_128/tb_scan.v`](file:///circuits/sequential/aes_128/tb_scan.v) | [`docs/schematics/schematic_aes_core.png`](file:///docs/schematics/schematic_aes_core.png) |

---

## 3. How to Run & Reproduce

### A. Simulating a Single Benchmark Circuit (e.g. RSA)
```bash
cd circuits/sequential/rsa
./simulate.sh
```

### B. Master Execution Across All 11 Benchmarks
To execute dynamic simulation verification across all combinational and sequential benchmarks:
```bash
cd scripts
./run_all_benchmarks.sh
```

### C. Re-running Algorithmic MC-ATPG Generation
To re-run maximal clique graph discovery and TetraMAX ATPG pattern generation:
```bash
cd circuits/sequential/rsa
python3 run_mcatpg.py
```

---

## 4. Grounded Experimental Results Summary

### ISCAS-85 Combinational Circuits
| Circuit | Gates | PIs | Patterns (ND / MC) | Feasible Trojans | Activated Trojans (ND / MC) | Overall MIC (%) (ND / MC) | ATPG Gen Time (ND / MC) | VCS Sim Time (ND / MC) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **c2670** | 406 | 233 | 22,466 / 2,328 | 199 | 179 / 163 | **89.95%** / 81.91% | N/A / 9.33s | 2.07s / 1.43s |
| **c5315** | 1,162 | 178 | 32,559 / 4,162 | 200 | 192 / 165 | **96.00%** / 82.50% | N/A / 34.55s | 3.89s / 1.81s |
| **c6288** | 1,779 | 32 | 28,048 / 1,164 | 199 | 198 / 193 | **99.50%** / 96.98% | N/A / 316.25s | 18.14s / 2.92s |
| **c7552** | 1,191 | 207 | 41,589 / 1,684 | 200 | 177 / 161 | **88.50%** / 80.50% | N/A / 38.24s | 3.42s / 1.50s |

### Sequential Full-Scan RISC-V Cores & Cryptographic IPs
| Circuit | Gates | Scan Cells | Patterns (ND / MC) | Scan Cycles (ND / MC) | Feasible Trojans | Activated Trojans (ND / MC) | Overall MIC (%) (ND / MC) | ATPG Gen Time (ND / MC) | VCS Sim Time (ND / MC) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **darkriscv** | 8,110 | 1,710 | 454 / 13,571 | 776,340 / 23,206,410 | 200 | 170 / 185 | 85.00% / **92.50%** | 6.05s / 14.21s | 213.63s / 4,578.85s |
| **picorv1** | 5,659 | 1,513 | 424 / 857 | 641,512 / 1,296,641 | 500 | 438 / 423 | **87.60%** / 84.60% | 4.03s / 9.52s | 63.81s / 153.01s |
| **picorv2** | 5,834 | 1,567 | 432 / 82 | 676,944 / 128,494 | 500 | 188 / 336 | 37.60% / **67.20%** | 4.23s / 6.91s | 113.23s / 22.16s |
| **picorv3** | 8,110 | 2,189 | 454 / 4 | 993,806 / 8,756 | 500 | 27 / 65 | 5.40% / **13.00%** | 5.63s / 73.87s | 15.41s / 4.77s |
| **femtorv32** | 5,120 | 1,401 | 5 / 326 | 7,005 / 456,726 | 500 | 83 / 426 | 16.60% / **85.20%** | 3.87s / 24.82s | 4.06s / 125.59s |
| **rsa** | 1,285 | 250 | 343 / 95 | 85,750 / 23,750 | 500 | 456 / 329 | **91.20%** / 65.80% | 100.64s / 11.54s | 60.58s / 19.02s |
| **aes_128** | 25,740 | 6,720 | 1,363 / 1 | 9,159,360 / 6,720 | 500 | 15 / 88 | 3.00% / **17.60%** | 112.11s / 370.70s | 1,470.53s / 11.41s |

---

## 5. Architectural Schematics Directory (`docs/schematics/`)

# Hardware Trojan Detection Project

## Folder Structure

```text
Hardware-Trojan/
├── README.md
├── circuits/
│   ├── combinational/
│   │   ├── c2670/
│   │   │   ├── c2670.v
│   │   │   └── tb_c2670.v
│   │   ├── c5315/
│   │   │   ├── c5315.v
│   │   │   └── tb_c5315.v
│   │   ├── c6288/
│   │   │   ├── c6288.v
│   │   │   └── tb_c6288.v
│   │   └── c7552/
│   │       ├── c7552.v
│   │       └── tb_c7552.v
│   └── sequential/
│       ├── aes_128/
│       │   ├── aes_128_scan.spf
│       │   ├── synthesised_scan.v
│       │   └── tb_scan.v
│       ├── darkriscv/
│       │   ├── darkriscv_scan.spf
│       │   ├── synthesised_scan.v
│       │   └── tb_scan.v
│       ├── femtorv32/
│       │   ├── femtorv32_electron_scan.spf
│       │   ├── synthesised_scan.v
│       │   └── tb_scan.v
│       ├── picorv1/
│       │   ├── picorv1_scan.spf
│       │   ├── synthesised_scan.v
│       │   └── tb_scan.v
│       ├── picorv2/
│       │   ├── picorv2_scan.spf
│       │   ├── synthesised_scan.v
│       │   └── tb_scan.v
│       ├── picorv3/
│       │   ├── picorv3_scan.spf
│       │   ├── synthesised_scan.v
│       │   └── tb_scan.v
│       └── rsa/
│           ├── rsa_scan.spf
│           ├── synthesised_scan.v
│           └── tb_scan.v
├── results/
│   ├── SUMMARY_RESULTS.md
│   ├── logs/
│   └── plots/
├── scripts/
│   └── run_all_benchmarks.sh
└── .git/
```

All architectural diagram assets and schematics are indexed below and located in [`docs/schematics/`](file:///docs/schematics):
- `schematic_hardware_trojan_anatomy.png`: Trojan trigger network (AND tree of rare nets) and malicious XOR/MUX payload.
- `schematic_scan_dft_chain.png`: IEEE 1149.1 full-scan architecture with scan shift, capture pulse, and test controls.
- `schematic_overall_flow.png`: Complete end-to-end flow from transition profiling to DC synthesis, TetraMAX, and VCS.
- `schematic_nd_atpg_architecture.png`: ND-ATPG algorithm flow with repeated random-fill excitation.
- `schematic_mc_atpg_clique_graph.png`: Bron-Kerbosch maximal clique graph formulation and multi-target constraint generation.
- `schematic_c2670_alu.png`: ISCAS-85 c2670 12-bit ALU and Controller logic architecture.
- `schematic_c5315_alu.png`: ISCAS-85 c5315 9-bit ALU with carry-lookahead generator schematic.
- `schematic_c6288_multiplier.png`: ISCAS-85 c6288 16x16 array multiplier block diagram.
- `schematic_c7552_comparator.png`: ISCAS-85 c7552 32-bit comparator/adder logic architecture.
- `schematic_darkriscv_core.png`: DarkRISCV 32-bit pipelined RISC-V core schematic with full-scan registers.
- `schematic_picorv32_core.png`: PicoRV32 processor core architecture showing ALU, register file, and scan chains.
- `schematic_femtorv32_core.png`: FemtoRV32 compact processor architecture with multiplier/divider logic.
- `schematic_rsa_core.png`: Montgomery Modular Exponentiation cryptographic accelerator schematic.
- `schematic_aes_core.png`: AES-128 round-based cryptographic hardware accelerator schematic.

---

## 6. Grounded Future & Remaining Work Roadmaps

1. **End-to-End Scalable MC-ATPG Engine Implementation & Coverage Optimization:**
   - Implement dynamic sub-clique relaxation and iterative constraint packing to eliminate over-constraint in dense compatibility graphs, maximizing MC-ATPG coverage across large multi-trigger Trojan suites ($q \ge 3$).
2. **Scaling ND-ATPG Execution to Ultra-Large Benchmark Circuits:**
   - Execute ND-ATPG on larger industrial benchmarks (ITC'99 `b17`, `b18`, `b19`, and open-source multi-core SoC designs) by introducing partitioned test pattern generators and bounded pin-flipping to prevent pattern explosion.
3. **Transition-Probability Rare-Node Detection in Sequential Circuits:**
   - Develop sequential rare-node identification that natively handles cyclic state transitions, unclocked retention registers, and reachability invariants without relying exclusively on full-scan test mode assumptions.
4. **Algorithmic Filtering of Fake Rare Signals (False Positives):**
   - Implement functional dependency filtering to prune statically correlated, clock-gated, or fixed-mode signals (e.g., reset trees, test-mode enables, constant tie cells) that appear statistically rare but cannot trigger independent hardware Trojans.
5. **Comprehensive Dynamic Simulation & Coverage Closure Across All Circuits:**
   - Extend cycle-accurate VCS gate-level dynamic simulations to complete 100% trigger coverage closure across all combinational, pipelined sequential, and cryptographic accelerators with accelerated parallel testbench architectures.
