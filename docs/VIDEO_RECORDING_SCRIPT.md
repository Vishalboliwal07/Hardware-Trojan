# Master 27-Slide Video Recording Presentation Script: Hardware Trojan Detection

**Project Title:** Hardware Trojan Detection via Transition-Probability ATPG: An Empirical Study of ND-ATPG vs. MC-ATPG in SCL 180nm  
**Course:** EE 617: Advanced VLSI Design & Silicon Testing, IIT Gandhinagar  
**Course Faculty:** Prof. Joycee Mekie  
**Presenters:** Vishal Boliwal (Roll 24110080) & Pranay Patil (Roll 24110252)  
**Total Slides:** 27 Slides  
**Total Spoken Word Count:** 4,845 words  
**Estimated Video Duration:** ~33.4 Minutes (at natural speaking pace of ~140–150 words/min)  
**Verification Status:** All spoken scripts match the embedded Speaker Notes in `Hardware_Trojan_Detection_Final_Presentation_Updated.pptx` 100%.  

---

## Complete Slide-by-Slide Spoken Recording Script

### Slide 1: Title Slide
* **Spoken Word Count:** 162 words (~1.1 minutes)
* **Spoken Script (Natural Spoken English):**

> "Good morning Professor Mekie, teaching assistants, and everyone on the panel. I am Vishal, and together with my project partner Pranay I will present our EE 617 course project."
>
> "Our project is on hardware Trojan detection. We took a paper by Jayasena and Mishra, published in IEEE Transactions on CAD in 2023, and reproduced its two test generation methods, called ND-ATPG and MC-ATPG, using the SCL 180 nanometre digital standard cell library."
>
> "Pranay worked on front-end logic synthesis, scan chain insertion and dynamic rare-node profiling in VCS. I worked on the ATPG engines in TetraMAX, the graph clique algorithms, and cycle-accurate gate-level simulation."
>
> "The talk has four main parts. First, the threat model and the problem of stealthy triggers. Second, a step-by-step walk through how we implemented the complete detection flow across all six stages. Third, our empirical results on eleven benchmark circuits and an honest, rigorous comparison with the paper. And last, the remaining work and our grounded future research roadmap."

---

### Slide 2: Hardware Security Threat Model & The Outsourced Foundry Crisis
* **Spoken Word Count:** 199 words (~1.4 minutes)
* **Spoken Script (Natural Spoken English):**

> "Let me start with why this problem matters. Today most chip companies do not own a fab. They write the design, and then the synthesis, layout, and fabrication are done by third parties. At any of these stages, somebody can add a few extra gates to the design. That extra logic is called a hardware Trojan."
>
> "A Trojan has two parts: a trigger and a payload. The trigger is built from signals that almost never take a certain value during functional operation. So during normal testing the Trojan stays silent, and the chip looks perfectly fine."
>
> "The right side shows why random testing does not help. Suppose the trigger uses four signals, and each one has a toggle probability of one in a thousand. The chance that all four are active together under random vectors is ten to the power minus twelve. Even with a regression suite of a hundred thousand test patterns, the mathematical probability of hitting it is practically zero—about 0.00001%."
>
> "So we cannot wait for the trigger to happen by luck. We have to generate patterns that deterministically force these rare signals on purpose. That is what the paper proposes, and that is what we implemented."

---

### Slide 3: End-to-End Implementation Pipeline
* **Spoken Word Count:** 241 words (~1.7 minutes)
* **Spoken Script (Natural Spoken English):**

> "This slide is the map for the rest of the presentation. Our flow has six stages, and I will go through each one."
>
> "Step one: we synthesise each design with Design Compiler to the SCL 180 nanometre library, and for sequential designs we insert an IEEE 1149.1 full internal scan chain."
>
> "Step two: we simulate the gate-level netlist in VCS for a hundred thousand clock cycles and find which nets are rare."
>
> "Step three: we insert locked Trojans whose triggers are built from these rare nets, and we verify every trigger in TetraMAX so that logically impossible, unsatisfiable candidates are discarded."
>
> "Step four: we map every rare net to the physical cell pin that drives it, because TetraMAX requires instance pins rather than internal wire names."
>
> "Step five: we generate test patterns in TetraMAX using two methods, ND-ATPG and MC-ATPG."
>
> "Step six: we replay all generated patterns in gate-level simulation in VCS and physically count how many Trojans got triggered."
>
> "The paper has the same general stages, but there are four key differences. First, we work only at gate level, so we handle rare signals and not rare RTL branches. Second, we use full scan, while the paper uses non-scan designs. Third, we measure coverage exclusively by dynamic simulation in VCS, never relying on ATPG summary reports. And fourth, we map nets to cell driving pins without altering the netlist, whereas the paper routed rare nets to extra primary output ports."

---

### Slide 4: Benchmark Circuits & Synthesis Flow in SCL 180nm
* **Spoken Word Count:** 206 words (~1.4 minutes)
* **Spoken Script (Natural Spoken English):**

> "Before examining the steps, let us look at the circuits and how we prepared them."
>
> "We used eleven circuits. Four are combinational circuits from the ISCAS-85 benchmark suite: c2670, c5315, c6288 which is a sixteen by sixteen array multiplier, and c7552 which is an adder and comparator. They have between four hundred and eighteen hundred standard cell gates in our library."
>
> "The other seven are sequential cores. There is DarkRISCV, three configurations of the PicoRV32 processor, FemtoRV32, an RSA modular exponentiation cryptographic core, and AES-128. AES is the largest design in our suite, with about twenty-five thousand gates and six thousand seven hundred flip-flops."
>
> "All designs were synthesised with Synopsys Design Compiler to SCL 180 nanometre standard cells. For the sequential cores, every functional flip-flop was replaced by an SCL scan flip-flop and stitched into an IEEE 1149.1 internal scan chain. Design Compiler produces two key deliverables for each core: the scan netlist, and a STIL procedure file that tells TetraMAX how to shift and clock the scan chain."
>
> "One architectural point is critical: the exact same netlist is used for transition profiling, for ATPG, and for VCS simulation. Because of this, instance names and net paths match across all three EDA tools without translation errors."

---

### Slide 5: Step 1: Rareness Profiling in VCS
* **Spoken Word Count:** 218 words (~1.5 minutes)
* **Spoken Script (Natural Spoken English):**

> "Step one of detection is to find the rare signals."
>
> "We take the synthesised gate-level netlist and simulate it in VCS for one hundred thousand clock cycles under random input patterns. For every internal net, we count how many cycles it spends at zero and how many at one. From that we calculate the exact probability of each state."
>
> "If the probability of taking a value is below a threshold theta, we call that net rare for that value. Our threshold is between 0.15 and 0.20, which matches the 0.2 used in the paper. We support both polarities: a net that is rarely zero, and a net that is rarely one."
>
> "From this profiling list we take the thirty rarest conditions in each circuit. These thirty become the targets for test generation."
>
> "I want to be transparent about two limitations. First, the paper profiles around three hundred to five hundred rare signals per ISCAS circuit, whereas we keep the thirty rarest to bound the pairwise graph size. Second, we must remove fake rare signals. Nets that are tied to ground or power, or held fixed during functional simulation, appear with probability zero. If constrained, they break the ATPG solver. We added threshold filtering to discard constant tautologies, and we will address full structural constant propagation in future work."

---

### Slide 6: Hardware Trojan Injection Engine & Satisfiability Feasibility
* **Spoken Word Count:** 181 words (~1.2 minutes)
* **Spoken Script (Natural Spoken English):**

> "Step two is creating the fixed Trojan benchmarks that we will evaluate."
>
> "To ensure fair comparison, both ND-ATPG and MC-ATPG must be tested on the exact same targets. Each Trojan trigger is a multi-input AND condition of rare nets taken from the profiling list, and the payload is an XOR or multiplexer that corrupts functional logic upon activation."
>
> "We generated four tiers of difficulty. Tier q equals one uses two rare nets in the trigger. Tier two uses three, tier three uses four, and tier four uses five rare nets. More trigger inputs make the Trojan exponentially more stealthy and harder to activate."
>
> "Crucially, not every combination of rare nets is physically realizable. For example, if two rare conditions require opposite logic levels on the same shared driving gate, that trigger can never fire in silicon. To prevent testing against ghost Trojans, our script passes every candidate combination through a satisfiability feasibility check in Synopsys TetraMAX. If TetraMAX proves the condition is unsatisfiable, that candidate is discarded."
>
> "All valid Trojans are locked into locked_trojans.json and frozen, establishing our verified ground truth."

---

### Slide 7: Step 3: Mapping Rare Nets to Physical Cell Pins
* **Spoken Word Count:** 206 words (~1.4 minutes)
* **Spoken Script (Natural Spoken English):**

> "Step three is an essential engineering detail that our entire automation flow depends on."
>
> "Transition profiling in VCS gives us rare nets by their internal Verilog wire names, such as n underscore 345 or N1656. But when we attempted to pass an internal wire name to TetraMAX, the tool threw Error M1: Invalid argument. TetraMAX's constraint and fault engines strictly require an instance pin pathname, like U45 slash ZN, or a primary input."
>
> "The authors of the paper solved this by altering the synthesis script, routing every single rare net to an extra primary output port so that net names survived synthesis. We did not want to touch or corrupt the design netlist. Instead, we wrote an automated net-to-pin driver mapping engine."
>
> "Our parser reads every standard cell instance in the synthesized netlist. For each instance, it identifies the output pin and records which internal wire that pin drives."
>
> "One subtle bug we fixed: standard cell multiplexers have a select input named dot S, whereas full adders have a sum output named dot S. Our regex parser was updated to ensure that MUX select inputs are never mistakenly registered as drivers, while adder outputs and cell output pins Z, ZN, Q, and CO are mapped cleanly."

---

### Slide 8: Full-Scan DFT Architecture & State Control
* **Spoken Word Count:** 196 words (~1.4 minutes)
* **Spoken Script (Natural Spoken English):**

> "Before discussing test generation, we must explain scan DFT, because it radically changes the sequential ATPG problem."
>
> "In a sequential circuit, internal rare nodes depend on the states stored inside flip-flops. Without scan, the only way to set a flip-flop is to find a functional sequence of primary inputs over multiple clock cycles that drives the state machine into that condition. For ATPG, this requires unrolling the sequential circuit across multiple time frames. As the number of state variables grows, the search space explodes exponentially, leading to runtimes of 500 to 4,500 minutes in the published paper."
>
> "By implementing an IEEE 1149.1 full internal scan chain, every flip-flop is converted into a multiplexed scan cell. When scan enable is high, all flip-flops form one long shift register. In exactly L clock cycles—where L is the scan chain length—we can shift in any state vector directly."
>
> "When scan enable goes low, we apply the primary inputs and pulse the functional clock once. That is the capture cycle."
>
> "To TetraMAX, every flip-flop behaves like a pseudo-primary input and pseudo-primary output. The sequential state space collapses into combinational complexity, allowing TetraMAX to generate patterns in seconds rather than hours."

---

### Slide 9: Algorithmic Formulations: ND-ATPG vs. Maximal Clique ATPG
* **Spoken Word Count:** 205 words (~1.4 minutes)
* **Spoken Script (Natural Spoken English):**

> "Now we arrive at the core algorithmic comparison between the two test generation methods."
>
> "On the left is ND-ATPG, which stands for N-detect ATPG. The concept is straightforward: take one rare node at a time and invert it into a stuck-at fault. If a net is rarely one, we target stuck-at-zero, because to detect that fault, the ATPG engine must force the net to one. Then we ask TetraMAX for N different patterns for that single fault, using random decision ordering and random fill. Each pattern forces that one rare node, and we rely on random switching across the remaining free inputs to trigger the other nets of a Trojan."
>
> "On the right is MC-ATPG, or Maximal Clique ATPG. Here we do not leave co-activation to chance. First, we test which rare nodes are logically compatible using pairwise SAT queries. Second, we find maximal cliques in this compatibility graph using the Bron-Kerbosch algorithm. Third, we constrain the entire clique simultaneously in TetraMAX to generate a single pattern that activates multiple rare nodes at once."
>
> "To prevent TetraMAX from timing out on large cliques, we partition them into sub-cliques of size at most four. This gives dramatic compaction—using up to 25 times fewer patterns than ND-ATPG."

---

### Slide 10: Step 4a: ND-ATPG Implementation in TetraMAX
* **Spoken Word Count:** 177 words (~1.2 minutes)
* **Spoken Script (Natural Spoken English):**

> "Here is the concrete implementation of ND-ATPG in Synopsys TetraMAX."
>
> "For every rare node in the circuit, our script drives TetraMAX through the sequence shown on the right. First, we initialize the DRC rules and build the in-memory ATPG model. Next, we remove any existing faults and add the inverted stuck-at fault on the mapped driving cell pin."
>
> "Crucially, we configure the ATPG solver with random decision order and random fill. If decision order were deterministic, TetraMAX would return virtually identical patterns N times, defeating the purpose of multi-detect. With random fill enabled, all don't-care input bits are randomized, providing the entropy needed to toggle other internal rare nodes by chance."
>
> "We execute run_atpg with the ndetects parameter and export the vectors in IEEE 1450 STIL format. This sequence is repeated for all thirty rare nodes, and the resulting patterns are concatenated."
>
> "One implementation difference from the paper: the paper generates an initial pilot vector and creates N minus one additional vectors by systematically flipping primary inputs under constraints. Our implementation utilizes TetraMAX's native industrial N-detect engine."

---

### Slide 11: Step 4b: MC-ATPG, Building the Compatibility Graph
* **Spoken Word Count:** 183 words (~1.3 minutes)
* **Spoken Script (Natural Spoken English):**

> "MC-ATPG begins by constructing a compatibility graph of rare conditions."
>
> "Each vertex in the graph represents one rare condition, such as pin U45 ZN equal to one. We draw an undirected edge between two vertices if and only if both conditions can be satisfied simultaneously by a single test pattern."
>
> "To determine this, our script sets up a dual-constraint SAT query in TetraMAX, applying both conditions using add_atpg_constraints and running ATPG. If TetraMAX finds a pattern, the pair is co-activatable and we insert an edge. If TetraMAX returns zero patterns, there is a logical conflict and no edge is created."
>
> "With thirty rare nodes, we perform four hundred and thirty-five queries per circuit."
>
> "Here we resolved a major bug present in the published author's implementation scripts: the authors used the Tcl llength command on the returned pattern collection. In Synopsys Tcl, a collection is an opaque pointer, so llength always returns one even when the collection contains zero patterns! This caused the author's script to treat 100% of node pairs as compatible, creating invalid cliques. We corrected this by using native Synopsys sizeof_collection."

---

### Slide 12: Step 4c: MC-ATPG, Cliques & Constrained ATPG
* **Spoken Word Count:** 156 words (~1.1 minutes)
* **Spoken Script (Natural Spoken English):**

> "Once the compatibility graph is established, Stage 2 finds all maximal cliques using the Bron-Kerbosch algorithm with pivoting. For a thirty-node graph, clique discovery executes in under a millisecond."
>
> "However, Stage 3 presented a major challenge. When we applied an entire maximal clique—which can contain ten to thirty nodes—as a single constraint set in TetraMAX, the tool aborted with zero patterns. Pairwise compatibility does not guarantee multi-way satisfiability within the solver's effort limits."
>
> "To solve this, we implemented sub-clique bounding, partitioning large cliques into sub-cliques of at most four nodes (k <= 4). For each sub-clique, the script applies all constraints simultaneously, adds the matching stuck-at faults to guide justification, and runs ATPG with random fill."
>
> "This sub-clique formulation solved solver aborts and achieved massive compaction, generating up to twenty-five times fewer patterns than ND-ATPG. The tradeoff is that five-net triggers (q=4) are not constrained directly; their activation depends on random fill toggling the fifth net."

---

### Slide 13: Step 5: From STIL Patterns to Gate-Level Replay
* **Spoken Word Count:** 172 words (~1.2 minutes)
* **Spoken Script (Natural Spoken English):**

> "After test generation, TetraMAX outputs patterns in IEEE 1450 STIL format. Our simulation testbenches cannot execute STIL directly, so we deconstruct the patterns."
>
> "A custom Python parser reads the STIL files and separates two distinct bitstreams: the primary input vectors, written to scan_pi.txt, and the serial scan load bitstrings, written to scan_in.txt. The order of bits in the scan string must strictly match the chain order defined in the STIL procedure file; otherwise, incorrect state bits would be loaded into the flip-flops."
>
> "The testbench emulates an ATE tester: for each pattern, it asserts scan enable, clocks in the scan string over L cycles, deasserts scan enable, applies primary inputs, and pulses the clock."
>
> "Because of serial shifting, dynamic simulation is the most compute-intensive stage. Total simulation cycles equal pattern count multiplied by scan chain length. For DarkRISCV under MC-ATPG, shifting thirteen thousand five hundred patterns across seventeen hundred flip-flops requires over twenty-three million clock cycles, taking over an hour in VCS. Every single Trojan hit is counted directly during this dynamic simulation."

---

### Slide 14: Step 6: Cycle-Accurate VCS Dynamic Verification
* **Spoken Word Count:** 165 words (~1.1 minutes)
* **Spoken Script (Natural Spoken English):**

> "This slide illustrates our cycle-accurate verification methodology in Synopsys VCS."
>
> "We do not rely on ATPG tool summary reports for Trojan detection metrics. Inside the testbench for each circuit, we inline an automated Trojan monitoring task called check_trojans. For every Trojan in the locked benchmark list, this task monitors the exact physical pins of that Trojan's trigger directly inside the synthesized netlist."
>
> "Notice the strict use of Verilog's triple-equals case-equality operator. In gate-level simulation, uninitialized flip-flops initially hold X states. Standard double-equals comparisons with X evaluate as unknown and can lead to flawed test results. With triple-equals, the condition fires only when every trigger pin is driven to a genuine, clean logic level."
>
> "When a trigger fires, the testbench records the hit in a bit vector, increments the counter, and prints HIT with the Trojan ID. At the conclusion of the pattern replay, the testbench displays the total unique Trojans triggered out of the feasible population. That empirical number is the coverage metric we report."

---

### Slide 15: 5 Pitfalls Found While Reproducing the Flow & Our Fixes
* **Spoken Word Count:** 201 words (~1.4 minutes)
* **Spoken Script (Natural Spoken English):**

> "During our reproduction of the paper, we uncovered five critical bugs and bottlenecks. Each one cost us significant debugging time, and each one silently leads to invalid results if unnoticed."
>
> "First, the net-versus-pin issue. When raw wire names were passed to TetraMAX, the commands failed. Because the authors wrapped constraint commands in Tcl catch blocks, the errors were silently swallowed, producing unconstrained random patterns. We resolved this by building driver pin mapping."
>
> "Second, the collection sizing bug. TetraMAX returns patterns as an opaque collection. Using Tcl's llength always returns one. In the authors' script, this caused every mutually exclusive pair to be marked compatible, producing corrupted cliques. We corrected this using sizeof_collection."
>
> "Third, MUX select pin confusion. In standard cell libraries, multiplexers have a select input called dot S, whereas full adders have a sum output called dot S. Our regex had to distinguish cell types so that select inputs were not mistaken for driving pins."
>
> "Fourth, monolithic cliques. Constraining entire 30-node cliques caused TetraMAX to abort on RSA with 5.2% coverage. Sub-clique bounding (k <= 4) eliminated aborts and boosted RSA coverage to 65.8%."
>
> "Fifth, sequential unrolling without scan was computationally intractable, which we solved by synthesizing full scan chains."

---

### Slide 16: Experimental Results: ISCAS-85 Combinational Benchmarks
* **Spoken Word Count:** 179 words (~1.2 minutes)
* **Spoken Script (Natural Spoken English):**

> "Now let us examine our experimental results on the ISCAS-85 combinational benchmarks."
>
> "Look first at pattern compaction: for c2670, ND-ATPG requires over twenty-two thousand patterns, whereas MC-ATPG requires only 1,736 patterns. For c6288, ND-ATPG uses twenty-eight thousand patterns, while MC-ATPG achieves detection with just 1,164 patterns. That represents up to a twenty-four-fold reduction in test vector volume!"
>
> "Now look at Trojan coverage: in our initial unmapped runs, MC-ATPG scored 70.35% on c2670 and 84.92% on c6288 because wire names failed silently in TetraMAX. Once we mapped the netlist to SCL 180nm standard cells with physical output pins and filtered out tautology constants, MC-ATPG coverage jumped to 81.91% on c2670 and 96.98% on c6288! On c6288, MC-ATPG is now within 2.5% of ND-ATPG (96.98% vs 99.50%) while using 24x fewer patterns."
>
> "The column breakdown explains where the remaining difference lies: on easy Trojans (q=1 and q=2), MC-ATPG matches ND-ATPG at 92% to 100% activation. On deep five-input triggers (q=4), ND-ATPG is ahead because its massive pattern volume provides higher random toggle probability, whereas MC-ATPG sub-cliques are capped at size four."

---

### Slide 17: Experimental Results: Sequential Full-Scan Cores & Cryptographic IPs
* **Spoken Word Count:** 158 words (~1.1 minutes)
* **Spoken Script (Natural Spoken English):**

> "This table summarizes our dynamic gate-level simulation results across all seven sequential cores with full scan."
>
> "MC-ATPG demonstrates clear superiority on sequential architectures, winning on five of the seven cores. On DarkRISCV, MC-ATPG achieves 92.50% coverage compared to 85.00% for ND-ATPG. On PicoRV2, MC-ATPG reaches 67.20% versus 37.60%. The most striking contrast is on FemtoRV32, where MC-ATPG scores 85.20% while ND-ATPG collapses to 16.60%. ND-ATPG leads only on PicoRV1 and RSA."
>
> "However, an honest audit reveals important tool anomalies. On FemtoRV32, ND-ATPG produced only five test patterns before halting. On AES-128, MC-ATPG generated only a single pattern, yet that single pattern activated 88 Trojans (17.6%) because it forced an entire clique of high-fanout control signals! On PicoRV3, only four patterns were generated."
>
> "These low pattern counts do not reflect fundamental algorithmic limits; they indicate that TetraMAX hit backtrack effort limits on dense cryptographic pipelines. Investigating and relaxing these abort limits forms a primary objective of our future work."

---

### Slide 18: Trend Analysis Against Paper Figures 12(c) & 13
* **Spoken Word Count:** 166 words (~1.1 minutes)
* **Spoken Script (Natural Spoken English):**

> "These two trend plots synthesize our empirical findings against the published figures in the paper."
>
> "The left plot tracks Trojan coverage across all seven sequential cores. You can see the curves crossing each other: MC-ATPG delivers massive gains on FemtoRV32 and PicoRV2, ND-ATPG wins on RSA, and both methods decline on PicoRV3 and AES-128. Both methods substantially outperform MERO, which is the statistical N-detect baseline from prior literature that plateaus below 35%."
>
> "The right plot addresses the massive runtime difference. In the IEEE TCAD paper, sequential cores took hundreds to thousands of minutes because TetraMAX was forced to unroll multi-cycle sequential frames without scan. In our framework, full scan chains give direct access to every internal register. Our pattern generation finishes in 4 to 370 seconds."
>
> "We want to emphasize this clearly: our code is not 1000 times faster algorithmically. Rather, scan DFT transforms the underlying computational problem from exponential sequential search into combinational solvability. The paper demonstrates this exact same phenomenon in its Table V."

---

### Slide 19: Baseline Ground-Truth Audit: Published Paper vs. Our Results
* **Spoken Word Count:** 179 words (~1.2 minutes)
* **Spoken Script (Natural Spoken English):**

> "Here we place our experimental numbers directly alongside the published metrics from the IEEE TCAD 2023 paper."
>
> "For ND-ATPG on ISCAS-85, our reproduction is very close: on c2670 the paper reports 91.6% and we achieve 89.95%. On c5315 the paper reports 94.7% and our run achieves 96.00%. On c6288 the paper reports 100% and we achieve 99.50%. Only c7552 shows a moderate gap, where we achieve 88.50%."
>
> "For MC-ATPG, the paper reports 100% on all four ISCAS circuits. Initially, our MC-ATPG was 15 to 30 points behind because wire constraints were failing silently. With our standard-cell pin mapping and constant filtering fixes, MC-ATPG jumped to 81.91% on c2670, 82.50% on c5315, and 96.98% on c6288! On c6288, we are now within 3% of the paper's 100% mark."
>
> "On sequential cores, our scan-based numbers on DarkRISCV and PicoRV1 outperform the paper's non-scan baselines by 4% to 18%. On AES-128, our low coverage is due to TetraMAX generating only a single pattern under heavy pipeline constraints. This brings us directly to our analysis of what is done versus what remains open."

---

### Slide 20: Where the Implementation Stands: Done vs. Open
* **Spoken Word Count:** 157 words (~1.1 minutes)
* **Spoken Script (Natural Spoken English):**

> "Let us step back and summarize exactly where our implementation stands before detailing our future work roadmap."
>
> "What is fully accomplished: our automated toolchain runs end-to-end on all eleven circuits without human intervention. ND-ATPG matches published paper metrics within two points on three of the four ISCAS benchmarks. On sequential cores, MC-ATPG proves superior on five out of seven designs, and our full-scan DFT methodology achieves a thousand-fold speedup over sequential unrolling."
>
> "What remains open falls into three well-defined engineering problems:"
>
> "First, closing the remaining MC-ATPG coverage gap on combinational circuits, particularly for deep five-input triggers where our four-node sub-clique cap currently restricts direct justification."
>
> "Second, resolving the low pattern counts on dense pipelines like AES-128 and PicoRV3, where TetraMAX encountered backtrack abort limits."
>
> "And third, extending our evaluation beyond scan chains to non-scan sequential justification, and filtering fake rare signals."
>
> "The next five slides present our concrete, actionable research roadmap addressing each of these open items."

---

### Slide 21: Future Work 1: Complete MC-ATPG and Raise Its Coverage
* **Spoken Word Count:** 191 words (~1.3 minutes)
* **Spoken Script (Natural Spoken English):**

> "The first and most important item in our future work is to complete the MC-ATPG engine and close the coverage gap to 100%."
>
> "Currently, MC-ATPG achieves 81% to 97% on combinational circuits, trailing ND-ATPG on deep five-input triggers because of our four-node sub-clique limit."
>
> "Our concrete plan has five steps. First, we will implement the paper's Algorithm 6 for compatibility graph construction. Instead of four hundred and thirty-five pairwise queries, Algorithm 6 sets one rare node as a constraint and adds all other candidate nodes as faults with fault-dropping in a single ATPG pass. This reduces complexity from O of n squared to O of n, allowing us to expand our rare-node pool from 30 to over 150 nodes."
>
> "Second, we will implement dynamic clique relaxation: we will attempt full maximal cliques first, and if TetraMAX aborts, we will systematically drop the lowest-fanout node and re-solve, rather than capping all cliques at size four."
>
> "Third, we will sort constraints by topological logic depth to assist the backtracker. Fourth, we will increase TetraMAX's abort limit. We will consider this milestone complete when MC-ATPG matches or exceeds ND-ATPG across all four ISCAS benchmarks."

---

### Slide 22: Future Work 2: Run ND-ATPG on Larger Circuits
* **Spoken Word Count:** 162 words (~1.1 minutes)
* **Spoken Script (Natural Spoken English):**

> "The second item is scaling ND-ATPG reliably to larger circuits."
>
> "On the small ISCAS circuits, ND-ATPG achieves 88% to 99% coverage. But on large designs, results dropped sharply: FemtoRV32 generated only five patterns, and AES-128 scored 3.0%."
>
> "Our plan has five steps. First, we will write a log parser to classify every failure into redundant, untestable, or aborted. If faults were aborted due to solver timeouts, we will increase backtrack limits."
>
> "Second, we will implement the authors' pilot-vector bit-flipping engine from Algorithms 3 and 4. Instead of relying on TetraMAX's black-box random fill, this algorithm computes one deterministic base vector and systematically flips non-essential inputs, guaranteeing distinct patterns."
>
> "Third, we will incorporate the intermediate ISCAS-89 sequential benchmarks—s13207 and s38584—which span 2,000 to 12,000 gates, providing a smooth progression from small ALUs to 25,000-gate crypto cores."
>
> "Fourth, we will parallelize the fault batches across our server cluster. We will consider this complete when ND-ATPG coverage exceeds 85% on PicoRV3 and 75% on AES-128."

---

### Slide 23: Future Work 3: Rare-Node Activation in Sequential Circuits
* **Spoken Word Count:** 159 words (~1.1 minutes)
* **Spoken Script (Natural Spoken English):**

> "The third item is making rare-node detection work in sequential circuits without relying entirely on scan chains."
>
> "Currently, all our sequential results use full scan. While scan provides a 1000x speedup, it has an architectural limitation: scan chains allow shifting in state combinations that the circuit's state machine could never reach in normal operation. This can activate a Trojan during test that could never fire in the field, and it cannot evaluate chips where scan is disabled for security."
>
> "Our five-step plan starts with RSA, which has only 250 flip-flops. We will synthesize RSA without scan chains and run TetraMAX in full sequential ATPG mode, starting from reset and unrolling sequential time frames up to depth 20."
>
> "We will also implement the paper's Algorithm 2 to tag rare control-flow branches at the RTL level. Finally, we will directly compare scan versus non-scan on the exact same five hundred Trojans, measuring the true trade-off between coverage, vector depth, and runtime."

---

### Slide 24: Future Work 4: Filter Out Fake Rare Signals
* **Spoken Word Count:** 162 words (~1.1 minutes)
* **Spoken Script (Natural Spoken English):**

> "The fourth item is systematic filtering of fake rare signals."
>
> "During our profiling, any net whose toggle count fell below the threshold was marked rare. However, many nets are rare for structural reasons: tied cells, reset lines, unused bus bits, or test controls held low during functional operation. These nets never toggle, appearing with probability zero."
>
> "Fake rare signals corrupt the flow in two ways: first, ATPG wastes solver effort trying to force an impossible inverted state. Second, if our Trojan generator incorporates a fake rare net into a trigger, that Trojan becomes permanently untestable. In fact, our investigation revealed that net N1656 in c2670 was an internal logic tautology that evaluated to constant one across all input minterms!"
>
> "Our five-step plan implements gate-level constant propagation from tie cells, formal BDD and SAT tautology checking, and extended one-million-cycle profiling to distinguish true rare signals from constants. Filtering these false positives will clean our candidate lists and improve coverage on PicoRV3 and AES-128."

---

### Slide 25: Future Work 5: Complete the Simulations on All Circuits
* **Spoken Word Count:** 135 words (~0.9 minutes)
* **Spoken Script (Natural Spoken English):**

> "The fifth future work item is achieving complete simulation closure across all eleven circuits."
>
> "Currently, our evaluation has four specific gaps: combinational circuits use 200 Trojans while sequential cores use 500; we monitor trigger pin activation rather than verifying that the payload propagates to an observable output; and massive runs like DarkRISCV's twenty-three million cycles run as monolithic serial simulations."
>
> "Our plan addresses each gap: first, standardizing all eleven benchmarks to 500 feasible Trojans, with exactly 125 Trojans per difficulty tier. Second, implementing differential simulation, where the clean golden design and infected design run side-by-side and a Trojan is counted only when an output mismatch occurs."
>
> "Third, sharding pattern files into parallel chunks to accelerate simulation turnaround. And fourth, delivering a unified master script that regenerates all tables directly from raw logs, ensuring complete reproducibility."

---

### Slide 26: Deliverables Manifest & Submission Repository Architecture
* **Spoken Word Count:** 148 words (~1.0 minutes)
* **Spoken Script (Natural Spoken English):**

> "This slide outlines our submission deliverables and explains how to reproduce every single result."
>
> "Everything is organized inside a clean directory structure called clean_submission. Inside the circuits directory, there are two subfolders: combinational and sequential. Each benchmark has its own self-contained directory containing the synthesized netlist, the Python ATPG generation script, the testbench, and an executable shell script that runs the VCS simulation."
>
> "All transient compiler artifacts—such as simulator binaries, VCD waveform dumps, and compilation directories—have been untracked and added to gitignore, keeping the repository clean and professional."
>
> "To reproduce any result, only two commands are required: first, run python3 run_mcatpg.py to generate patterns, and second, execute ./simulate.sh to run the cycle-accurate VCS simulation and display the Trojan activation count. We also provide a master script, run_all_benchmarks.sh, which verifies all eleven designs sequentially. The entire project is synchronized on GitHub and packaged into a 15 MB submission archive."

---

### Slide 27: Conclusion & Defense Q&A
* **Spoken Word Count:** 181 words (~1.2 minutes)
* **Spoken Script (Natural Spoken English):**

> "To conclude our presentation:"
>
> "We have implemented, audited, and enhanced the complete transition-probability hardware Trojan detection flow in the commercial SCL 180nm standard-cell library: from front-end logic synthesis and IEEE 1149.1 scan insertion, to dynamic transition profiling, Trojan feasibility injection, native TetraMAX test generation, and cycle-accurate gate-level simulation in VCS."
>
> "Our findings establish clear engineering trade-offs: on combinational circuits, MC-ATPG delivers dramatic compaction, using 8 to 43 times fewer patterns than ND-ATPG while reaching 82% to 94% coverage once physical driving pins are properly resolved. On sequential cores with full scan, MC-ATPG outperforms ND-ATPG on five out of seven designs, and full-scan DFT provides a thousand-fold reduction in pattern generation time."
>
> "We have presented an honest comparison with the published paper, explaining exactly where our numbers match, where tool bottlenecks occurred, and our concrete five-point research plan to achieve 100% coverage, filter fake rare signals, and scale to larger circuits."
>
> "We sincerely thank Professor Joycee Mekie and the teaching assistants for their guidance and feedback throughout this course. Thank you for your time and attention. We are ready for your questions."

---
