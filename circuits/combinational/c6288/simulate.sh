#!/bin/bash
# Standalone VCS Simulation Execution for C6288
set -e

# EDA Environment Setup
source "${SYNOPSYS_TOOL_RC:-/home/nanodcmaster/toolRC_synopsys.bash}" >/dev/null 2>&1 || true

SCL_PDK_ROOT="${SCL_PDK_ROOT:-/home/nanodcmaster/Synopsys/pdk/SCL_PDK_3/SCLPDK_V3.0_KIT}"
VCS_LIB="${SCL_PDK_ROOT}/scl180/stdcell/fs120/6M1L/verilog/vcs_sim_model/tsl18fs120_scl.v"

echo "=== Compiling C6288 Combinational Simulation Testbench ==="
vcs -full64 -sverilog +v2k +notimingcheck +nospecify \
    -timescale=1ns/1ps \
    tb_c6288.v c6288.v \
    "${VCS_LIB}" \
    -o simv_c6288 > vcs_comp.log 2>&1

echo "=== Executing Combinational Simulation ==="
./simv_c6288 | tee sim_comb.log

echo "=== Simulation Complete ==="
