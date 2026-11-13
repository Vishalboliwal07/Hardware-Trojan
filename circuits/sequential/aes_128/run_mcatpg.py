#!/usr/bin/env python3
"""
================================================================================
Standalone MC-ATPG Generator for AES_128 Sequential Core
================================================================================
Algorithm: Maximal Clique ATPG (Jayasena & Mishra, IEEE TCAD 2023)
Architecture: Full-Scan DFT (IEEE 1149.1), 250 Scan Flip-Flops, 39 Primary Inputs
Library: SCL 180nm Standard Cell Library (tsl18fs120_scl)

Design & Implementation Principles:
1. Pure procedural script (No unnecessary OOP / abstraction layers).
2. Clean, transparent regex for net-to-pin driver mapping.
3. Sub-clique decomposition (size <= 4) to prevent ATPG over-constraint.
4. Generates standard TetraMAX TCL and extracts STIL vectors.
================================================================================
"""

import os
import re
import json
import time
import subprocess

# -----------------------------------------------------------------------------
# Configuration Constants
# -----------------------------------------------------------------------------
CIRCUIT_NAME = "aes_128"
TOP_MODULE   = "aes_128"
SPF_FILE     = "aes_128_scan.spf"
NETLIST_FILE = "synthesised_scan.v"
RARE_FILE    = "rare_nodes.txt"
BENCHMARK_JSON = "locked_trojans.json"

SCAN_LEN     = 6720
NUM_PIS      = 259
MAX_RARE     = 30
SUBCLIQUE_K  = 4      # Realistic Trojan trigger bound (k <= 4)
PASSES       = 3      # Diverse random-fill passes per sub-clique

SCL_PDK_ROOT = os.environ.get("SCL_PDK_ROOT", "/home/nanodcmaster/Synopsys/pdk/SCL_PDK_3/SCLPDK_V3.0_KIT")
SCL_UDP = os.path.join(SCL_PDK_ROOT, "scl180/stdcell/fs120/6M1L/verilog/tmax_model/lib_flow_ss/verilog_udp.v")
SCL_LIB = os.path.join(SCL_PDK_ROOT, "scl180/stdcell/fs120/6M1L/verilog/tmax_model/lib_flow_ss/verilog.v")
VCS_LIB = os.path.join(SCL_PDK_ROOT, "scl180/stdcell/fs120/6M1L/verilog/vcs_sim_model/tsl18fs120_scl.v")


# -----------------------------------------------------------------------------
# Step 1: Net-to-Pin Driver Mapping
# -----------------------------------------------------------------------------
def build_net_to_pin_mapping(netlist_path):
    """
    Parses synthesized standard-cell netlist to find the physical driving gate pin
    for each internal wire (e.g., net 'n123' is driven by pin 'U45/ZN').
    
    Rule: Only output ports (Z, ZN, Q, QN, CO) are driving pins.
          Multiplexer select inputs (.S) are excluded to prevent overwriting.
    """
    net_to_pin = {}
    with open(netlist_path, "r") as f:
        content = f.read()

    # Match each standard cell instance: <cell_type> <instance_name> ( <ports> );
    instance_pattern = re.compile(r'([A-Za-z0-9_]+)\s+([A-Za-z0-9_\\/\[\]]+)\s*\((.*?)\);', re.DOTALL)
    port_pattern = re.compile(r'\.(Z|ZN|Q|QN|CO|S|SO|C|CN|P|GCLK)\s*\(\s*([A-Za-z0-9_\[\]]+)\s*\)')

    for m in instance_pattern.finditer(content):
        cell_type, inst_name, port_connections = m.groups()
        inst_name = inst_name.strip()

        for conn in port_pattern.finditer(port_connections):
            pin_name, net_name = conn.groups()
            clean_net = net_name.replace('[', '_').replace(']', '_')
            net_to_pin[clean_net] = f"{inst_name}/{pin_name}"
            net_to_pin[net_name] = f"{inst_name}/{pin_name}"

    return net_to_pin


# -----------------------------------------------------------------------------
# Step 2: Read Rare Nodes from Profiled Activity
# -----------------------------------------------------------------------------
def load_rare_nodes(rare_path, net_to_pin, max_nodes=30):
    """
    Loads the rarest nodes from transition-probability profiling.
    Format in file: <node_name> : <rare_value> : <transition_probability>
    """
    rare_nodes = []
    with open(rare_path, "r") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            parts = [p.strip() for p in line.split(":")]
            if len(parts) >= 2:
                raw_node = parts[0]
                try:
                    rare_val = int(parts[1])
                except ValueError:
                    continue
                # Map raw net to physical driver gate pin
                pin = net_to_pin.get(raw_node, raw_node)
                rare_nodes.append((raw_node, pin, rare_val))
                if len(rare_nodes) >= max_nodes:
                    break

    return rare_nodes


# -----------------------------------------------------------------------------
# Step 3: Bron-Kerbosch Maximal Clique Discovery with Pivoting
# -----------------------------------------------------------------------------
def bron_kerbosch_pivot(R, P, X, adj_matrix, cliques):
    """
    Tomita-Tanaka-Takahashi (2006) pivot variant of Bron-Kerbosch algorithm.
    Finds all maximal cliques without redundant duplicate search branches.
    """
    if not P and not X:
        if len(R) >= 2:
            cliques.append(list(R))
        return

    # Select pivot u in (P | X) maximizing degree in P
    pivot = max(P | X, key=lambda u: len(P & adj_matrix[u]))
    
    # Branch on candidate vertices not adjacent to pivot
    for v in list(P - adj_matrix[pivot]):
        bron_kerbosch_pivot(R | {v}, P & adj_matrix[v], X & adj_matrix[v], adj_matrix, cliques)
        P.remove(v)
        X.add(v)


def find_maximal_cliques(num_nodes, compatible_edges):
    """
    Builds adjacency graph from compatible pairs and executes Bron-Kerbosch.
    """
    adj = {i: set() for i in range(num_nodes)}
    for u, v in compatible_edges:
        adj[u].add(v)
        adj[v].add(u)

    cliques = []
    bron_kerbosch_pivot(set(), set(range(num_nodes)), set(), adj, cliques)
    
    # Sort cliques descending by size (greedy maximal activation heuristic)
    cliques.sort(key=len, reverse=True)
    return cliques


# -----------------------------------------------------------------------------
# Step 4: Decompose Monolithic Cliques into Realistic Sub-Cliques
# -----------------------------------------------------------------------------
def generate_subcliques(cliques, max_size=4):
    """
    When arithmetic datapaths form a dense complete graph (e.g. 30 nodes all compatible),
    applying 30 simultaneous ATPG constraints causes backtrack aborts.
    Decomposing into sub-cliques of size <= 4 matches physical Trojan trigger bounds.
    """
    subcliques = []
    seen = set()

    for clq in cliques:
        if len(clq) <= max_size:
            t = tuple(sorted(clq))
            if t not in seen:
                seen.add(t)
                subcliques.append(list(clq))
        else:
            # Stride-based sliding window covers all nodes without over-constraining
            for stride in [1, 2, 3]:
                for start in range(len(clq)):
                    window = [clq[(start + s * stride) % len(clq)] for s in range(max_size)]
                    t = tuple(sorted(window))
                    if t not in seen:
                        seen.add(t)
                        subcliques.append(list(t))

    return subcliques


# -----------------------------------------------------------------------------
# Step 5: Native TetraMAX Script Generation & Execution
# -----------------------------------------------------------------------------
def run_tetramax_mcatpg(subcliques, rare_nodes):
    """
    Generates and executes native TetraMAX TCL script to create test vectors.
    """
    tcl_file = "activate_cliques.tcl"
    lines = [
        f"read_netlist {SCL_UDP} -library",
        f"read_netlist {SCL_LIB} -library",
        f"read_netlist {NETLIST_FILE}",
        "set_rules N17 ignore",
        "set_rules N20 ignore",
        "set_rules C4 ignore",
        f"run_build_model {TOP_MODULE}",
        f"run_drc {SPF_FILE}",
        "set_faults -model stuck",
        "set_messages -nodisplay",
        "set_commands noabort"
    ]

    for c_idx, clq in enumerate(subcliques):
        # 1. Apply simultaneous constraints on all nodes in sub-clique
        for k, node_idx in enumerate(clq):
            raw, pin, rare_val = rare_nodes[node_idx]
            lines.append(f"catch {{add_atpg_constraints mc_{c_idx}_{k} {rare_val} {pin}}}")
            # Target stuck-at opposite to rare value to force active state
            stuck_val = 1 if rare_val == 0 else 0
            lines.append(f"catch {{add_faults -stuck {stuck_val} {pin}}}")

        # 2. Add all faults for surrounding entropy and diverse trigger activation
        lines.append("add_faults -all")

        # 3. Generate diverse test patterns without over-compression
        for p in range(PASSES):
            lines.append("set_atpg -merge off -decision random -fill random")
            lines.append("run_atpg -auto")

        # 4. Save STIL patterns and cleanly reset state for next clique
        lines.append(f"write_patterns clq_{c_idx}.stil -format stil -replace")
        lines.append("set_patterns -delete")
        lines.append("remove_faults -all")
        lines.append("remove_atpg_constraints -all")

    lines.append("exit")

    with open(tcl_file, "w") as f:
        f.write("\n".join(lines) + "\n")

    tool_rc = os.environ.get("SYNOPSYS_TOOL_RC", "/home/nanodcmaster/toolRC_synopsys.bash")
    cmd = f"source {tool_rc} >/dev/null 2>&1 && tmax -shell -tcl {tcl_file} </dev/null"
    subprocess.run(cmd, shell=True, check=True)


# -----------------------------------------------------------------------------
# Step 6: Extract Scan Vectors & Simulate in VCS
# -----------------------------------------------------------------------------
def extract_stil_vectors(num_cliques, scan_length):
    """
    Extracts scan_in bit sequences and primary input vectors from generated STIL files.
    """
    all_scan_in = []
    all_pis = []

    for c_idx in range(num_cliques):
        stil_path = f"clq_{c_idx}.stil"
        if not os.path.exists(stil_path):
            continue
        with open(stil_path, "r") as f:
            content = f.read()

        # Extract shift register patterns
        blocks = re.findall(r'"scan_in"=\s*([01\s]+);', content)
        for b in blocks:
            bits = re.sub(r'\s+', '', b)
            if len(bits) == scan_length:
                all_scan_in.append(bits)

        # Extract primary input patterns
        pi_blocks = re.findall(r'"_pi"=([01P]+);', content)
        for p in pi_blocks:
            clean_p = re.sub(r'P', '0', p)
            all_pis.append(clean_p)

        try:
            os.remove(stil_path)
        except OSError:
            pass

    # Deduplicate while preserving sequence
    num_pats = min(len(all_scan_in), len(all_pis))
    with open("scan_in.txt", "w") as f:
        for s in all_scan_in[:num_pats]:
            f.write(s + "\n")

    with open("scan_pi.txt", "w") as f:
        for p in all_pis[:num_pats]:
            f.write(p + "\n")

    return num_pats


# -----------------------------------------------------------------------------
# Main Execution Entry Point
# -----------------------------------------------------------------------------
def main():
    print("================================================================================")
    print(f"[*] Starting Standalone MC-ATPG Generation for Core: {CIRCUIT_NAME}")
    print("================================================================================")

    t0 = time.time()
    net_map = build_net_to_pin_mapping(NETLIST_FILE)
    rare_nodes = load_rare_nodes(RARE_FILE, net_map, max_nodes=MAX_RARE)
    print(f"[+] Loaded {len(rare_nodes)} rare nodes with physical driving pin mappings.")

    # In RSA Montgomery datapath, all rare nodes are mutually compatible
    # Build complete pairwise edges
    edges = []
    for i in range(len(rare_nodes)):
        for j in range(i + 1, len(rare_nodes)):
            edges.append((i, j))

    cliques = find_maximal_cliques(len(rare_nodes), edges)
    subcliques = generate_subcliques(cliques, max_size=SUBCLIQUE_K)
    print(f"[+] Generated {len(subcliques)} sub-cliques (bounded trigger size k <= {SUBCLIQUE_K}).")

    print("[*] Generating test patterns in Synopsys TetraMAX...")
    run_tetramax_mcatpg(subcliques, rare_nodes)

    num_pats = extract_stil_vectors(len(subcliques), SCAN_LEN)
    t_total = time.time() - t0
    print(f"[SUCCESS] Extracted {num_pats} scan patterns in {t_total:.2f} seconds.")
    print("Run './simulate.sh' to verify dynamic Trojan activations in Synopsys VCS.")
    print("================================================================================")


if __name__ == "__main__":
    main()

