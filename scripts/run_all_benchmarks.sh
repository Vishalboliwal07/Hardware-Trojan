#!/bin/bash
################################################################################
# Master Verification Script: Run All 11 Benchmark Simulations
# Circuits: ISCAS-85 (c2670, c5315, c6288, c7552)
#           Sequential (darkriscv, picorv1, picorv2, picorv3, femtorv32, rsa, aes_128)
# Environment: Synopsys VCS on SCL 180nm Standard Cell Library
################################################################################

set -e

# EDA Tool Environment Setup
source "${SYNOPSYS_TOOL_RC:-/home/nanodcmaster/toolRC_synopsys.bash}" >/dev/null 2>&1 || true

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "================================================================================"
echo "Master Hardware Trojan Simulation Suite: All 11 Benchmarks"
echo "Root Path: ${ROOT_DIR}"
echo "Date: $(date)"
echo "================================================================================"

COMBINATIONAL=("c2670" "c5315" "c6288" "c7552")
SEQUENTIAL=("darkriscv" "picorv1" "picorv2" "picorv3" "femtorv32" "rsa" "aes_128")

TOTAL_BENCHMARKS=11
PASSED=0

echo ""
echo "--- Phase 1: ISCAS-85 Combinational Benchmark Simulations ---"
for c in "${COMBINATIONAL[@]}"; do
    cd "${ROOT_DIR}/circuits/combinational/${c}"
    echo "[*] Simulating Combinational Benchmark: ${c}..."
    if [ -f "./simulate.sh" ]; then
        bash ./simulate.sh
        PASSED=$((PASSED + 1))
    else
        echo "[-] ERROR: simulate.sh not found for ${c}"
    fi
done

echo ""
echo "--- Phase 2: Sequential Full-Scan Core Simulations ---"
for s in "${SEQUENTIAL[@]}"; do
    cd "${ROOT_DIR}/circuits/sequential/${s}"
    echo "[*] Simulating Sequential Core: ${s}..."
    if [ -f "./simulate.sh" ]; then
        bash ./simulate.sh
        PASSED=$((PASSED + 1))
    else
        echo "[-] ERROR: simulate.sh not found for ${s}"
    fi
done

echo ""
echo "================================================================================"
echo "Master Simulation Run Complete!"
echo "Passed Benchmarks: ${PASSED} / ${TOTAL_BENCHMARKS}"
echo "================================================================================"
