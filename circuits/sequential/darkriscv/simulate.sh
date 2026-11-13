#!/bin/bash
################################################################################
# Script: simulate.sh (DARKRISCV Core Dynamic Simulation)
# Description: Compiles and executes cycle-accurate scan simulation in Synopsys VCS
################################################################################

set -e

# EDA Environment Setup
source "${SYNOPSYS_TOOL_RC:-/home/nanodcmaster/toolRC_synopsys.bash}" >/dev/null 2>&1 || true

SCL_PDK_ROOT="${SCL_PDK_ROOT:-/home/nanodcmaster/Synopsys/pdk/SCL_PDK_3/SCLPDK_V3.0_KIT}"
VCS_LIB="${SCL_PDK_ROOT}/scl180/stdcell/fs120/6M1L/verilog/vcs_sim_model/tsl18fs120_scl.v"

echo "================================================================================"
echo "[*] Compiling DARKRISCV Scan Testbench in Synopsys VCS..."
echo "================================================================================"

vcs -full64 -sverilog +v2k +notimingcheck +nospecify \
    tb_scan.v \
    synthesised_scan.v \
    "${VCS_LIB}" \
    -o simv_scan > vcs_comp.log 2>&1

echo "[+] Compilation successful. Executing simulation..."
./simv_scan > sim_scan.log 2>&1

echo "[+] Simulation completed."
echo "--------------------------------------------------------------------------------"
echo "Trojan Activation Summary:"
grep "HIT" sim_scan.log | sort -u | wc -l | awk '{print "Total Unique Trojans Activated: " $1}'
echo "================================================================================"
