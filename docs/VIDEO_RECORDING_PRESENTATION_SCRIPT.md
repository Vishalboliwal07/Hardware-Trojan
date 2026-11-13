# Master Video Recording Presentation Script: Hardware Trojan Detection

**Project Title:** Hardware Trojan Detection via Transition-Probability Rare-Node ATPG: An Empirical Study of ND-ATPG vs. MC-ATPG in SCL 180nm  
**Target Duration:** 18 – 20 Minutes  
**Presenters:**
- **Speaker 1 (Pranay):** Front-End ASIC Design, Logic Synthesis (Synopsys Design Compiler), Scan Insertion (IEEE 1149.1 TestMAX DFT), Transition-Probability Rareness Profiling, ISCAS-85 Combinational Benchmark Evaluation.
- **Speaker 2 (Vishal):** Algorithmic Formulation (ND-ATPG vs. MC-ATPG), Graph Theory & Bron-Kerbosch Cliques, Synopsys TetraMAX Scripting, STIL Pattern Extraction, Dynamic Gate-Level VCS Verification, Multi-Agent Correctness Auditing.

---

## Video Recording Agenda & Timestamp Breakdown

| Timestamp | Slide | Topic | Speaker |
| :---: | :---: | :--- | :---: |
| **00:00 – 01:30** | Slide 1 | Formal Introductions, Team Ownership & Scope | Both Speakers |
| **01:30 – 03:00** | Slide 2 | The Hardware Security Threat Model & Outsourced Foundry Crisis | Speaker 1 |
| **03:00 – 04:30** | Slide 3 | Transition-Probability Rareness Metric & Circuit Benchmark Taxonomy | Speaker 1 |
| **04:30 – 06:00** | Slide 4 | Hardware Trojan Injection Engine: Trigger & Payload Architecture | Speaker 1 |
| **06:00 – 07:30** | Slide 5 | Scan Chain DFT Mechanics: IEEE 1149.1 Scan Cells & Test Modes | Speaker 1 |
| **07:30 – 09:00** | Slide 6 | Algorithmic Formulations: ND-ATPG vs. MC-ATPG (Bron-Kerbosch) | Speaker 2 |
| **09:00 – 10:30** | Slide 7 | Critical Flaws in Author's Published MC-ATPG Implementation | Speaker 2 |
| **10:30 – 12:00** | Slide 8 | Dynamic Gate-Level Simulation (Synopsys VCS) & Monitor Task | Speaker 2 |
| **12:00 – 13:30** | Slide 9 | Experimental Results: ISCAS-85 Combinational Benchmarks | Speaker 2 |
| **13:30 – 15:00** | Slide 10 | Experimental Results: Sequential Full-Scan RISC-V Cores & Cryptos | Speaker 2 |
| **15:00 – 16:30** | Slide 11 | Algorithmic Runtime Analysis & The Scan DFT Speedup Explained | Speaker 1 |
| **16:30 – 18:00** | Slide 12 | Future & Remaining Work (Faculty & TA Directives) | Speaker 1 |
| **18:00 – 19:30** | Slide 13 | Deliverables Manifest, Engineering Recommendations & Conclusion | Both Speakers |

---

## Detailed Word-for-Word Speaking Script

### [00:00 - 01:30] Slide 1: Formal Introductions, Team Roles & Project Scope
**[Visual: Title Slide showing Project Banner, Circuit Schematics, SCL 180nm Logo, Team Names]**

**Speaker 1 (Pranay):**
> "Good morning respected evaluation panel, Prof. Ma'am, and teaching assistants.
> My name is **Pranay**. In this project, I was responsible for the front-end ASIC design, logic synthesis targeting the SCL 180nm standard cell library using Synopsys Design Compiler, IEEE 1149.1 full internal scan chain insertion via TestMAX DFT, dynamic transition-probability rare-node profiling in Synopsys VCS, and the evaluation of the ISCAS-85 combinational benchmark family."

**Speaker 2 (Vishal):**
> "Good morning everyone. My name is **Vishal**.
> In this project, I led the algorithmic test generation engine, implementing both $N$-Detect ATPG and graph-theoretic Maximal Clique ATPG with Bron-Kerbosch maximal clique discovery. I also developed the automated Synopsys TetraMAX constraint generation pipelines, STIL vector parsing, cycle-accurate post-synthesis gate-level simulation testbenches, and cross-circuit multi-agent audit verifications."

**Speaker 1 (Pranay):**
> "Together, our research focuses on: *Hardware Trojan Detection via Transition-Probability Rare-Node ATPG: An Empirical Study of ND-ATPG vs. MC-ATPG in SCL 180nm*.
> Today, we present our complete reproduction, algorithmic corrections, experimental evaluation across 11 complex circuits, and address all feedback given by Ma'am and the TAs."

---

### [01:30 - 03:00] Slide 2: The Hardware Security Threat Model & Outsourced Foundry Crisis
**[Visual: Semiconductor Supply Chain Flowchart + Attack Vector Infographic]**

**Speaker 1 (Pranay):**
> "To understand why this work is critical, we must look at the modern semiconductor supply chain. Today, semiconductor design is completely disaggregated. Fabrication is routinely outsourced to third-party offshore foundries.
> This opens a catastrophic zero-trust security vulnerability: an adversary inside the foundry can insert a Hardware Trojan by subtly modifying lithographic masks—altering doping levels or routing parasitics—with zero functional disruption during standard testing and zero area overhead.
> 
> Why do standard manufacturing tests fail?
> Commercial ATPG tools generate tests targeting **Stuck-At Faults (SAF)** and **Transition Delay Faults (TDF)**. To minimize test costs, ATPG engines use aggressive pattern compaction—such as `-merge high`—to achieve 99% fault coverage with the minimum possible number of test vectors.
> Compaction intentionally avoids toggling internal nodes unnecessarily. But a Hardware Trojan trigger is composed of rare signals that almost never activate during normal operation!
> Mathematically, if a Trojan trigger requires $k=4$ rare conditions each with probability $P(n_i = v_i) = 10^{-3}$, the joint random activation probability is $10^{-12}$. A standard manufacturing test set of $10^5$ cycles has a detection probability of $10^{-7}$—virtually zero.
> Therefore, targeted rare-node activation ATPG is mandatory."

---

### [03:00 - 04:30] Slide 3: Transition-Probability Rareness Metric & Circuit Benchmark Taxonomy
**[Visual: Signal Probability Distribution Curve + Table of 11 Benchmark Circuits]**

**Speaker 1 (Pranay):**
> "Rather than using simplistic static probabilities that only count logical 0s and 1s, we profile **Dynamic Transition-Probability Switching Activity**.
> In sequential processors, lines frequently remain static for long durations. We simulate 100,000 functional cycles in Synopsys VCS with realistic software workloads. A node is classified as **Rare** if its toggle probability falls below our threshold $\theta \le 0.15$.
> 
> We evaluated our methodologies across **11 benchmark circuits** across two distinct classes:
> First, **ISCAS-85 Combinational Benchmarks**: `c2670` (12-bit ALU), `c5315` (9-bit ALU with CLA), `c6288` (16x16 array multiplier with 124 logic levels), and `c7552` (32-bit comparator/adder).
> Second, **Sequential RISC-V Microprocessors and Cryptographic IPs**:
> `darkriscv` (32-bit pipelined RISC-V RV32E core, 8,110 gates, 1,710 scan flip-flops),
> three configurations of `picorv32` (`picorv1` base, `picorv2` with hardware mul/div, and `picorv3` with full barrel shifter),
> `femtorv32_electron` (compact RISC-V RV32I core),
> `rsa` (Montgomery modular exponentiation crypto core), and
> `aes_128` (128-bit cryptographic accelerator with 25,740 gates and 6,720 scan flip-flops).
> Every circuit was synthesized into SCL 180nm standard cells."

---

### [04:30 - 06:00] Slide 4: Hardware Trojan Injection Engine: Trigger & Payload Architecture
**[Visual: `schematic_hardware_trojan_anatomy.png` showing $k$-input AND Trigger and XOR Payload Gate]**

**Speaker 1 (Pranay):**
> "To guarantee objective, un-biased verification, every benchmark circuit contains an independent, locked test suite of **500 feasible Hardware Trojans** archived in `locked_trojans.json`.
> Each Trojan consists of two explicit functional elements:
> 1. **A Multi-Input Rare Trigger Network:** An AND-tree of $k$ rare internal nets with specific rare polarities. We benchmark across four distinct trigger complexity quotas:
>    - $q=1$: $k=2$ rare inputs ($125$ Trojans)
>    - $q=2$: $k=3$ rare inputs ($125$ Trojans)
>    - $q=3$: $k=4$ rare inputs ($125$ Trojans)
>    - $q=4$: $k=5$ rare inputs ($125$ Trojans)
> 2. **A Malicious Payload Gate:** An XOR gate or multiplexer tied to a victim critical signal (such as a program counter bit or cryptographic key register).
> Crucially, our generator checks structural and combinational feasibility: no mutually exclusive nets (e.g., $A=1 \land \overline{A}=1$) are ever grouped into a trigger."

---

### [06:00 - 07:30] Slide 5: Scan Chain DFT Mechanics: IEEE 1149.1 Scan Cells & Test Modes
**[Visual: `schematic_scan_dft_chain.png` showing `scl_sdfnr` flip-flops, SI, SO, and SE controls]**

**Speaker 1 (Pranay):**
> "Now let us examine the Design-For-Test (DFT) architecture.
> In sequential circuits, deeply nested flip-flops cannot be directly set or observed from chip pins.
> During synthesis in Synopsys Design Compiler, we replace all standard registers (`scl_dffr`) with scan-equivalent flip-flops (`scl_sdfnr`) equipped with an internal 2-to-1 multiplexer controlled by `scan_enable`.
> When `scan_enable = 1`, all flip-flops form a serial shift register connecting `scan_in` to `scan_out`.
> 
> Dynamic test application follows a strict 3-phase cycle:
> 1. **Scan Shift Phase:** `scan_enable` is asserted for $L$ clock cycles (where $L$ is scan length, e.g., 1,710 cycles for DarkRISCV). The test vector is serially loaded into internal registers.
> 2. **Capture Setup & Trojan Evaluation:** `scan_enable` is de-asserted to 0. Primary inputs are applied. We allow 1ns for combinational logic to settle to steady-state. At this exact moment, all 500 Trojan triggers are evaluated.
> 3. **Capture Pulse:** A single system clock pulse captures circuit responses back into the flip-flops, followed by scan-out shift.
> I will now hand over to Vishal to explain the ATPG algorithms and experimental results."

---

### [07:30 - 09:00] Slide 6: Algorithmic Formulations: ND-ATPG vs. MC-ATPG (Bron-Kerbosch)
**[Visual: `schematic_mc_atpg_clique_graph.png` showing compatibility graph, Bron-Kerbosch maximal cliques, and TetraMAX TCL flow]**

**Speaker 2 (Vishal):**
> "Thank you Pranay. Let us look at how test patterns are generated.
> We implemented and compared two algorithmic paradigms:
> 
> 1. **ND-ATPG ($N$-Detect Rare-Node ATPG):**
> In ND-ATPG, each rare node is targeted individually in Synopsys TetraMAX to force its rare value ($v \in \{0, 1\}$). TetraMAX generates $N$ diverse patterns per rare node using randomized decision heuristics (`-decision random -fill random`). By applying multiple diverse patterns ($N = 10\dots 30$), secondary nets have repeated opportunities to randomly align with rare states.
> 
> 2. **MC-ATPG (Maximal Clique ATPG):**
> Rather than relying on random chance, MC-ATPG models rare node relationships using **Graph Theory**:
> - We construct a Compatibility Graph $G = (V, E)$, where each vertex $v \in V$ represents a rare node assignment $(n_i = val_i)$.
> - An edge $e = (u, v)$ exists if and only if both rare assignments are simultaneously satisfiable in TetraMAX.
> - We execute the **Bron-Kerbosch Maximal Clique Enumeration Algorithm** with Tomita pivoting to find maximal cliques of mutually compatible rare nodes.
> - Because realistic Trojan triggers are bounded ($k \le 4$), we decompose maximal cliques into sub-cliques of size $k \le 4$ and apply them as simultaneous ATPG constraints in TetraMAX (`add_atpg_constraints`). This forces the ATPG solver to simultaneously satisfy multiple rare conditions in a single compact vector!"

---

### [09:00 - 10:30] Slide 7: Critical Flaws in the Original Author's MC-ATPG Implementation
**[Visual: Code Comparison Card: Author's Flawed Script vs. Our Robust Engine]**

**Speaker 2 (Vishal):**
> "During our second-order audit of the IEEE TCAD 2023 paper and the author's reference scripts, we discovered three critical technical flaws:
> 
> 1. **Illegal Pin Driving Constraints:** The author's script constrained internal net names directly in TetraMAX without mapping them to standard-cell driving output pins (`Z`, `ZN`, `Q`). In industrial EDA tools, TetraMAX only accepts cell instance pins (`U12/ZN`). Constraining raw nets caused silent syntax errors in TetraMAX, generating unconstrained random vectors! We fixed this by building a full regex standard-cell netlist pin-mapping engine (`build_net_to_pin_mapping`).
> 2. **Over-Constrained Cliques:** The original paper attempted to force 10 to 20 rare nodes simultaneously in a single ATPG run. This caused ATPG aborts (`ATPG-ABORT`), collapsing coverage to zero. We instituted bounded sub-clique partitioning ($k \le 4$), preventing over-constraint.
> 3. **Non-Scan Sequential Explosion:** The authors attempted sequential ATPG without scan chains (`full_seq_atpg`), which required 500 to 4,500 minutes due to multi-frame unrolling. By integrating full IEEE 1149.1 scan insertion, we reduced test generation to combinational complexity, completing in seconds to minutes!"

---

### [10:30 - 12:00] Slide 8: Dynamic Gate-Level Simulation (Synopsys VCS) & Monitor Task
**[Visual: VCS Simulation Waveform & Verilog Testbench Code Snippet]**

**Speaker 2 (Vishal):**
> "To guarantee 100% scientific integrity, we do not estimate Trojan coverage from ATPG reports. Instead, we execute **Dynamic Zero-Delay Gate-Level Simulation in Synopsys VCS**.
> Every testbench (`tb_scan.v` and `tb_<circuit>.v`) instantiates the synthesized standard-cell netlist along with the SCL 180nm simulation model (`tsl18fs120_scl.v`).
> At every capture clock cycle, the testbench invokes a dedicated `check_trojans` task containing all 500 inlined trigger monitors.
> Crucially, our monitors use **Verilog Case Equality (`===`)** rather than standard equality (`==`).
> Why? Standard equality treats unknown (`1'bX`) or high-impedance (`1'bZ`) states as potentially true, causing false-positive Trojan detections. Case equality guarantees that a Trojan is counted as triggered if and only if every rare net is driven to its exact physical binary logic level (`0` or `1`)."

---

### [12:00 - 13:30] Slide 9: Experimental Results: ISCAS-85 Combinational Benchmarks
**[Visual: ISCAS-85 Comparison Table + Log-Scale Efficiency Bar Chart]**

**Speaker 2 (Vishal):**
> "Now let us examine the experimental results.
> First, on the ISCAS-85 Combinational Benchmarks:
> - In `c2670`, ND-ATPG applied 22,466 patterns and activated 179 / 199 Trojans (89.95% coverage). MC-ATPG applied only **2,328 patterns**—a **9.6x vector reduction**—achieving 70.35% coverage.
> - In `c5315`, ND-ATPG required 32,559 patterns for 96.00% coverage. MC-ATPG required only **4,162 patterns**—a **7.8x reduction**—achieving 82.00% coverage.
> - In `c6288` (the 16x16 multiplier), ND-ATPG required 28,048 patterns (99.50% coverage). MC-ATPG achieved **84.92% coverage with just 1,164 patterns**—a massive **24.1x compression ratio**!
> - Across all combinational circuits, MC-ATPG achieved 80–85% of ND-ATPG's coverage while using less than 5–10% of the vector volume."

---

### [13:30 - 15:00] Slide 10: Experimental Results: Sequential Full-Scan RISC-V Cores & Cryptos
**[Visual: Sequential Cores Master Comparison Table + Coverage Breakdown Curves]**

**Speaker 2 (Vishal):**
> "Next, let us look at the Sequential RISC-V Cores and Cryptographic IPs:
> - In **`darkriscv`**, MC-ATPG outperformed ND-ATPG, achieving **92.50% Trojan coverage (185 / 200)** versus 85.00% (170 / 200) for ND-ATPG, with near-perfect detection of complex 4-trigger and 5-trigger Trojans.
> - In **`femtorv32`**, ND-ATPG suffered a catastrophic failure with only 5 patterns generated and 16.60% coverage. In sharp contrast, MC-ATPG generated 326 patterns and achieved **85.20% coverage (426 / 500 Trojans)**!
> - In **`picorv2`** (with hardware multiplier), MC-ATPG achieved **67.20% coverage with only 82 patterns**, compared to ND-ATPG's 37.60% with 432 patterns—a **5.3x vector compaction with a 29.6% absolute coverage increase**!
> - In **`rsa`**, MC-ATPG achieved 65.80% coverage with just 95 patterns (23,750 scan cycles) compared to 343 patterns for ND-ATPG.
> - In **`aes_128`**, the 25,740-gate core with 6,720 scan flip-flops, MC-ATPG required just 1 pattern (6,720 scan cycles) to activate 88 Trojans (17.60% coverage), whereas ND-ATPG required 1,363 patterns (over 9 million scan cycles) for only 15 Trojans (3.00% coverage).
> These results decisively prove the algorithmic superiority of Maximal Clique partitioning over random-fill multi-detect ATPG."

---

### [15:00 - 16:30] Slide 11: Algorithmic Runtime Analysis & The Scan DFT Speedup Explained
**[Visual: `plots/mcatpg_stage_timing_breakdown.png` and Log-Scale Runtime Chart]**

**Speaker 1 (Pranay):**
> "Let us now address the runtime analysis.
> In the published IEEE TCAD 2023 paper, the authors reported runtimes ranging from 500 to over 4,500 minutes (~8 to 75 hours).
> In our framework, total MC-ATPG generation completed in:
> - `c2670`: 9.33 seconds
> - `c5315`: 34.55 seconds
> - `c6288`: 316.25 seconds
> - `darkriscv`: 14.21 seconds
> - `femtorv32`: 24.82 seconds
> - `rsa`: 11.54 seconds
> 
> What explains this 1,000x speedup?
> 1. **Combinational DFT Decoupling:** The authors ran `full_seq_atpg` without scan chains. TetraMAX was forced to unroll state transition graphs across 20 to 50 clock cycles, causing exponential state-space explosion. By inserting full IEEE 1149.1 scan chains, every internal register is directly controllable and observable. ATPG operates strictly on combinational logic, executing in seconds.
> 2. **Algorithmic Profiling:** Our stage timing breakdown reveals that Bron-Kerbosch maximal clique discovery takes under **0.001 seconds**! The primary bottleneck is TetraMAX's internal SAT solver during multi-constraint clique ATPG, which scales gracefully with circuit gate count."

---

### [16:30 - 18:00] Slide 12: Dedicated Future & Remaining Work (Faculty & TA Directives)
**[Visual: Future Work Action Plan Card with 4 Architectural Pillars]**

**Speaker 1 (Pranay):**
> "During project reviews, Ma'am and the Teaching Assistants provided invaluable guidance on limitations and next steps. We have synthesized these directives into four dedicated pillars of Future Work:
> 
> 1. **Physical Layout & DRC/LVS Verification (Innovus / IC Compiler II):**
>    - While our synthesis confirmed minimal gate-level overhead (<0.5%), layout parasitic extraction (SPEF) is required to evaluate actual silicon area, clock-tree routing congestion, and timing closure under process variations.
> 2. **Payload Effect Propagation to Primary Observability Points:**
>    - Current state-of-the-art focuses on Trojan trigger activation. However, to detect a Trojan during manufacturing, the corrupted payload effect must propagate to a chip primary output or scan-out pin. We plan to formulate a joint 2-phase ATPG engine that couples trigger excitation with Boolean Difference payload observability constraints.
> 3. **Scan Shift Power & Thermal Profiling:**
>    - Shifting high-entropy test patterns through scan chains can cause excessive toggle activity, potentially exceeding peak thermal dissipation limits. We plan to perform dynamic power analysis using Synopsys PrimeTime PX and integrate low-power X-filling techniques.
> 4. **Graph Neural Network (GNN) Rare-Node Clustering:**
>    - For billion-transistor SoCs, pairwise compatibility checking scales quadratically ($O(n^2)$). We plan to implement GNN node embeddings to predict rare-node compatibility directly from the RTL netlist topology without explicit ATPG satisfiability calls."

---

### [18:00 - 19:30] Slide 13: Deliverables Manifest, Engineering Recommendations & Conclusion
**[Visual: Final Submission Manifest Card, Git Tree, Zip Archive & Acknowledgements]**

**Speaker 2 (Vishal):**
> "In conclusion, our study demonstrates that graph-theoretic Maximal Clique ATPG provides significant pattern compaction (up to 24x) and superior detection coverage on complex sequential processors compared to traditional multi-detect ATPG.
> 
> All project deliverables have been packaged into a 100% verified, reproducible archive:
> 1. **Synthesized SCL 180nm Netlists & DFT Protocols** for all 11 circuits.
> 2. **Standalone MC-ATPG Generation Scripts** with parameterized PDK paths.
> 3. **Cycle-Accurate VCS Simulation Testbenches** with all 500 inlined monitors and relative `$readmemb` paths.
> 4. **Architectural Schematics Directory** (`docs/schematics/`) mapping all circuits.
> 5. **Comprehensive Presentation Deck (`.pptx`) and Technical Dossier (`.md`)**.
> 6. **Complete Submission Zip Archive (`VLSI_hardware_trojan_final_submission.zip`)**.
> 
> We thank Prof. Ma'am and our TAs for their continuous support and guidance throughout this semester. We are now open for questions."
