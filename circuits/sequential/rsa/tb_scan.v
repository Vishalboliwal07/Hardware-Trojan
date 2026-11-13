`timescale 1ns/1ps

////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_scan.v (RSA Modular Exponentiation Core)
// Description: Fully standalone, cycle-accurate scan testbench for Hardware
//              Trojan activation and verification in Synopsys VCS.
// Architecture: Full-Scan DFT (IEEE 1149.1 compliant scan shift and capture)
// Scan Cells:  250 flip-flops
// Primary In:  39 PIs
// Vectors:     95 MC-ATPG Patterns
////////////////////////////////////////////////////////////////////////////////

module tb_scan;

  // Parameters matching RSA hardware configuration
  localparam SCAN_LEN  = 250;
  localparam NUM_PIS   = 39;
  localparam NUM_PATS  = 95;
  localparam CLK_PERIOD = 10;

  // Clock & Reset Controls
  reg clk;
  reg rst;
  reg scan_enable;
  reg scan_in;
  wire scan_out;

  // Primary Inputs Bus & Decoded Signals
  reg [NUM_PIS-1:0] pi_reg;
  reg [SCAN_LEN-1:0] cur_scan;

  // Pattern Memory Arrays
  reg [SCAN_LEN-1:0] scan_mem [0:NUM_PATS-1];
  reg [NUM_PIS-1:0]  pi_mem   [0:NUM_PATS-1];

  // Simulation Tracking
  integer p_idx;
  integer b_idx;
  integer hit_count = 0;

  // Clock Generator (50 MHz equivalent, 10ns period)
  initial begin
    clk = 0;
    forever #(CLK_PERIOD / 2) clk = ~clk;
  end

  // DUT Instance
  rsa dut (
    .clk(clk),
    .rst(pi_reg[37]),
    .start(pi_reg[38]),
    .scan_enable(scan_enable),
    .scan_in(scan_in),
    .scan_out(scan_out)
  );

  // Main Testbench Execution Flow
  initial begin
    $display("================================================================================");
    $display("[START] Beginning Scan Replay Simulation for RSA Core (%0d patterns)", NUM_PATS);
    $display("================================================================================");

    // Load ASCII binary test patterns
    $readmemb("scan_in.txt", scan_mem);
    $readmemb("scan_pi.txt", pi_mem);

    // Initialize inputs to safe quiescent state
    scan_enable = 0;
    scan_in = 0;
    pi_reg = 0;
    rst = 1;
    #(CLK_PERIOD * 2);
    rst = 0;

    // Pattern Replay Loop
    for (p_idx = 0; p_idx < NUM_PATS; p_idx = p_idx + 1) begin
      cur_scan = scan_mem[p_idx];

      // 1. Scan Shift Phase: Shift pattern into internal scan chain
      scan_enable = 1;
      for (b_idx = 0; b_idx < SCAN_LEN; b_idx = b_idx + 1) begin
        // Leftmost bit (MSB) is shifted first on Cycle 0
        scan_in = cur_scan[SCAN_LEN - 1 - b_idx];
        @(posedge clk); #1;
      end

      // 2. Capture Setup Phase: Apply primary inputs and disable scan_enable
      scan_enable = 0;
      pi_reg = pi_mem[p_idx];
      #1; // Allow combinational logic to settle to steady-state

      // 3. Trojan Trigger Evaluation (Sample steady-state combinational state)
      check_trojans();

      // 4. Capture Clock Pulse: Clock in the response
      @(posedge clk); #1;
    end

    $display("================================================================================");
    $display("[DONE] Simulation Complete. Total Patterns Applied: %0d", NUM_PATS);
    $display("================================================================================");
    $finish;
  end

  // Trojan Monitor Task
  task check_trojans;
    begin
      // Locked Trojan trigger monitors evaluated using case equality (===)
      // to eliminate false positives from uninitialized (X) or floating (Z) states.
      if ((dut.m1_mult_58_CARRYB_4__14_ === 1'b1)) $display("HIT %0d", 0);
      if ((dut.k1_d2_add_49_I8_aco_carry[10] === 1'b1)) $display("HIT %0d", 1);
      if ((dut.k1_d2_N3 === 1'b1)) $display("HIT %0d", 2);
      if ((dut.m1_d1_add_49_I7_aco_carry[2] === 1'b1)) $display("HIT %0d", 3);
      if ((dut.m1_d1_N907 === 1'b1)) $display("HIT %0d", 4);
      if ((dut.m1_d1_N255 === 1'b1)) $display("HIT %0d", 5);
      if ((dut.m1_d1_N107 === 1'b1)) $display("HIT %0d", 6);
      if ((dut.k1_d2_sub_46_I15_n1 === 1'b1)) $display("HIT %0d", 7);
      if ((dut.m1_d1_sub_46_I16_carry[12] === 1'b1)) $display("HIT %0d", 8);
      if ((dut.k1_d2_add_49_I2_aco_carry[8] === 1'b1)) $display("HIT %0d", 9);
      if ((dut.kd1_d2_sub_46_I5_n3 === 1'b1)) $display("HIT %0d", 10);
      if ((dut.m1_mult_58_ab_1__12_ === 1'b1)) $display("HIT %0d", 11);
      if ((dut.k1_mult_34_CARRYB_3__3_ === 1'b1)) $display("HIT %0d", 12);
      if ((dut.kd1_sub_52_carry[11] === 1'b1)) $display("HIT %0d", 13);
      if ((dut.k1_d2_N99 === 1'b1)) $display("HIT %0d", 14);
      if ((dut.kd1_d2_N151 === 1'b1)) $display("HIT %0d", 15);
      if ((dut.kd1_d2_N212 === 1'b1)) $display("HIT %0d", 16);
      if ((dut.k1_d2_N355 === 1'b1)) $display("HIT %0d", 17);
      if ((dut.k1_d2_N338 === 1'b1)) $display("HIT %0d", 18);
      if ((dut.k1_d2_add_49_I12_aco_carry[7] === 1'b1)) $display("HIT %0d", 19);
      if ((dut.kd1_r102_ab_8__3_ === 1'b1)) $display("HIT %0d", 20);
      if ((dut.m1_d1_N1359 === 1'b1)) $display("HIT %0d", 21);
      if ((dut.n1185 === 1'b1)) $display("HIT %0d", 22);
      if ((dut.m1_mult_58_n23 === 1'b1)) $display("HIT %0d", 23);
      if ((dut.k1_d2_N310 === 1'b1)) $display("HIT %0d", 24);
      if ((dut.kd1_d2_N167 === 1'b1)) $display("HIT %0d", 25);
      if ((dut.kd1_d2_N196 === 1'b1)) $display("HIT %0d", 26);
      if ((dut.m1_d1_N555 === 1'b1)) $display("HIT %0d", 27);
      if ((dut.m1_mult_58_CARRYB_3__5_ === 1'b1)) $display("HIT %0d", 28);
      if ((dut.n819 === 1'b1)) $display("HIT %0d", 29);
      if ((dut.k1_n208 === 1'b1)) $display("HIT %0d", 30);
      if ((dut.kd1_d2_add_49_I9_aco_carry[9] === 1'b1)) $display("HIT %0d", 31);
      if ((dut.kd1_r102_n6 === 1'b1)) $display("HIT %0d", 32);
      if ((dut.m1_n54 === 1'b1)) $display("HIT %0d", 33);
      if ((dut.m1_d1_add_49_I25_aco_n1 === 1'b1)) $display("HIT %0d", 34);
      if ((dut.m1_d1_sub_46_I32_carry[23] === 1'b1)) $display("HIT %0d", 35);
      if ((dut.m1_mult_58_ab_3__4_ === 1'b1)) $display("HIT %0d", 36);
      if ((dut.kd1_d2_N429 === 1'b1)) $display("HIT %0d", 37);
      if ((dut.k1_d2_N150 === 1'b1)) $display("HIT %0d", 38);
      if ((dut.m1_mult_58_CARRYB_5__4_ === 1'b1)) $display("HIT %0d", 39);
      if ((dut.m1_mult_58_SUMB_1__5_ === 1'b1)) $display("HIT %0d", 40);
      if ((dut.k1_d2_sub_46_I5_n8 === 1'b1)) $display("HIT %0d", 41);
      if ((dut.m1_d1_sub_46_I20_carry[27] === 1'b1)) $display("HIT %0d", 42);
      if ((dut.kd1_d2_N370 === 1'b1)) $display("HIT %0d", 43);
      if ((dut.kd1_r102_SUMB_4__11_ === 1'b1)) $display("HIT %0d", 44);
      if ((dut.m1_d1_sub_46_I32_carry[21] === 1'b1)) $display("HIT %0d", 45);
      if ((dut.k1_d2_sub_46_I4_n4 === 1'b1)) $display("HIT %0d", 46);
      if ((dut.kd1_r102_CARRYB_7__7_ === 1'b1)) $display("HIT %0d", 47);
      if ((dut.m1_mult_58_CARRYB_13__10_ === 1'b1)) $display("HIT %0d", 48);
      if ((dut.m1_d1_N1871 === 1'b1)) $display("HIT %0d", 49);
      if ((dut.k1_d2_add_49_I2_aco_carry[6] === 1'b1)) $display("HIT %0d", 50);
      if ((dut.k1_d2_add_49_I12_aco_carry[12] === 1'b1)) $display("HIT %0d", 51);
      if ((dut.kd1_outResult[15] === 1'b1)) $display("HIT %0d", 52);
      if ((dut.k1_d2_add_49_I14_aco_carry[4] === 1'b1)) $display("HIT %0d", 53);
      if ((dut.kd1_r100_SUMB_2__13_ === 1'b1)) $display("HIT %0d", 54);
      if ((dut.m1_mult_58_ab_5__8_ === 1'b1)) $display("HIT %0d", 55);
      if ((dut.kd1_n190 === 1'b1)) $display("HIT %0d", 56);
      if ((dut.kd1_r102_n13 === 1'b1)) $display("HIT %0d", 57);
      if ((dut.m1_d1_N635 === 1'b1)) $display("HIT %0d", 58);
      if ((dut.kd1_r102_ab_2__7_ === 1'b1)) $display("HIT %0d", 59);
      if ((dut.k1_d2_N448 === 1'b1)) $display("HIT %0d", 60);
      if ((dut.m1_d1_sub_46_I22_carry[21] === 1'b1)) $display("HIT %0d", 61);
      if ((dut.n1266 === 1'b1)) $display("HIT %0d", 62);
      if ((dut.kd1_d2_sub_46_I9_carry[5] === 1'b1)) $display("HIT %0d", 63);
      if ((dut.k1_d2_sub_46_I11_carry[7] === 1'b1)) $display("HIT %0d", 64);
      if ((dut.kd1_A[25] === 1'b1)) $display("HIT %0d", 65);
      if ((dut.k1_d2_N714 === 1'b1)) $display("HIT %0d", 66);
      if ((dut.m1_d1_sub_46_I7_carry[14] === 1'b1)) $display("HIT %0d", 67);
      if ((dut.kd1_d2_N735 === 1'b1)) $display("HIT %0d", 68);
      if ((dut.kd1_r100_ab_7__7_ === 1'b1)) $display("HIT %0d", 69);
      if ((dut.m1_d1_N2235 === 1'b1)) $display("HIT %0d", 70);
      if ((dut.m1_U3_U1_Z_5 === 1'b1)) $display("HIT %0d", 71);
      if ((dut.m1_d1_add_49_I8_aco_carry[3] === 1'b1)) $display("HIT %0d", 72);
      if ((dut.m1_mult_58_ab_7__6_ === 1'b1)) $display("HIT %0d", 73);
      if ((dut.kd1_d2_N562 === 1'b1)) $display("HIT %0d", 74);
      if ((dut.m1_d1_N21 === 1'b0)) $display("HIT %0d", 75);
      if ((dut.k1_r[2] === 1'b1)) $display("HIT %0d", 76);
      if ((dut.m1_mult_58_CARRYB_3__0_ === 1'b1)) $display("HIT %0d", 77);
      if ((dut.k1_d2_N646 === 1'b1)) $display("HIT %0d", 78);
      if ((dut.k1_d2_N466 === 1'b1)) $display("HIT %0d", 79);
      if ((dut.m1_d1_sub_46_I16_carry[14] === 1'b1)) $display("HIT %0d", 80);
      if ((dut.m1_d1_N118 === 1'b1)) $display("HIT %0d", 81);
      if ((dut.m1_mult_58_CARRYB_6__2_ === 1'b1)) $display("HIT %0d", 82);
      if ((dut.kd1_d2_N459 === 1'b1)) $display("HIT %0d", 83);
      if ((dut.k1_d2_N721 === 1'b1)) $display("HIT %0d", 84);
      if ((dut.m1_mult_58_ab_8__14_ === 1'b1)) $display("HIT %0d", 85);
      if ((dut.m1_d1_N1361 === 1'b1)) $display("HIT %0d", 86);
      if ((dut.m1_d1_add_49_I29_aco_carry[6] === 1'b1)) $display("HIT %0d", 87);
      if ((dut.k1_d2_add_49_I16_aco_n1 === 1'b1)) $display("HIT %0d", 88);
      if ((dut.kd1_r100_SUMB_1__10_ === 1'b1)) $display("HIT %0d", 89);
      if ((dut.m1_d1_sub_46_I32_carry[22] === 1'b1)) $display("HIT %0d", 90);
      if ((dut.kd1_d2_add_49_I2_aco_carry[10] === 1'b1)) $display("HIT %0d", 91);
      if ((dut.m1_d1_sub_46_I30_n1 === 1'b1)) $display("HIT %0d", 92);
      if ((dut.m1_mult_58_CARRYB_9__10_ === 1'b1)) $display("HIT %0d", 93);
      if ((dut.kd1_U3_U4_Z_11 === 1'b1)) $display("HIT %0d", 94);
      if ((dut.k1_d2_sub_46_I6_n3 === 1'b1)) $display("HIT %0d", 95);
      if ((dut.kd1_r100_ab_1__14_ === 1'b1)) $display("HIT %0d", 96);
      if ((dut.kd1_r100_ab_8__6_ === 1'b1)) $display("HIT %0d", 97);
      if ((dut.kd1_d2_N707 === 1'b1)) $display("HIT %0d", 98);
      if ((dut.m1_d1_sub_46_I15_carry[13] === 1'b1)) $display("HIT %0d", 99);
      if ((dut.m1_d1_N700 === 1'b1)) $display("HIT %0d", 100);
      if ((dut.n823 === 1'b1)) $display("HIT %0d", 101);
      if ((dut.n827 === 1'b1)) $display("HIT %0d", 102);
      if ((dut.kd1_A[18] === 1'b1)) $display("HIT %0d", 103);
      if ((dut.k1_d2_N66 === 1'b1)) $display("HIT %0d", 104);
      if ((dut.m1_d1_N429 === 1'b1)) $display("HIT %0d", 105);
      if ((dut.m1_d1_sub_46_I25_n1 === 1'b1)) $display("HIT %0d", 106);
      if ((dut.k1_d2_sub_46_I9_carry[13] === 1'b1)) $display("HIT %0d", 107);
      if ((dut.n1015 === 1'b1)) $display("HIT %0d", 108);
      if ((dut.m1_d1_sub_46_I22_carry[17] === 1'b1)) $display("HIT %0d", 109);
      if ((dut.m1_d1_N254 === 1'b1)) $display("HIT %0d", 110);
      if ((dut.k1_d2_sub_46_I6_n9 === 1'b1)) $display("HIT %0d", 111);
      if ((dut.n1289 === 1'b1)) $display("HIT %0d", 112);
      if ((dut.kd1_d2_n51 === 1'b1)) $display("HIT %0d", 113);
      if ((dut.m1_d1_N770 === 1'b1)) $display("HIT %0d", 114);
      if ((dut.m1_mult_58_CARRYB_15__5_ === 1'b1)) $display("HIT %0d", 115);
      if ((dut.m1_d1_N1541 === 1'b1)) $display("HIT %0d", 116);
      if ((dut.n960 === 1'b1)) $display("HIT %0d", 117);
      if ((dut.kd1_r102_ab_9__6_ === 1'b1)) $display("HIT %0d", 118);
      if ((dut.n836 === 1'b1)) $display("HIT %0d", 119);
      if ((dut.m1_d1_sub_46_I32_n41 === 1'b1)) $display("HIT %0d", 120);
      if ((dut.m1_mult_58_CARRYB_10__10_ === 1'b1)) $display("HIT %0d", 121);
      if ((dut.m1_d1_sub_46_I26_carry[30] === 1'b1)) $display("HIT %0d", 122);
      if ((dut.m1_mult_58_CARRYB_6__9_ === 1'b1)) $display("HIT %0d", 123);
      if ((dut.k1_d2_N546 === 1'b1)) $display("HIT %0d", 124);
      if ((dut.n808 === 1'b1) && (dut.m1_d1_N1741 === 1'b1)) $display("HIT %0d", 125);
      if ((dut.m1_d1_N2959 === 1'b1) && (dut.kd1_d2_add_49_I12_aco_carry[6] === 1'b1)) $display("HIT %0d", 126);
      if ((dut.m1_n49 === 1'b1) && (dut.k1_d2_N127 === 1'b1)) $display("HIT %0d", 127);
      if ((dut.n1090 === 1'b1) && (dut.m1_d1_sub_46_I21_carry[30] === 1'b1)) $display("HIT %0d", 128);
      if ((dut.n643 === 1'b1) && (dut.m1_d1_sub_46_I5_carry[20] === 1'b1)) $display("HIT %0d", 129);
      if ((dut.n1310 === 1'b1) && (dut.kd1_d2_sub_46_I12_carry[12] === 1'b1)) $display("HIT %0d", 130);
      if ((dut.kd1_d2_N204 === 1'b1) && (dut.m1_n27 === 1'b1)) $display("HIT %0d", 131);
      if ((dut.m1_d1_N685 === 1'b1) && (dut.kd1_r102_CARRYB_5__4_ === 1'b1)) $display("HIT %0d", 132);
      if ((dut.kd1_r102_ab_2__5_ === 1'b1) && (dut.m1_mult_58_CARRYB_7__3_ === 1'b1)) $display("HIT %0d", 133);
      if ((dut.k1_d2_N650 === 1'b1) && (dut.m1_d1_sub_46_I14_carry[22] === 1'b1)) $display("HIT %0d", 134);
      if ((dut.m1_d1_N115 === 1'b1) && (dut.k1_d2_N124 === 1'b1)) $display("HIT %0d", 135);
      if ((dut.kd1_d2_sub_46_I3_carry[8] === 1'b1) && (dut.m1_d1_N1868 === 1'b1)) $display("HIT %0d", 136);
      if ((dut.n616 === 1'b1) && (dut.m1_x[19] === 1'b1)) $display("HIT %0d", 137);
      if ((dut.n1343 === 1'b1) && (dut.k1_d2_sub_46_I10_carry[7] === 1'b1)) $display("HIT %0d", 138);
      if ((dut.kd1_d2_sub_46_I9_carry[4] === 1'b1) && (dut.n1025 === 1'b1)) $display("HIT %0d", 139);
      if ((dut.kd1_r100_SUMB_2__13_ === 1'b1) && (dut.kd1_d2_N534 === 1'b1)) $display("HIT %0d", 140);
      if ((dut.m1_d1_sub_46_I19_carry[18] === 1'b1) && (dut.kd1_d2_N646 === 1'b1)) $display("HIT %0d", 141);
      if ((dut.kd1_d2_add_49_I12_aco_carry[10] === 1'b1) && (dut.k1_d2_N540 === 1'b1)) $display("HIT %0d", 142);
      if ((dut.m1_d1_sub_46_I18_carry[16] === 1'b1) && (dut.m1_d1_N1217 === 1'b1)) $display("HIT %0d", 143);
      if ((dut.k1_d2_add_49_I10_aco_n1 === 1'b1) && (dut.kd1_d2_N694 === 1'b1)) $display("HIT %0d", 144);
      if ((dut.n1019 === 1'b1) && (dut.m1_mult_58_ab_7__8_ === 1'b1)) $display("HIT %0d", 145);
      if ((dut.kd1_r102_SUMB_3__9_ === 1'b1) && (dut.k1_d2_N727 === 1'b1)) $display("HIT %0d", 146);
      if ((dut.kd1_r100_ab_7__5_ === 1'b1) && (dut.n1268 === 1'b1)) $display("HIT %0d", 147);
      if ((dut.k1_mult_34_CARRYB_2__6_ === 1'b1) && (dut.m1_d1_N1276 === 1'b1)) $display("HIT %0d", 148);
      if ((dut.kd1_d2_N540 === 1'b1) && (dut.m1_d1_sub_46_I14_carry[13] === 1'b1)) $display("HIT %0d", 149);
      if ((dut.kd1_d2_N32 === 1'b1) && (dut.k1_n105 === 1'b1)) $display("HIT %0d", 150);
      if ((dut.m1_d1_sub_46_I15_carry[29] === 1'b1) && (dut.k1_d2_N416 === 1'b1)) $display("HIT %0d", 151);
      if ((dut.kd1_d2_sub_46_I3_carry[14] === 1'b1) && (dut.kd1_n216 === 1'b1)) $display("HIT %0d", 152);
      if ((dut.k1_n91 === 1'b1) && (dut.k1_n95 === 1'b1)) $display("HIT %0d", 153);
      if ((dut.m1_d1_N2329 === 1'b1) && (dut.kd1_d2_N309 === 1'b1)) $display("HIT %0d", 154);
      if ((dut.m1_d1_N2956 === 1'b1) && (dut.k1_d2_add_49_I5_aco_carry[14] === 1'b1)) $display("HIT %0d", 155);
      if ((dut.m1_d1_add_49_I26_aco_carry[2] === 1'b1) && (dut.kd1_r102_SUMB_12__3_ === 1'b1)) $display("HIT %0d", 156);
      if ((dut.kd1_r100_SUMB_3__10_ === 1'b1) && (dut.n1205 === 1'b1)) $display("HIT %0d", 157);
      if ((dut.k1_d2_N81 === 1'b1) && (dut.m1_d1_add_49_I9_aco_carry[3] === 1'b1)) $display("HIT %0d", 158);
      if ((dut.m1_d1_N2049 === 1'b1) && (dut.kd1_d2_N172 === 1'b1)) $display("HIT %0d", 159);
      if ((dut.m1_mult_58_ab_13__5_ === 1'b1) && (dut.k1_n78 === 1'b1)) $display("HIT %0d", 160);
      if ((dut.k1_d2_sub_46_I15_n12 === 1'b1) && (dut.k1_d2_N388 === 1'b1)) $display("HIT %0d", 161);
      if ((dut.k1_r[8] === 1'b1) && (dut.k1_d2_N301 === 1'b1)) $display("HIT %0d", 162);
      if ((dut.m1_d1_sub_46_I23_carry[26] === 1'b1) && (dut.m1_mult_58_FS_1_n49 === 1'b1)) $display("HIT %0d", 163);
      if ((dut.m1_d1_N174 === 1'b1) && (dut.n1227 === 1'b1)) $display("HIT %0d", 164);
      if ((dut.k1_mult_34_SUMB_3__11_ === 1'b1) && (dut.k1_d2_N599 === 1'b1)) $display("HIT %0d", 165);
      if ((dut.m1_mult_58_CARRYB_9__3_ === 1'b1) && (dut.m1_d1_sub_46_I14_carry[26] === 1'b1)) $display("HIT %0d", 166);
      if ((dut.m1_Mpower_29_ === 1'b1) && (dut.m1_d1_N1420 === 1'b1)) $display("HIT %0d", 167);
      if ((dut.n1250 === 1'b1) && (dut.n1014 === 1'b1)) $display("HIT %0d", 168);
      if ((dut.k1_n219 === 1'b0) && (dut.kd1_r102_ab_3__7_ === 1'b1)) $display("HIT %0d", 169);
      if ((dut.kd1_U3_U2_Z_11 === 1'b1) && (dut.k1_d2_N230 === 1'b1)) $display("HIT %0d", 170);
      if ((dut.k1_d2_N398 === 1'b1) && (dut.kd1_r102_SUMB_1__11_ === 1'b1)) $display("HIT %0d", 171);
      if ((dut.k1_d2_N547 === 1'b1) && (dut.kd1_d2_N638 === 1'b1)) $display("HIT %0d", 172);
      if ((dut.m1_d1_add_49_I30_aco_carry[5] === 1'b1) && (dut.n715 === 1'b1)) $display("HIT %0d", 173);
      if ((dut.k1_d2_N441 === 1'b1) && (dut.kd1_d2_add_49_I11_aco_carry[5] === 1'b1)) $display("HIT %0d", 174);
      if ((dut.k1_d2_n49 === 1'b1) && (dut.kd1_n15 === 1'b0)) $display("HIT %0d", 175);
      if ((dut.kd1_r102_ab_2__7_ === 1'b1) && (dut.n868 === 1'b1)) $display("HIT %0d", 176);
      if ((dut.kd1_d2_sub_46_I3_n1 === 1'b1) && (dut.n1044 === 1'b1)) $display("HIT %0d", 177);
      if ((dut.m1_d1_sub_46_I4_carry[29] === 1'b1) && (dut.m1_d1_N1150 === 1'b1)) $display("HIT %0d", 178);
      if ((dut.m1_d1_N3019 === 1'b1) && (dut.m1_d1_N456 === 1'b1)) $display("HIT %0d", 179);
      if ((dut.kd1_d2_sub_46_I16_n39 === 1'b1) && (dut.k1_d2_sub_46_I3_carry[11] === 1'b1)) $display("HIT %0d", 180);
      if ((dut.m1_d1_add_49_I8_aco_carry[2] === 1'b1) && (dut.kd1_n63 === 1'b0)) $display("HIT %0d", 181);
      if ((dut.m1_d1_N1362 === 1'b1) && (dut.k1_d2_N665 === 1'b1)) $display("HIT %0d", 182);
      if ((dut.k1_d2_N397 === 1'b1) && (dut.kd1_r102_CARRYB_5__5_ === 1'b1)) $display("HIT %0d", 183);
      if ((dut.k1_d2_sub_46_I16_carry[10] === 1'b1) && (dut.n1225 === 1'b1)) $display("HIT %0d", 184);
      if ((dut.n868 === 1'b1) && (dut.k1_d2_N252 === 1'b1)) $display("HIT %0d", 185);
      if ((dut.m1_d1_sub_46_I9_carry[24] === 1'b1) && (dut.m1_d1_N1669 === 1'b1)) $display("HIT %0d", 186);
      if ((dut.m1_d1_sub_46_I21_carry[1] === 1'b0) && (dut.m1_d1_add_49_I9_aco_n1 === 1'b1)) $display("HIT %0d", 187);
      if ((dut.k1_d2_N466 === 1'b1) && (dut.m1_d1_N237 === 1'b1)) $display("HIT %0d", 188);
      if ((dut.n819 === 1'b1) && (dut.m1_d1_N889 === 1'b1)) $display("HIT %0d", 189);
      if ((dut.k1_d2_sub_46_I12_n9 === 1'b1) && (dut.k1_d2_N213 === 1'b1)) $display("HIT %0d", 190);
      if ((dut.k1_d2_sub_46_I9_carry[9] === 1'b1) && (dut.m1_d1_N1478 === 1'b1)) $display("HIT %0d", 191);
      if ((dut.k1_d2_N5 === 1'b1) && (dut.m1_d1_N2959 === 1'b1)) $display("HIT %0d", 192);
      if ((dut.m1_d1_N1222 === 1'b1) && (dut.kd1_r102_ab_4__5_ === 1'b1)) $display("HIT %0d", 193);
      if ((dut.m1_d1_N1407 === 1'b1) && (dut.k1_d2_add_49_I14_aco_carry[9] === 1'b1)) $display("HIT %0d", 194);
      if ((dut.kd1_d2_sub_46_I9_carry[6] === 1'b1) && (dut.m1_mult_58_A1_28_ === 1'b1)) $display("HIT %0d", 195);
      if ((dut.k1_d2_sub_46_I9_carry[10] === 1'b1) && (dut.kd1_r100_SUMB_6__7_ === 1'b1)) $display("HIT %0d", 196);
      if ((dut.kd1_r100_CARRYB_9__5_ === 1'b1) && (dut.k1_d2_N604 === 1'b1)) $display("HIT %0d", 197);
      if ((dut.n615 === 1'b1) && (dut.n612 === 1'b1)) $display("HIT %0d", 198);
      if ((dut.k1_d2_add_49_I5_aco_carry[11] === 1'b1) && (dut.k1_d2_add_49_I9_aco_carry[6] === 1'b1)) $display("HIT %0d", 199);
      if ((dut.n1171 === 1'b1) && (dut.kd1_d2_N316 === 1'b1)) $display("HIT %0d", 200);
      if ((dut.m1_d1_N1077 === 1'b1) && (dut.m1_d1_add_49_I7_aco_n1 === 1'b1)) $display("HIT %0d", 201);
      if ((dut.kd1_r102_n7 === 1'b1) && (dut.k1_d2_N599 === 1'b1)) $display("HIT %0d", 202);
      if ((dut.m1_d1_N2578 === 1'b1) && (dut.kd1_d2_N296 === 1'b1)) $display("HIT %0d", 203);
      if ((dut.kd1_d2_sub_46_I13_carry[8] === 1'b1) && (dut.kd1_d2_N421 === 1'b1)) $display("HIT %0d", 204);
      if ((dut.kd1_r102_ab_5__5_ === 1'b1) && (dut.kd1_r100_ab_4__0_ === 1'b1)) $display("HIT %0d", 205);
      if ((dut.m1_d1_sub_46_I11_carry[10] === 1'b1) && (dut.kd1_d2_N35 === 1'b1)) $display("HIT %0d", 206);
      if ((dut.k1_mult_34_CARRYB_3__10_ === 1'b1) && (dut.m1_d1_sub_46_I32_n41 === 1'b1)) $display("HIT %0d", 207);
      if ((dut.k1_d2_sub_46_I10_carry[4] === 1'b1) && (dut.n832 === 1'b1)) $display("HIT %0d", 208);
      if ((dut.kd1_d2_N518 === 1'b1) && (dut.kd1_d2_sub_46_I2_carry[4] === 1'b1)) $display("HIT %0d", 209);
      if ((dut.k1_d2_sub_46_I14_n6 === 1'b1) && (dut.kd1_r102_ab_0__8_ === 1'b1)) $display("HIT %0d", 210);
      if ((dut.m1_mult_58_ab_4__9_ === 1'b1) && (dut.m1_d1_sub_46_I19_carry[11] === 1'b1)) $display("HIT %0d", 211);
      if ((dut.kd1_n25 === 1'b0) && (dut.m1_mult_58_CARRYB_5__0_ === 1'b1)) $display("HIT %0d", 212);
      if ((dut.k1_d2_N464 === 1'b1) && (dut.kd1_d2_N382 === 1'b1)) $display("HIT %0d", 213);
      if ((dut.k1_d2_sub_46_I9_n17 === 1'b1) && (dut.kd1_n75 === 1'b1)) $display("HIT %0d", 214);
      if ((dut.k1_d2_N6 === 1'b1) && (dut.k1_d2_sub_46_I10_carry[4] === 1'b1)) $display("HIT %0d", 215);
      if ((dut.m1_d1_N897 === 1'b1) && (dut.k1_d2_sub_46_I15_n8 === 1'b1)) $display("HIT %0d", 216);
      if ((dut.m1_d1_sub_46_I17_carry[12] === 1'b1) && (dut.kd1_d2_N344 === 1'b1)) $display("HIT %0d", 217);
      if ((dut.k1_d2_sub_46_I8_carry[4] === 1'b1) && (dut.kd1_r100_SUMB_13__2_ === 1'b1)) $display("HIT %0d", 218);
      if ((dut.kd1_r100_ab_1__12_ === 1'b1) && (dut.m1_d1_sub_46_I15_carry[20] === 1'b1)) $display("HIT %0d", 219);
      if ((dut.k1_d2_sub_46_I7_carry[9] === 1'b1) && (dut.kd1_d2_N405 === 1'b1)) $display("HIT %0d", 220);
      if ((dut.m1_d1_N244 === 1'b1) && (dut.kd1_d2_sub_46_I6_n7 === 1'b1)) $display("HIT %0d", 221);
      if ((dut.k1_d2_N426 === 1'b1) && (dut.k1_d2_sub_46_I13_n3 === 1'b1)) $display("HIT %0d", 222);
      if ((dut.k1_d2_add_49_I16_aco_carry[15] === 1'b1) && (dut.kd1_r102_CARRYB_6__0_ === 1'b1)) $display("HIT %0d", 223);
      if ((dut.m1_d1_add_49_I30_aco_carry[6] === 1'b1) && (dut.m1_d1_add_49_I20_aco_carry[2] === 1'b1)) $display("HIT %0d", 224);
      if ((dut.kd1_d2_sub_46_I3_n5 === 1'b1) && (dut.kd1_d2_add_49_I14_aco_carry[4] === 1'b1)) $display("HIT %0d", 225);
      if ((dut.m1_d1_sub_46_I21_carry[12] === 1'b1) && (dut.k1_d2_sub_46_I5_carry[9] === 1'b1)) $display("HIT %0d", 226);
      if ((dut.k1_d2_N225 === 1'b1) && (dut.m1_d1_N2610 === 1'b1)) $display("HIT %0d", 227);
      if ((dut.n1209 === 1'b1) && (dut.k1_d2_N729 === 1'b1)) $display("HIT %0d", 228);
      if ((dut.k1_d2_N147 === 1'b1) && (dut.k1_d2_N156 === 1'b1)) $display("HIT %0d", 229);
      if ((dut.k1_n141 === 1'b1) && (dut.k1_d2_add_49_I10_aco_carry[11] === 1'b1)) $display("HIT %0d", 230);
      if ((dut.m1_d1_sub_46_I21_carry[23] === 1'b1) && (dut.m1_d1_sub_46_I18_carry[27] === 1'b1)) $display("HIT %0d", 231);
      if ((dut.m1_mult_58_n27 === 1'b1) && (dut.m1_d1_sub_46_I29_carry[26] === 1'b1)) $display("HIT %0d", 232);
      if ((dut.k1_d2_sub_46_I3_n2 === 1'b1) && (dut.kd1_d2_add_49_I11_aco_carry[11] === 1'b1)) $display("HIT %0d", 233);
      if ((dut.m1_d1_N2515 === 1'b1) && (dut.m1_d1_sub_46_I7_carry[8] === 1'b1)) $display("HIT %0d", 234);
      if ((dut.m1_N79 === 1'b1) && (dut.m1_d1_N1210 === 1'b1)) $display("HIT %0d", 235);
      if ((dut.n1293 === 1'b1) && (dut.m1_d1_sub_46_I16_carry[13] === 1'b1)) $display("HIT %0d", 236);
      if ((dut.k1_d2_sub_46_I11_n8 === 1'b1) && (dut.kd1_d2_N567 === 1'b1)) $display("HIT %0d", 237);
      if ((dut.k1_d2_sub_46_I16_carry[9] === 1'b1) && (dut.m1_d1_N560 === 1'b1)) $display("HIT %0d", 238);
      if ((dut.m1_d1_N778 === 1'b1) && (dut.n1044 === 1'b1)) $display("HIT %0d", 239);
      if ((dut.kd1_d2_add_49_I3_aco_carry[10] === 1'b1) && (dut.k1_mult_34_CARRYB_6__7_ === 1'b1)) $display("HIT %0d", 240);
      if ((dut.m1_d1_N176 === 1'b1) && (dut.k1_gcd[11] === 1'b1)) $display("HIT %0d", 241);
      if ((dut.m1_d1_N2855 === 1'b1) && (dut.kd1_r100_SUMB_12__3_ === 1'b1)) $display("HIT %0d", 242);
      if ((dut.k1_d2_N401 === 1'b1) && (dut.m1_d1_sub_46_I13_carry[14] === 1'b1)) $display("HIT %0d", 243);
      if ((dut.k1_n146 === 1'b1) && (dut.k1_mult_34_CARRYB_8__6_ === 1'b1)) $display("HIT %0d", 244);
      if ((dut.n1252 === 1'b1) && (dut.kd1_d2_sub_46_I14_n5 === 1'b1)) $display("HIT %0d", 245);
      if ((dut.k1_d2_Res_2_ === 1'b1) && (dut.m1_d1_N2483 === 1'b1)) $display("HIT %0d", 246);
      if ((dut.m1_mult_58_ab_11__7_ === 1'b1) && (dut.m1_mult_58_CARRYB_6__10_ === 1'b1)) $display("HIT %0d", 247);
      if ((dut.kd1_d2_N556 === 1'b1) && (dut.kd1_d2_N590 === 1'b1)) $display("HIT %0d", 248);
      if ((dut.kd1_d2_add_49_I9_aco_carry[12] === 1'b1) && (dut.k1_d2_N133 === 1'b1)) $display("HIT %0d", 249);
      if ((dut.kd1_n40 === 1'b0) && (dut.m1_d1_add_49_I2_aco_carry[2] === 1'b1) && (dut.n1078 === 1'b1)) $display("HIT %0d", 250);
      if ((dut.k1_d2_N391 === 1'b1) && (dut.m1_d1_N1412 === 1'b1) && (dut.m1_mult_58_CARRYB_12__4_ === 1'b1)) $display("HIT %0d", 251);
      if ((dut.m1_d1_sub_46_n9 === 1'b1) && (dut.m1_mult_58_CARRYB_5__12_ === 1'b1) && (dut.n672 === 1'b1)) $display("HIT %0d", 252);
      if ((dut.kd1_d2_sub_46_I11_carry[4] === 1'b1) && (dut.n1190 === 1'b1) && (dut.k1_d2_N63 === 1'b1)) $display("HIT %0d", 253);
      if ((dut.k1_d2_sub_46_I4_carry[3] === 1'b1) && (dut.m1_Mpower_18_ === 1'b1) && (dut.kd1_r100_ab_4__8_ === 1'b1)) $display("HIT %0d", 254);
      if ((dut.m1_d1_N1806 === 1'b1) && (dut.m1_d1_N1347 === 1'b1) && (dut.m1_mult_58_CARRYB_5__13_ === 1'b1)) $display("HIT %0d", 255);
      if ((dut.kd1_d2_add_49_I5_aco_carry[14] === 1'b1) && (dut.n743 === 1'b1) && (dut.n728 === 1'b1)) $display("HIT %0d", 256);
      if ((dut.m1_d1_sub_46_I27_n1 === 1'b1) && (dut.m1_d1_N701 === 1'b1) && (dut.k1_d2_sub_46_I16_n15 === 1'b1)) $display("HIT %0d", 257);
      if ((dut.k1_d2_sub_46_I16_carry[15] === 1'b1) && (dut.m1_d1_N1671 === 1'b1) && (dut.m1_mult_58_SUMB_3__4_ === 1'b1)) $display("HIT %0d", 258);
      if ((dut.kd1_d2_N130 === 1'b1) && (dut.k1_d2_add_49_I12_aco_carry[3] === 1'b1) && (dut.m1_d1_sub_46_I14_carry[14] === 1'b1)) $display("HIT %0d", 259);
      if ((dut.kd1_d2_sub_46_I3_carry[11] === 1'b1) && (dut.m1_d1_N962 === 1'b1) && (dut.kd1_r100_ab_2__13_ === 1'b1)) $display("HIT %0d", 260);
      if ((dut.kd1_r102_n5 === 1'b1) && (dut.k1_d2_N435 === 1'b1) && (dut.k1_d2_N452 === 1'b1)) $display("HIT %0d", 261);
      if ((dut.kd1_d2_N658 === 1'b1) && (dut.k1_d2_N198 === 1'b1) && (dut.k1_d2_sub_46_I13_n15 === 1'b1)) $display("HIT %0d", 262);
      if ((dut.k1_x1[0] === 1'b1) && (dut.kd1_d2_add_49_I8_aco_carry[5] === 1'b1) && (dut.kd1_n200 === 1'b1)) $display("HIT %0d", 263);
      if ((dut.k1_random[13] === 1'b1) && (dut.kd1_d2_add_49_I13_aco_carry[8] === 1'b1) && (dut.m1_d1_add_49_I22_aco_carry[4] === 1'b1)) $display("HIT %0d", 264);
      if ((dut.m1_d1_N879 === 1'b1) && (dut.m1_d1_add_49_I11_aco_carry[3] === 1'b1) && (dut.k1_d2_sub_46_I3_n3 === 1'b1)) $display("HIT %0d", 265);
      if ((dut.kd1_d2_sub_46_I9_carry[14] === 1'b1) && (dut.kd1_d2_sub_46_I3_carry[4] === 1'b1) && (dut.k1_n49 === 1'b1)) $display("HIT %0d", 266);
      if ((dut.m1_d1_N449 === 1'b1) && (dut.m1_d1_N2281 === 1'b1) && (dut.kd1_d2_N91 === 1'b1)) $display("HIT %0d", 267);
      if ((dut.k1_d2_N101 === 1'b1) && (dut.k1_d2_N621 === 1'b1) && (dut.k1_d2_sub_46_I6_n9 === 1'b1)) $display("HIT %0d", 268);
      if ((dut.n571 === 1'b1) && (dut.k1_d2_N40 === 1'b1) && (dut.m1_d1_N643 === 1'b1)) $display("HIT %0d", 269);
      if ((dut.m1_Mpower_22_ === 1'b1) && (dut.n1347 === 1'b1) && (dut.m1_mult_58_ab_2__3_ === 1'b1)) $display("HIT %0d", 270);
      if ((dut.k1_d2_N620 === 1'b1) && (dut.kd1_r102_ab_8__6_ === 1'b1) && (dut.m1_d1_sub_46_I3_carry[16] === 1'b1)) $display("HIT %0d", 271);
      if ((dut.m1_d1_N911 === 1'b1) && (dut.k1_d2_sub_46_I7_n13 === 1'b1) && (dut.m1_d1_sub_46_I9_carry[10] === 1'b1)) $display("HIT %0d", 272);
      if ((dut.m1_d1_sub_46_I8_carry[27] === 1'b1) && (dut.k1_d2_add_49_I9_aco_carry[6] === 1'b1) && (dut.k1_d2_N723 === 1'b1)) $display("HIT %0d", 273);
      if ((dut.m1_mult_58_ab_14__14_ === 1'b1) && (dut.n1268 === 1'b1) && (dut.kd1_r102_ab_1__1_ === 1'b1)) $display("HIT %0d", 274);
      if ((dut.m1_d1_add_49_I29_aco_carry[8] === 1'b1) && (dut.kd1_d2_N492 === 1'b1) && (dut.m1_d1_N2762 === 1'b1)) $display("HIT %0d", 275);
      if ((dut.m1_N128 === 1'b1) && (dut.kd1_r100_CARRYB_3__10_ === 1'b1) && (dut.m1_d1_sub_46_I20_carry[10] === 1'b1)) $display("HIT %0d", 276);
      if ((dut.m1_d1_sub_46_I3_carry[21] === 1'b1) && (dut.m1_d1_N509 === 1'b1) && (dut.m1_d1_N19 === 1'b0)) $display("HIT %0d", 277);
      if ((dut.m1_U3_U1_Z_8 === 1'b1) && (dut.m1_d1_sub_46_I10_carry[15] === 1'b1) && (dut.n550 === 1'b1)) $display("HIT %0d", 278);
      if ((dut.kd1_r102_SUMB_10__3_ === 1'b1) && (dut.m1_d1_sub_46_I27_carry[25] === 1'b1) && (dut.m1_d1_N1343 === 1'b1)) $display("HIT %0d", 279);
      if ((dut.m1_d1_N1872 === 1'b1) && (dut.m1_mult_58_CARRYB_2__2_ === 1'b1) && (dut.k1_mult_34_CARRYB_9__0_ === 1'b1)) $display("HIT %0d", 280);
      if ((dut.kd1_r100_n15 === 1'b1) && (dut.kd1_d2_N185 === 1'b1) && (dut.k1_d2_sub_46_I4_n5 === 1'b1)) $display("HIT %0d", 281);
      if ((dut.kd1_d2_sub_46_I7_n1 === 1'b1) && (dut.m1_d1_sub_46_I19_carry[19] === 1'b1) && (dut.kd1_r100_SUMB_6__7_ === 1'b1)) $display("HIT %0d", 282);
      if ((dut.kd1_r100_CARRYB_3__1_ === 1'b1) && (dut.kd1_r102_CARRYB_9__5_ === 1'b1) && (dut.m1_d1_sub_46_I12_carry[21] === 1'b1)) $display("HIT %0d", 283);
      if ((dut.m1_d1_sub_46_I19_carry[24] === 1'b1) && (dut.m1_d1_sub_46_I32_carry[30] === 1'b1) && (dut.remainder[14] === 1'b1)) $display("HIT %0d", 284);
      if ((dut.m1_d1_sub_46_I5_carry[12] === 1'b1) && (dut.k1_mult_34_CARRYB_8__5_ === 1'b1) && (dut.m1_d1_N2269 === 1'b1)) $display("HIT %0d", 285);
      if ((dut.m1_d1_N258 === 1'b1) && (dut.m1_d1_N1159 === 1'b1) && (dut.m1_d1_sub_46_I27_carry[29] === 1'b1)) $display("HIT %0d", 286);
      if ((dut.k1_d2_N277 === 1'b1) && (dut.kd1_U3_U2_Z_15 === 1'b1) && (dut.kd1_d2_sub_46_I7_carry[6] === 1'b1)) $display("HIT %0d", 287);
      if ((dut.m1_d1_N835 === 1'b1) && (dut.m1_d1_N1351 === 1'b1) && (dut.m1_d1_sub_46_I10_carry[25] === 1'b1)) $display("HIT %0d", 288);
      if ((dut.kd1_d2_N494 === 1'b1) && (dut.n1243 === 1'b1) && (dut.m1_d1_N1606 === 1'b1)) $display("HIT %0d", 289);
      if ((dut.kd1_d2_N409 === 1'b1) && (dut.k1_d2_N51 === 1'b1) && (dut.m1_d1_sub_46_I10_carry[13] === 1'b1)) $display("HIT %0d", 290);
      if ((dut.kd1_d2_N426 === 1'b1) && (dut.m1_d1_add_49_I31_aco_carry[6] === 1'b1) && (dut.kd1_d2_N414 === 1'b1)) $display("HIT %0d", 291);
      if ((dut.m1_d1_N505 === 1'b1) && (dut.k1_d2_add_49_I5_aco_carry[12] === 1'b1) && (dut.kd1_r102_SUMB_9__5_ === 1'b1)) $display("HIT %0d", 292);
      if ((dut.k1_d2_sub_46_I2_n3 === 1'b1) && (dut.n944 === 1'b1) && (dut.m1_d1_N1091 === 1'b1)) $display("HIT %0d", 293);
      if ((dut.m1_mult_58_ab_5__9_ === 1'b1) && (dut.m1_mult_58_CARRYB_12__3_ === 1'b1) && (dut.kd1_r102_ab_8__5_ === 1'b1)) $display("HIT %0d", 294);
      if ((dut.m1_d1_N2988 === 1'b1) && (dut.m1_d1_N35 === 1'b1) && (dut.n1364 === 1'b1)) $display("HIT %0d", 295);
      if ((dut.kd1_d2_N132 === 1'b1) && (dut.k1_d2_sub_46_I4_carry[2] === 1'b1) && (dut.k1_d2_add_49_I15_aco_carry[5] === 1'b1)) $display("HIT %0d", 296);
      if ((dut.m1_d1_sub_46_I20_carry[20] === 1'b1) && (dut.n977 === 1'b1) && (dut.n1189 === 1'b1)) $display("HIT %0d", 297);
      if ((dut.kd1_r100_SUMB_4__11_ === 1'b1) && (dut.k1_mult_34_SUMB_1__13_ === 1'b1) && (dut.m1_mult_58_ab_13__10_ === 1'b1)) $display("HIT %0d", 298);
      if ((dut.m1_n56 === 1'b1) && (dut.kd1_d2_add_49_I9_aco_carry[7] === 1'b1) && (dut.kd1_d2_N101 === 1'b1)) $display("HIT %0d", 299);
      if ((dut.m1_d1_N1939 === 1'b1) && (dut.k1_x1[4] === 1'b1) && (dut.k1_d2_N731 === 1'b1)) $display("HIT %0d", 300);
      if ((dut.m1_d1_N235 === 1'b1) && (dut.k1_d2_sub_46_I6_n16 === 1'b1) && (dut.m1_d1_sub_46_I17_carry[31] === 1'b1)) $display("HIT %0d", 301);
      if ((dut.n1335 === 1'b1) && (dut.kd1_N111 === 1'b1) && (dut.k1_d2_N622 === 1'b1)) $display("HIT %0d", 302);
      if ((dut.m1_mult_58_CARRYB_6__8_ === 1'b1) && (dut.kd1_d2_N686 === 1'b1) && (dut.n551 === 1'b1)) $display("HIT %0d", 303);
      if ((dut.k1_d2_N553 === 1'b1) && (dut.kd1_d2_add_49_I5_aco_carry[6] === 1'b1) && (dut.kd1_d2_add_49_I8_aco_carry[3] === 1'b1)) $display("HIT %0d", 304);
      if ((dut.m1_d1_sub_46_I27_carry[30] === 1'b1) && (dut.kd1_d2_N404 === 1'b1) && (dut.k1_d2_sub_46_I4_carry[8] === 1'b1)) $display("HIT %0d", 305);
      if ((dut.kd1_d2_N241 === 1'b1) && (dut.n1125 === 1'b1) && (dut.k1_d2_N343 === 1'b1)) $display("HIT %0d", 306);
      if ((dut.kd1_d2_N579 === 1'b1) && (dut.kd1_r100_ab_1__9_ === 1'b1) && (dut.k1_d2_n49 === 1'b1)) $display("HIT %0d", 307);
      if ((dut.m1_d1_N1546 === 1'b1) && (dut.m1_d1_N1555 === 1'b1) && (dut.n1205 === 1'b1)) $display("HIT %0d", 308);
      if ((dut.kd1_d2_N249 === 1'b1) && (dut.m1_d1_sub_46_I5_carry[30] === 1'b1) && (dut.kd1_d2_N477 === 1'b1)) $display("HIT %0d", 309);
      if ((dut.m1_mult_58_CARRYB_15__14_ === 1'b1) && (dut.kd1_r102_CARRYB_3__9_ === 1'b1) && (dut.kd1_d2_N86 === 1'b1)) $display("HIT %0d", 310);
      if ((dut.kd1_d2_add_49_I6_aco_carry[5] === 1'b1) && (dut.m1_mult_58_ab_5__10_ === 1'b1) && (dut.m1_d1_N1493 === 1'b1)) $display("HIT %0d", 311);
      if ((dut.k1_n192 === 1'b1) && (dut.m1_d1_N241 === 1'b1) && (dut.m1_d1_N2855 === 1'b1)) $display("HIT %0d", 312);
      if ((dut.m1_d1_N2578 === 1'b1) && (dut.k1_d2_sub_46_I7_carry[8] === 1'b1) && (dut.kd1_r102_SUMB_3__10_ === 1'b1)) $display("HIT %0d", 313);
      if ((dut.k1_d2_sub_46_I5_n5 === 1'b1) && (dut.kd1_d2_sub_46_I14_n6 === 1'b1) && (dut.kd1_r100_n6 === 1'b1)) $display("HIT %0d", 314);
      if ((dut.m1_d1_N3010 === 1'b1) && (dut.kd1_d2_sub_46_I2_carry[14] === 1'b1) && (dut.m1_mult_58_ab_6__13_ === 1'b1)) $display("HIT %0d", 315);
      if ((dut.k1_d2_N744 === 1'b1) && (dut.k1_d2_add_49_I16_aco_carry[7] === 1'b1) && (dut.k1_d2_N739 === 1'b1)) $display("HIT %0d", 316);
      if ((dut.k1_d2_N740 === 1'b1) && (dut.m1_mult_58_SUMB_1__3_ === 1'b1) && (dut.m1_d1_add_49_I13_aco_carry[2] === 1'b1)) $display("HIT %0d", 317);
      if ((dut.k1_d2_N167 === 1'b1) && (dut.k1_d2_sub_46_I3_carry[6] === 1'b1) && (dut.m1_d1_sub_46_I14_carry[24] === 1'b1)) $display("HIT %0d", 318);
      if ((dut.kd1_d2_N140 === 1'b1) && (dut.m1_d1_sub_46_I8_carry[20] === 1'b1) && (dut.m1_d1_N2269 === 1'b1)) $display("HIT %0d", 319);
      if ((dut.k1_d2_add_49_I11_aco_n1 === 1'b1) && (dut.m1_d1_N1407 === 1'b1) && (dut.kd1_sub_53_n1 === 1'b1)) $display("HIT %0d", 320);
      if ((dut.m1_d1_sub_46_I20_carry[20] === 1'b1) && (dut.kd1_A[18] === 1'b1) && (dut.k1_d2_sub_46_I3_n5 === 1'b1)) $display("HIT %0d", 321);
      if ((dut.k1_d2_N51 === 1'b1) && (dut.k1_d2_N113 === 1'b1) && (dut.m1_d1_sub_46_I9_carry[24] === 1'b1)) $display("HIT %0d", 322);
      if ((dut.k1_n116 === 1'b1) && (dut.k1_d2_N361 === 1'b1) && (dut.k1_d2_sub_46_I13_n4 === 1'b1)) $display("HIT %0d", 323);
      if ((dut.kd1_d2_N630 === 1'b1) && (dut.kd1_A[15] === 1'b1) && (dut.kd1_d2_N220 === 1'b1)) $display("HIT %0d", 324);
      if ((dut.m1_mult_58_CARRYB_3__1_ === 1'b1) && (dut.n844 === 1'b1) && (dut.m1_d1_sub_46_I21_carry[1] === 1'b0)) $display("HIT %0d", 325);
      if ((dut.kd1_r100_ab_3__5_ === 1'b1) && (dut.n808 === 1'b1) && (dut.kd1_d2_N575 === 1'b1)) $display("HIT %0d", 326);
      if ((dut.m1_mult_58_CARRYB_14__13_ === 1'b1) && (dut.kd1_d2_sub_46_I5_n8 === 1'b1) && (dut.k1_d2_Res_12_ === 1'b1)) $display("HIT %0d", 327);
      if ((dut.k1_d2_N424 === 1'b1) && (dut.k1_d2_sub_46_I7_n10 === 1'b1) && (dut.k1_mult_34_CARRYB_3__2_ === 1'b1)) $display("HIT %0d", 328);
      if ((dut.m1_d1_N2008 === 1'b1) && (dut.m1_d1_N1806 === 1'b1) && (dut.k1_d2_add_49_I16_aco_carry[15] === 1'b1)) $display("HIT %0d", 329);
      if ((dut.k1_d2_N411 === 1'b1) && (dut.m1_d1_sub_46_I16_carry[16] === 1'b1) && (dut.k1_d2_N740 === 1'b1)) $display("HIT %0d", 330);
      if ((dut.k1_d2_N417 === 1'b1) && (dut.kd1_n151 === 1'b1) && (dut.k1_d2_N1 === 1'b1)) $display("HIT %0d", 331);
      if ((dut.m1_d1_N945 === 1'b1) && (dut.k1_r[1] === 1'b1) && (dut.m1_mult_58_ab_2__1_ === 1'b1)) $display("HIT %0d", 332);
      if ((dut.k1_d2_sub_46_I8_n4 === 1'b1) && (dut.m1_d1_N262 === 1'b1) && (dut.kd1_d2_N475 === 1'b1)) $display("HIT %0d", 333);
      if ((dut.kd1_sub_52_carry[4] === 1'b1) && (dut.m1_d1_sub_46_I5_carry[18] === 1'b1) && (dut.k1_d2_add_49_I5_aco_carry[7] === 1'b1)) $display("HIT %0d", 334);
      if ((dut.m1_d1_N702 === 1'b1) && (dut.kd1_A[20] === 1'b1) && (dut.kd1_d2_N630 === 1'b1)) $display("HIT %0d", 335);
      if ((dut.m1_d1_add_49_I12_aco_n1 === 1'b1) && (dut.kd1_r100_ab_7__6_ === 1'b1) && (dut.kd1_d2_sub_46_I16_n2 === 1'b1)) $display("HIT %0d", 336);
      if ((dut.k1_d2_N662 === 1'b1) && (dut.m1_d1_N2423 === 1'b1) && (dut.kd1_d2_sub_46_I5_n5 === 1'b1)) $display("HIT %0d", 337);
      if ((dut.k1_d2_sub_46_I7_carry[2] === 1'b1) && (dut.k1_d2_sub_46_I15_carry[2] === 1'b1) && (dut.k1_d2_N612 === 1'b1)) $display("HIT %0d", 338);
      if ((dut.n1290 === 1'b1) && (dut.m1_d1_sub_46_n6 === 1'b1) && (dut.m1_mult_58_ab_6__12_ === 1'b1)) $display("HIT %0d", 339);
      if ((dut.m1_d1_N55 === 1'b1) && (dut.k1_d2_sub_46_I5_carry[6] === 1'b1) && (dut.m1_x[29] === 1'b1)) $display("HIT %0d", 340);
      if ((dut.kd1_r100_CARRYB_5__1_ === 1'b1) && (dut.n807 === 1'b1) && (dut.n1085 === 1'b1)) $display("HIT %0d", 341);
      if ((dut.k1_d2_add_49_I14_aco_carry[12] === 1'b1) && (dut.n1165 === 1'b1) && (dut.m1_d1_sub_46_I10_carry[12] === 1'b1)) $display("HIT %0d", 342);
      if ((dut.m1_d1_N1093 === 1'b1) && (dut.m1_d1_sub_46_I3_carry[9] === 1'b1) && (dut.k1_d2_sub_46_I3_n2 === 1'b1)) $display("HIT %0d", 343);
      if ((dut.k1_d2_N357 === 1'b1) && (dut.kd1_d2_sub_46_I4_carry[14] === 1'b1) && (dut.m1_mult_58_ab_8__6_ === 1'b1)) $display("HIT %0d", 344);
      if ((dut.kd1_d2_add_49_I7_aco_n1 === 1'b1) && (dut.k1_mult_34_CARRYB_9__0_ === 1'b1) && (dut.k1_d2_sub_46_I6_n4 === 1'b1)) $display("HIT %0d", 345);
      if ((dut.m1_d1_sub_46_I12_carry[11] === 1'b1) && (dut.n1121 === 1'b1) && (dut.kd1_r100_ab_0__6_ === 1'b1)) $display("HIT %0d", 346);
      if ((dut.kd1_d2_add_49_aco_carry[13] === 1'b1) && (dut.kd1_r100_SUMB_2__11_ === 1'b1) && (dut.m1_d1_sub_46_I10_carry[25] === 1'b1)) $display("HIT %0d", 347);
      if ((dut.kd1_r102_ab_2__12_ === 1'b1) && (dut.kd1_n5 === 1'b1) && (dut.n865 === 1'b1)) $display("HIT %0d", 348);
      if ((dut.m1_d1_add_49_I25_aco_carry[3] === 1'b1) && (dut.m1_d1_sub_46_I27_carry[27] === 1'b1) && (dut.kd1_d2_add_49_I12_aco_carry[14] === 1'b1)) $display("HIT %0d", 349);
      if ((dut.kd1_d2_add_49_I6_aco_carry[3] === 1'b1) && (dut.kd1_r102_ab_2__3_ === 1'b1) && (dut.m1_d1_N1493 === 1'b1)) $display("HIT %0d", 350);
      if ((dut.m1_mult_58_CARRYB_10__3_ === 1'b1) && (dut.m1_mult_58_ab_9__8_ === 1'b1) && (dut.m1_d1_N1876 === 1'b1)) $display("HIT %0d", 351);
      if ((dut.m1_mult_58_ab_14__12_ === 1'b1) && (dut.kd1_r100_n2 === 1'b1) && (dut.kd1_d2_N90 === 1'b1)) $display("HIT %0d", 352);
      if ((dut.m1_d1_N185 === 1'b1) && (dut.n1281 === 1'b1) && (dut.k1_d2_sub_46_I2_n9 === 1'b1)) $display("HIT %0d", 353);
      if ((dut.m1_d1_sub_46_I5_carry[9] === 1'b1) && (dut.k1_d2_sub_46_I4_n17 === 1'b1) && (dut.k1_d2_N396 === 1'b1)) $display("HIT %0d", 354);
      if ((dut.k1_d2_N719 === 1'b1) && (dut.k1_d2_N567 === 1'b1) && (dut.n938 === 1'b1)) $display("HIT %0d", 355);
      if ((dut.m1_mult_58_FS_1_n12 === 1'b0) && (dut.k1_d2_n35 === 1'b1) && (dut.k1_d2_sub_46_I2_n15 === 1'b1)) $display("HIT %0d", 356);
      if ((dut.k1_d2_add_49_I5_aco_carry[9] === 1'b1) && (dut.kd1_d2_sub_46_I16_n32 === 1'b1) && (dut.k1_d2_sub_46_I11_n17 === 1'b1)) $display("HIT %0d", 357);
      if ((dut.k1_d2_sub_46_I3_carry[14] === 1'b1) && (dut.n729 === 1'b1) && (dut.k1_d2_N675 === 1'b1)) $display("HIT %0d", 358);
      if ((dut.k1_d2_sub_46_I12_carry[2] === 1'b1) && (dut.n638 === 1'b1) && (dut.kd1_d2_N354 === 1'b1)) $display("HIT %0d", 359);
      if ((dut.m1_d1_N2732 === 1'b1) && (dut.kd1_d2_N624 === 1'b1) && (dut.k1_n229 === 1'b0)) $display("HIT %0d", 360);
      if ((dut.m1_d1_N176 === 1'b1) && (dut.m1_d1_sub_46_I23_carry[17] === 1'b1) && (dut.n1339 === 1'b1)) $display("HIT %0d", 361);
      if ((dut.kd1_d2_N71 === 1'b1) && (dut.kd1_d2_N371 === 1'b1) && (dut.k1_d2_sub_46_I10_n3 === 1'b1)) $display("HIT %0d", 362);
      if ((dut.m1_d1_sub_46_I4_carry[10] === 1'b1) && (dut.kd1_r100_CARRYB_8__4_ === 1'b1) && (dut.m1_d1_sub_46_I11_carry[11] === 1'b1)) $display("HIT %0d", 363);
      if ((dut.m1_d1_sub_46_I7_carry[14] === 1'b1) && (dut.m1_d1_sub_46_I22_carry[19] === 1'b1) && (dut.n938 === 1'b1)) $display("HIT %0d", 364);
      if ((dut.kd1_d2_N640 === 1'b1) && (dut.n779 === 1'b1) && (dut.kd1_d2_N722 === 1'b1)) $display("HIT %0d", 365);
      if ((dut.m1_d1_sub_46_I16_carry[8] === 1'b1) && (dut.n1125 === 1'b1) && (dut.m1_N122 === 1'b1)) $display("HIT %0d", 366);
      if ((dut.k1_d2_N371 === 1'b1) && (dut.kd1_r100_ab_0__9_ === 1'b1) && (dut.k1_d2_sub_46_I5_carry[13] === 1'b1)) $display("HIT %0d", 367);
      if ((dut.kd1_d2_N475 === 1'b1) && (dut.k1_r[10] === 1'b1) && (dut.kd1_d2_N633 === 1'b1)) $display("HIT %0d", 368);
      if ((dut.k1_d2_N620 === 1'b1) && (dut.k1_d2_N491 === 1'b1) && (dut.k1_d2_N352 === 1'b1)) $display("HIT %0d", 369);
      if ((dut.kd1_r100_ab_7__5_ === 1'b1) && (dut.m1_mult_58_SUMB_1__1_ === 1'b1) && (dut.m1_mult_58_CARRYB_8__7_ === 1'b1)) $display("HIT %0d", 370);
      if ((dut.m1_d1_N389 === 1'b1) && (dut.k1_n206 === 1'b1) && (dut.k1_n29 === 1'b0)) $display("HIT %0d", 371);
      if ((dut.m1_mult_58_SUMB_1__8_ === 1'b1) && (dut.n1233 === 1'b1) && (dut.n1358 === 1'b1)) $display("HIT %0d", 372);
      if ((dut.m1_mult_58_CARRYB_3__6_ === 1'b1) && (dut.kd1_d2_add_49_I15_aco_carry[10] === 1'b1) && (dut.m1_mult_58_ab_2__11_ === 1'b1)) $display("HIT %0d", 373);
      if ((dut.n779 === 1'b1) && (dut.m1_mult_58_ab_7__4_ === 1'b1) && (dut.m1_d1_N1875 === 1'b1)) $display("HIT %0d", 374);
      if ((dut.kd1_d2_N680 === 1'b1) && (dut.kd1_A[29] === 1'b1) && (dut.k1_d2_N464 === 1'b1) && (dut.k1_d2_sub_46_I14_carry[8] === 1'b1)) $display("HIT %0d", 375);
      if ((dut.m1_Mpower_18_ === 1'b1) && (dut.m1_d1_N2174 === 1'b1) && (dut.n676 === 1'b1) && (dut.kd1_d2_sub_46_I5_carry[2] === 1'b1)) $display("HIT %0d", 376);
      if ((dut.m1_d1_N634 === 1'b1) && (dut.kd1_d2_sub_46_I5_carry[2] === 1'b1) && (dut.k1_n119 === 1'b1) && (dut.m1_mult_58_CARRYB_11__7_ === 1'b1)) $display("HIT %0d", 377);
      if ((dut.kd1_r102_CARRYB_10__2_ === 1'b1) && (dut.kd1_d2_N169 === 1'b1) && (dut.k1_d2_N665 === 1'b1) && (dut.m1_d1_sub_46_I9_carry[27] === 1'b1)) $display("HIT %0d", 378);
      if ((dut.kd1_r102_ab_5__1_ === 1'b1) && (dut.m1_d1_add_49_I26_aco_carry[3] === 1'b1) && (dut.kd1_sub_52_carry[13] === 1'b1) && (dut.n939 === 1'b1)) $display("HIT %0d", 379);
      if ((dut.k1_d2_sub_46_I8_carry[2] === 1'b1) && (dut.kd1_d2_sub_46_I14_carry[2] === 1'b1) && (dut.m1_d1_N1938 === 1'b1) && (dut.kd1_r102_ab_3__3_ === 1'b1)) $display("HIT %0d", 380);
      if ((dut.kd1_U3_U2_Z_13 === 1'b1) && (dut.k1_d2_sub_46_I11_carry[3] === 1'b1) && (dut.kd1_d2_N526 === 1'b1) && (dut.k1_d2_N367 === 1'b1)) $display("HIT %0d", 381);
      if ((dut.m1_mult_58_ab_5__9_ === 1'b1) && (dut.k1_d2_sub_46_I12_n5 === 1'b1) && (dut.m1_d1_N1811 === 1'b1) && (dut.k1_d2_N544 === 1'b1)) $display("HIT %0d", 382);
      if ((dut.m1_d1_sub_46_I9_carry[8] === 1'b1) && (dut.m1_d1_sub_46_I19_carry[23] === 1'b1) && (dut.n575 === 1'b1) && (dut.m1_d1_N185 === 1'b1)) $display("HIT %0d", 383);
      if ((dut.m1_d1_N1024 === 1'b1) && (dut.m1_d1_N1878 === 1'b1) && (dut.m1_mult_58_SUMB_2__1_ === 1'b1) && (dut.m1_mult_58_CARRYB_4__3_ === 1'b1)) $display("HIT %0d", 384);
      if ((dut.m1_d1_sub_46_I5_carry[19] === 1'b1) && (dut.e[6] === 1'b1) && (dut.m1_mult_58_ab_1__8_ === 1'b1) && (dut.k1_d2_sub_46_I9_n1 === 1'b1)) $display("HIT %0d", 385);
      if ((dut.n703 === 1'b1) && (dut.kd1_d2_sub_46_I2_carry[10] === 1'b1) && (dut.kd1_d2_N0 === 1'b1) && (dut.kd1_r102_ab_0__1_ === 1'b1)) $display("HIT %0d", 386);
      if ((dut.kd1_d2_N538 === 1'b1) && (dut.n1080 === 1'b1) && (dut.m1_d1_N131 === 1'b1) && (dut.k1_d2_N66 === 1'b1)) $display("HIT %0d", 387);
      if ((dut.kd1_d2_N2 === 1'b1) && (dut.kd1_d2_sub_46_I8_carry[13] === 1'b1) && (dut.kd1_r100_CARRYB_4__2_ === 1'b1) && (dut.n706 === 1'b1)) $display("HIT %0d", 388);
      if ((dut.m1_d1_N368 === 1'b1) && (dut.n1105 === 1'b1) && (dut.m1_d1_N1021 === 1'b1) && (dut.k1_n25 === 1'b1)) $display("HIT %0d", 389);
      if ((dut.m1_d1_N892 === 1'b1) && (dut.m1_d1_N251 === 1'b1) && (dut.m1_mult_58_CARRYB_13__12_ === 1'b1) && (dut.n669 === 1'b1)) $display("HIT %0d", 390);
      if ((dut.k1_mult_34_CARRYB_2__7_ === 1'b1) && (dut.n576 === 1'b1) && (dut.kd1_d2_N38 === 1'b1) && (dut.m1_d1_N2777 === 1'b1)) $display("HIT %0d", 391);
      if ((dut.k1_d2_N515 === 1'b1) && (dut.kd1_r100_CARRYB_2__5_ === 1'b1) && (dut.k1_mult_34_CARRYB_5__7_ === 1'b1) && (dut.kd1_d2_N126 === 1'b1)) $display("HIT %0d", 392);
      if ((dut.m1_d1_N1743 === 1'b1) && (dut.n1063 === 1'b1) && (dut.k1_mult_34_n10 === 1'b0) && (dut.m1_d1_N102 === 1'b1)) $display("HIT %0d", 393);
      if ((dut.k1_d2_N251 === 1'b1) && (dut.m1_d1_sub_46_I23_carry[28] === 1'b1) && (dut.kd1_r102_ab_7__5_ === 1'b1) && (dut.k1_d2_N79 === 1'b1)) $display("HIT %0d", 394);
      if ((dut.k1_d2_N273 === 1'b1) && (dut.n634 === 1'b1) && (dut.k1_d2_N719 === 1'b1) && (dut.m1_d1_sub_46_I22_carry[11] === 1'b1)) $display("HIT %0d", 395);
      if ((dut.m1_d1_N66 === 1'b1) && (dut.k1_d2_sub_46_I15_n8 === 1'b1) && (dut.kd1_d2_add_49_I4_aco_carry[7] === 1'b1) && (dut.k1_n228 === 1'b0)) $display("HIT %0d", 396);
      if ((dut.m1_d1_N27 === 1'b0) && (dut.kd1_n197 === 1'b1) && (dut.m1_d1_N1804 === 1'b1) && (dut.kd1_d2_N534 === 1'b1)) $display("HIT %0d", 397);
      if ((dut.k1_d2_N753 === 1'b1) && (dut.kd1_r102_ab_4__2_ === 1'b1) && (dut.m1_x[30] === 1'b1) && (dut.k1_mult_34_CARRYB_9__1_ === 1'b1)) $display("HIT %0d", 398);
      if ((dut.kd1_d2_N647 === 1'b1) && (dut.k1_d2_N109 === 1'b1) && (dut.kd1_r102_CARRYB_4__0_ === 1'b1) && (dut.kd1_r102_ab_10__2_ === 1'b1)) $display("HIT %0d", 399);
      if ((dut.m1_d1_add_49_I32_aco_carry[3] === 1'b1) && (dut.m1_d1_sub_46_I7_carry[29] === 1'b1) && (dut.n578 === 1'b1) && (dut.kd1_d2_N619 === 1'b1)) $display("HIT %0d", 400);
      if ((dut.k1_d2_sub_46_I2_n13 === 1'b1) && (dut.kd1_r100_SUMB_1__4_ === 1'b1) && (dut.m1_d1_N2777 === 1'b1) && (dut.kd1_d2_N99 === 1'b1)) $display("HIT %0d", 401);
      if ((dut.n770 === 1'b1) && (dut.n1231 === 1'b1) && (dut.n1268 === 1'b1) && (dut.kd1_r100_ab_8__0_ === 1'b1)) $display("HIT %0d", 402);
      if ((dut.n1053 === 1'b1) && (dut.kd1_d2_add_49_I14_aco_carry[3] === 1'b1) && (dut.m1_d1_add_49_I4_aco_carry[2] === 1'b1) && (dut.n1138 === 1'b1)) $display("HIT %0d", 403);
      if ((dut.k1_d2_N490 === 1'b1) && (dut.m1_d1_N2517 === 1'b1) && (dut.kd1_r102_ab_12__2_ === 1'b1) && (dut.kd1_d2_sub_46_I6_carry[11] === 1'b1)) $display("HIT %0d", 404);
      if ((dut.kd1_r102_SUMB_2__12_ === 1'b1) && (dut.kd1_d2_N340 === 1'b1) && (dut.k1_d2_sub_46_I2_carry[8] === 1'b1) && (dut.k1_d2_N513 === 1'b1)) $display("HIT %0d", 405);
      if ((dut.k1_random[8] === 1'b1) && (dut.n659 === 1'b1) && (dut.kd1_d2_N336 === 1'b1) && (dut.kd1_r102_ab_10__4_ === 1'b1)) $display("HIT %0d", 406);
      if ((dut.m1_d1_N438 === 1'b1) && (dut.kd1_d2_N718 === 1'b1) && (dut.m1_d1_sub_46_n5 === 1'b1) && (dut.k1_d2_N282 === 1'b1)) $display("HIT %0d", 407);
      if ((dut.kd1_d2_N96 === 1'b1) && (dut.m1_d1_add_49_I19_aco_carry[2] === 1'b1) && (dut.m1_mult_58_n28 === 1'b1) && (dut.m1_d1_N509 === 1'b1)) $display("HIT %0d", 408);
      if ((dut.k1_mult_34_CARRYB_4__9_ === 1'b1) && (dut.m1_d1_sub_46_I10_carry[24] === 1'b1) && (dut.m1_mult_58_CARRYB_12__7_ === 1'b1) && (dut.kd1_d2_sub_46_I12_n6 === 1'b1)) $display("HIT %0d", 409);
      if ((dut.kd1_outResult[14] === 1'b1) && (dut.n658 === 1'b1) && (dut.m1_mult_58_CARRYB_6__13_ === 1'b1) && (dut.m1_d1_sub_46_I23_carry[17] === 1'b1)) $display("HIT %0d", 410);
      if ((dut.m1_d1_N252 === 1'b1) && (dut.m1_d1_N1359 === 1'b1) && (dut.k1_d2_add_49_I4_aco_carry[13] === 1'b1) && (dut.kd1_d2_sub_46_I15_carry[5] === 1'b1)) $display("HIT %0d", 411);
      if ((dut.k1_d2_N664 === 1'b1) && (dut.m1_mult_58_CARRYB_3__3_ === 1'b1) && (dut.k1_d2_sub_46_I3_n1 === 1'b1) && (dut.kd1_d2_N129 === 1'b1)) $display("HIT %0d", 412);
      if ((dut.m1_d1_N1036 === 1'b1) && (dut.kd1_d2_N559 === 1'b1) && (dut.kd1_d2_add_49_I5_aco_carry[13] === 1'b1) && (dut.kd1_n152 === 1'b1)) $display("HIT %0d", 413);
      if ((dut.kd1_d2_N171 === 1'b1) && (dut.k1_d2_Res_8_ === 1'b1) && (dut.n1299 === 1'b1) && (dut.kd1_N116 === 1'b1)) $display("HIT %0d", 414);
      if ((dut.kd1_r102_SUMB_5__7_ === 1'b1) && (dut.m1_mult_58_ab_1__15_ === 1'b1) && (dut.kd1_r100_SUMB_1__6_ === 1'b1) && (dut.k1_d2_N482 === 1'b1)) $display("HIT %0d", 415);
      if ((dut.kd1_d2_sub_46_I16_n18 === 1'b1) && (dut.m1_d1_sub_46_I12_carry[8] === 1'b1) && (dut.kd1_r102_n15 === 1'b1) && (dut.kd1_r102_ab_5__4_ === 1'b1)) $display("HIT %0d", 416);
      if ((dut.k1_d2_sub_46_I11_carry[15] === 1'b1) && (dut.m1_d1_sub_46_I29_carry[18] === 1'b1) && (dut.kd1_d2_N335 === 1'b1) && (dut.kd1_d2_N571 === 1'b1)) $display("HIT %0d", 417);
      if ((dut.m1_n74 === 1'b0) && (dut.m1_d1_N1406 === 1'b1) && (dut.kd1_d2_N576 === 1'b1) && (dut.n1279 === 1'b1)) $display("HIT %0d", 418);
      if ((dut.n1284 === 1'b1) && (dut.m1_d1_sub_46_I29_carry[20] === 1'b1) && (dut.k1_mult_34_ab_9__2_ === 1'b1) && (dut.k1_d2_sub_46_I9_n14 === 1'b1)) $display("HIT %0d", 419);
      if ((dut.m1_N22 === 1'b1) && (dut.k1_random[2] === 1'b1) && (dut.n558 === 1'b1) && (dut.k1_d2_sub_46_I14_n1 === 1'b1)) $display("HIT %0d", 420);
      if ((dut.kd1_n147 === 1'b1) && (dut.m1_d1_N256 === 1'b1) && (dut.kd1_d2_add_49_I15_aco_carry[7] === 1'b1) && (dut.kd1_d2_sub_46_I14_carry[14] === 1'b1)) $display("HIT %0d", 421);
      if ((dut.kd1_d2_N40 === 1'b1) && (dut.kd1_d2_N641 === 1'b1) && (dut.m1_d1_add_49_I19_aco_carry[3] === 1'b1) && (dut.k1_d2_N43 === 1'b1)) $display("HIT %0d", 422);
      if ((dut.m1_d1_sub_46_I10_carry[30] === 1'b1) && (dut.m1_mult_58_CARRYB_2__9_ === 1'b1) && (dut.remainder[13] === 1'b1) && (dut.kd1_n172 === 1'b1)) $display("HIT %0d", 423);
      if ((dut.m1_d1_sub_46_I15_carry[27] === 1'b1) && (dut.m1_d1_N457 === 1'b1) && (dut.m1_d1_sub_46_I29_carry[23] === 1'b1) && (dut.kd1_N103 === 1'b1)) $display("HIT %0d", 424);
      if ((dut.n1220 === 1'b1) && (dut.m1_d1_sub_46_I27_carry[19] === 1'b1) && (dut.n1161 === 1'b1) && (dut.m1_d1_N639 === 1'b1)) $display("HIT %0d", 425);
      if ((dut.m1_mult_58_CARRYB_12__3_ === 1'b1) && (dut.n1160 === 1'b1) && (dut.m1_mult_58_ab_12__14_ === 1'b1) && (dut.n570 === 1'b1)) $display("HIT %0d", 426);
      if ((dut.kd1_r100_ab_6__9_ === 1'b1) && (dut.kd1_d2_sub_46_I9_n5 === 1'b1) && (dut.m1_d1_N839 === 1'b1) && (dut.n832 === 1'b1)) $display("HIT %0d", 427);
      if ((dut.k1_n195 === 1'b1) && (dut.m1_mult_58_ab_14__6_ === 1'b1) && (dut.m1_d1_N178 === 1'b1) && (dut.k1_n127 === 1'b1)) $display("HIT %0d", 428);
      if ((dut.kd1_r100_ab_7__0_ === 1'b1) && (dut.m1_d1_sub_46_I7_carry[18] === 1'b1) && (dut.m1_d1_sub_46_I22_carry[15] === 1'b1) && (dut.kd1_d2_N668 === 1'b1)) $display("HIT %0d", 429);
      if ((dut.k1_d2_sub_46_I15_carry[14] === 1'b1) && (dut.n936 === 1'b1) && (dut.kd1_r100_CARRYB_5__9_ === 1'b1) && (dut.m1_d1_N2932 === 1'b1)) $display("HIT %0d", 430);
      if ((dut.k1_n86 === 1'b1) && (dut.kd1_d2_N180 === 1'b1) && (dut.n680 === 1'b1) && (dut.n1268 === 1'b1)) $display("HIT %0d", 431);
      if ((dut.m1_N80 === 1'b1) && (dut.m1_d1_N438 === 1'b1) && (dut.m1_d1_N2992 === 1'b1) && (dut.m1_d1_N879 === 1'b1)) $display("HIT %0d", 432);
      if ((dut.m1_d1_N2808 === 1'b1) && (dut.k1_d2_N32 === 1'b1) && (dut.n684 === 1'b1) && (dut.kd1_r102_CARRYB_6__4_ === 1'b1)) $display("HIT %0d", 433);
      if ((dut.m1_d1_N1818 === 1'b1) && (dut.n1295 === 1'b1) && (dut.k1_mult_34_ab_5__9_ === 1'b1) && (dut.n1376 === 1'b1)) $display("HIT %0d", 434);
      if ((dut.kd1_d2_sub_46_I7_carry[12] === 1'b1) && (dut.n965 === 1'b1) && (dut.n1142 === 1'b1) && (dut.k1_d2_N330 === 1'b1)) $display("HIT %0d", 435);
      if ((dut.k1_d2_N3 === 1'b1) && (dut.m1_d1_N640 === 1'b1) && (dut.m1_mult_58_A1_26_ === 1'b1) && (dut.k1_d2_sub_46_I3_carry[8] === 1'b1)) $display("HIT %0d", 436);
      if ((dut.k1_d2_N279 === 1'b1) && (dut.m1_d1_add_49_I29_aco_carry[6] === 1'b1) && (dut.n1326 === 1'b1) && (dut.k1_mult_34_SUMB_5__8_ === 1'b1)) $display("HIT %0d", 437);
      if ((dut.m1_d1_sub_46_I2_carry[23] === 1'b1) && (dut.kd1_r100_ab_11__0_ === 1'b1) && (dut.k1_d2_N727 === 1'b1) && (dut.m1_d1_N1552 === 1'b1)) $display("HIT %0d", 438);
      if ((dut.m1_d1_sub_46_I7_carry[12] === 1'b1) && (dut.kd1_d2_sub_46_I5_carry[6] === 1'b1) && (dut.k1_mult_34_n10 === 1'b0) && (dut.kd1_d2_N226 === 1'b1)) $display("HIT %0d", 439);
      if ((dut.k1_n136 === 1'b1) && (dut.k1_d2_Res_4_ === 1'b1) && (dut.k1_d2_N694 === 1'b1) && (dut.m1_d1_N1617 === 1'b1)) $display("HIT %0d", 440);
      if ((dut.n693 === 1'b1) && (dut.m1_d1_sub_46_I9_carry[23] === 1'b1) && (dut.m1_d1_N1276 === 1'b1) && (dut.kd1_d2_N62 === 1'b1)) $display("HIT %0d", 441);
      if ((dut.m1_d1_sub_46_I18_carry[27] === 1'b1) && (dut.m1_mult_58_CARRYB_12__0_ === 1'b1) && (dut.kd1_d2_N63 === 1'b1) && (dut.k1_d2_N571 === 1'b1)) $display("HIT %0d", 442);
      if ((dut.m1_d1_sub_46_I17_carry[22] === 1'b1) && (dut.m1_d1_N1349 === 1'b1) && (dut.k1_d2_N562 === 1'b1) && (dut.m1_mult_58_CARRYB_12__10_ === 1'b1)) $display("HIT %0d", 443);
      if ((dut.k1_d2_N359 === 1'b1) && (dut.m1_Mpower_29_ === 1'b1) && (dut.m1_d1_N1082 === 1'b1) && (dut.k1_d2_N471 === 1'b1)) $display("HIT %0d", 444);
      if ((dut.kd1_d2_sub_46_I11_n8 === 1'b1) && (dut.kd1_d2_add_49_aco_carry[3] === 1'b1) && (dut.m1_d1_sub_46_I32_carry[20] === 1'b1) && (dut.m1_mult_58_CARRYB_5__7_ === 1'b1)) $display("HIT %0d", 445);
      if ((dut.k1_d2_N369 === 1'b1) && (dut.kd1_r100_CARRYB_7__2_ === 1'b1) && (dut.kd1_d2_N239 === 1'b1) && (dut.kd1_r100_CARRYB_3__9_ === 1'b1)) $display("HIT %0d", 446);
      if ((dut.kd1_d2_add_49_I7_aco_carry[5] === 1'b1) && (dut.kd1_d2_N561 === 1'b1) && (dut.m1_Mpower_23_ === 1'b1) && (dut.n1193 === 1'b1)) $display("HIT %0d", 447);
      if ((dut.k1_d2_sub_46_I3_carry[5] === 1'b1) && (dut.m1_d1_N1949 === 1'b1) && (dut.m1_d1_sub_46_I25_carry[17] === 1'b1) && (dut.kd1_d2_N570 === 1'b1)) $display("HIT %0d", 448);
      if ((dut.n726 === 1'b1) && (dut.m1_d1_N61 === 1'b1) && (dut.kd1_d2_N726 === 1'b1) && (dut.m1_d1_N249 === 1'b1)) $display("HIT %0d", 449);
      if ((dut.k1_random[1] === 1'b1) && (dut.m1_mult_58_SUMB_1__13_ === 1'b1) && (dut.kd1_d2_N549 === 1'b1) && (dut.n875 === 1'b1)) $display("HIT %0d", 450);
      if ((dut.m1_d1_add_49_I31_aco_carry[3] === 1'b1) && (dut.kd1_d2_N370 === 1'b1) && (dut.kd1_r100_CARRYB_13__1_ === 1'b1) && (dut.m1_d1_N303 === 1'b1)) $display("HIT %0d", 451);
      if ((dut.k1_n100 === 1'b1) && (dut.k1_n148 === 1'b1) && (dut.kd1_d2_N297 === 1'b1) && (dut.kd1_d2_N23 === 1'b1)) $display("HIT %0d", 452);
      if ((dut.m1_d1_sub_46_I15_carry[9] === 1'b1) && (dut.kd1_d2_sub_46_I6_n3 === 1'b1) && (dut.k1_d2_sub_46_I12_n6 === 1'b1) && (dut.kd1_d2_sub_46_I8_carry[15] === 1'b1)) $display("HIT %0d", 453);
      if ((dut.kd1_d2_add_49_I3_aco_carry[3] === 1'b1) && (dut.k1_d2_N356 === 1'b1) && (dut.m1_d1_N956 === 1'b1) && (dut.n827 === 1'b1)) $display("HIT %0d", 454);
      if ((dut.m1_d1_add_49_I24_aco_carry[7] === 1'b1) && (dut.kd1_N112 === 1'b1) && (dut.m1_d1_sub_46_I15_carry[11] === 1'b1) && (dut.k1_d2_N207 === 1'b1)) $display("HIT %0d", 455);
      if ((dut.m1_mult_58_ab_7__6_ === 1'b1) && (dut.k1_d2_N396 === 1'b1) && (dut.m1_d1_N563 === 1'b1) && (dut.m1_d1_sub_46_I2_carry[16] === 1'b1)) $display("HIT %0d", 456);
      if ((dut.k1_d2_N33 === 1'b1) && (dut.m1_mult_58_ab_8__4_ === 1'b1) && (dut.k1_n62 === 1'b1) && (dut.kd1_r100_CARRYB_6__5_ === 1'b1)) $display("HIT %0d", 457);
      if ((dut.k1_d2_N713 === 1'b1) && (dut.k1_d2_N650 === 1'b1) && (dut.k1_d2_N575 === 1'b1) && (dut.kd1_r100_CARRYB_5__5_ === 1'b1)) $display("HIT %0d", 458);
      if ((dut.m1_d1_N299 === 1'b1) && (dut.m1_d1_sub_46_I27_carry[29] === 1'b1) && (dut.m1_d1_N1420 === 1'b1) && (dut.n915 === 1'b1)) $display("HIT %0d", 459);
      if ((dut.n686 === 1'b1) && (dut.m1_mult_58_ab_0__8_ === 1'b1) && (dut.kd1_d2_N562 === 1'b1) && (dut.kd1_r100_ab_2__6_ === 1'b1)) $display("HIT %0d", 460);
      if ((dut.k1_mult_34_ab_6__9_ === 1'b1) && (dut.k1_d2_N707 === 1'b1) && (dut.k1_d2_N713 === 1'b1) && (dut.m1_mult_58_n29 === 1'b1)) $display("HIT %0d", 461);
      if ((dut.m1_n45 === 1'b1) && (dut.kd1_d2_N18 === 1'b1) && (dut.kd1_d2_sub_46_I13_n6 === 1'b1) && (dut.kd1_d2_sub_46_I16_n6 === 1'b1)) $display("HIT %0d", 462);
      if ((dut.m1_d1_sub_46_I4_carry[13] === 1'b1) && (dut.m1_d1_N1479 === 1'b1) && (dut.kd1_r100_CARRYB_5__5_ === 1'b1) && (dut.kd1_d2_sub_46_I5_carry[14] === 1'b1)) $display("HIT %0d", 463);
      if ((dut.kd1_d2_N397 === 1'b1) && (dut.kd1_d2_N730 === 1'b1) && (dut.k1_d2_N726 === 1'b1) && (dut.k1_d2_N97 === 1'b1)) $display("HIT %0d", 464);
      if ((dut.kd1_d2_N39 === 1'b1) && (dut.k1_d2_add_49_I2_aco_carry[2] === 1'b1) && (dut.m1_d1_sub_46_I19_carry[26] === 1'b1) && (dut.m1_d1_sub_46_I29_carry[25] === 1'b1)) $display("HIT %0d", 465);
      if ((dut.m1_d1_N1947 === 1'b1) && (dut.m1_d1_sub_46_I7_carry[18] === 1'b1) && (dut.kd1_r102_CARRYB_6__7_ === 1'b1) && (dut.n671 === 1'b1)) $display("HIT %0d", 466);
      if ((dut.kd1_d2_add_49_I6_aco_carry[13] === 1'b1) && (dut.m1_d1_sub_46_I10_carry[9] === 1'b1) && (dut.m1_d1_N969 === 1'b1) && (dut.m1_U3_U1_Z_14 === 1'b1)) $display("HIT %0d", 467);
      if ((dut.kd1_d2_sub_46_I13_carry[9] === 1'b1) && (dut.k1_d2_N698 === 1'b1) && (dut.kd1_d2_N565 === 1'b1) && (dut.m1_d1_sub_46_I22_carry[25] === 1'b1)) $display("HIT %0d", 468);
      if ((dut.kd1_r102_ab_2__12_ === 1'b1) && (dut.m1_d1_sub_46_I9_carry[17] === 1'b1) && (dut.kd1_d2_sub_46_I16_n22 === 1'b1) && (dut.kd1_d2_sub_46_I11_carry[15] === 1'b1)) $display("HIT %0d", 469);
      if ((dut.k1_d2_add_49_I12_aco_carry[14] === 1'b1) && (dut.m1_d1_sub_46_I11_carry[24] === 1'b1) && (dut.m1_mult_58_CARRYB_15__7_ === 1'b1) && (dut.m1_d1_N66 === 1'b1)) $display("HIT %0d", 470);
      if ((dut.m1_d1_sub_46_I19_carry[16] === 1'b1) && (dut.kd1_d2_N203 === 1'b1) && (dut.m1_d1_sub_46_I11_carry[28] === 1'b1) && (dut.n1208 === 1'b1)) $display("HIT %0d", 471);
      if ((dut.m1_mult_58_ab_0__13_ === 1'b1) && (dut.k1_d2_N0 === 1'b1) && (dut.m1_n80 === 1'b0) && (dut.n711 === 1'b1)) $display("HIT %0d", 472);
      if ((dut.n1284 === 1'b1) && (dut.n756 === 1'b1) && (dut.m1_d1_sub_46_I16_carry[22] === 1'b1) && (dut.kd1_d2_sub_46_I8_carry[15] === 1'b1)) $display("HIT %0d", 473);
      if ((dut.m1_n56 === 1'b1) && (dut.kd1_r100_CARRYB_2__5_ === 1'b1) && (dut.m1_d1_sub_46_I18_carry[20] === 1'b1) && (dut.n568 === 1'b1)) $display("HIT %0d", 474);
      if ((dut.m1_mult_58_CARRYB_6__6_ === 1'b1) && (dut.m1_d1_N2330 === 1'b1) && (dut.kd1_d2_sub_46_I16_n20 === 1'b1) && (dut.kd1_r102_CARRYB_10__4_ === 1'b1)) $display("HIT %0d", 475);
      if ((dut.m1_d1_add_49_I8_aco_carry[3] === 1'b1) && (dut.k1_d2_sub_46_I2_n12 === 1'b1) && (dut.n771 === 1'b1) && (dut.m1_d1_add_49_I31_aco_carry[2] === 1'b1)) $display("HIT %0d", 476);
      if ((dut.k1_d2_N226 === 1'b1) && (dut.m1_d1_N816 === 1'b1) && (dut.kd1_r100_CARRYB_4__7_ === 1'b1) && (dut.m1_d1_N2174 === 1'b1)) $display("HIT %0d", 477);
      if ((dut.k1_d2_sub_46_I13_n16 === 1'b1) && (dut.kd1_d2_N619 === 1'b1) && (dut.kd1_d2_N274 === 1'b1) && (dut.kd1_d2_N678 === 1'b1)) $display("HIT %0d", 478);
      if ((dut.kd1_sub_52_carry[7] === 1'b1) && (dut.n925 === 1'b1) && (dut.d[14] === 1'b1) && (dut.k1_d2_N233 === 1'b1)) $display("HIT %0d", 479);
      if ((dut.kd1_d2_N234 === 1'b1) && (dut.kd1_d2_sub_46_I4_n4 === 1'b1) && (dut.m1_d1_N2545 === 1'b1) && (dut.k1_d2_N633 === 1'b1)) $display("HIT %0d", 480);
      if ((dut.m1_d1_N965 === 1'b1) && (dut.kd1_r102_CARRYB_4__5_ === 1'b1) && (dut.k1_d2_sub_46_I7_carry[15] === 1'b1) && (dut.n819 === 1'b1)) $display("HIT %0d", 481);
      if ((dut.m1_d1_N1360 === 1'b1) && (dut.kd1_r100_SUMB_12__3_ === 1'b1) && (dut.m1_d1_N1295 === 1'b1) && (dut.k1_d2_N126 === 1'b1)) $display("HIT %0d", 482);
      if ((dut.m1_d1_sub_46_I22_carry[24] === 1'b1) && (dut.k1_n15 === 1'b1) && (dut.m1_mult_58_n3 === 1'b1) && (dut.m1_d1_N886 === 1'b1)) $display("HIT %0d", 483);
      if ((dut.k1_n243 === 1'b1) && (dut.n1165 === 1'b1) && (dut.kd1_d2_N408 === 1'b1) && (dut.m1_N73 === 1'b1)) $display("HIT %0d", 484);
      if ((dut.k1_n187 === 1'b1) && (dut.m1_mult_58_ab_8__4_ === 1'b1) && (dut.k1_d2_N238 === 1'b1) && (dut.kd1_r102_ab_1__11_ === 1'b1)) $display("HIT %0d", 485);
      if ((dut.m1_d1_sub_46_I32_carry[24] === 1'b1) && (dut.kd1_r102_ab_5__4_ === 1'b1) && (dut.n1335 === 1'b1) && (dut.m1_d1_N426 === 1'b1)) $display("HIT %0d", 486);
      if ((dut.m1_d1_N194 === 1'b1) && (dut.m1_d1_sub_46_I17_carry[31] === 1'b1) && (dut.n1022 === 1'b1) && (dut.kd1_d2_N243 === 1'b1)) $display("HIT %0d", 487);
      if ((dut.k1_gcd[13] === 1'b1) && (dut.m1_d1_N133 === 1'b1) && (dut.k1_d2_sub_46_I4_n5 === 1'b1) && (dut.k1_d2_N628 === 1'b1)) $display("HIT %0d", 488);
      if ((dut.m1_d1_N435 === 1'b1) && (dut.k1_d2_N537 === 1'b1) && (dut.kd1_r100_ab_10__5_ === 1'b1) && (dut.k1_d2_N629 === 1'b1)) $display("HIT %0d", 489);
      if ((dut.kd1_r102_ab_12__2_ === 1'b1) && (dut.m1_d1_N521 === 1'b1) && (dut.k1_d2_Res_3_ === 1'b1) && (dut.m1_d1_sub_46_I13_carry[29] === 1'b1)) $display("HIT %0d", 490);
      if ((dut.m1_n57 === 1'b1) && (dut.kd1_d2_add_49_I14_aco_carry[3] === 1'b1) && (dut.k1_d2_N359 === 1'b1) && (dut.m1_d1_N1612 === 1'b1)) $display("HIT %0d", 491);
      if ((dut.m1_d1_sub_46_I6_carry[17] === 1'b1) && (dut.m1_d1_N1354 === 1'b1) && (dut.kd1_d2_add_49_I3_aco_carry[9] === 1'b1) && (dut.m1_mult_58_ab_8__0_ === 1'b1)) $display("HIT %0d", 492);
      if ((dut.m1_d1_N244 === 1'b1) && (dut.kd1_n25 === 1'b0) && (dut.kd1_d2_N6 === 1'b1) && (dut.m1_d1_add_49_I17_aco_n1 === 1'b1)) $display("HIT %0d", 493);
      if ((dut.m1_mult_58_ab_4__13_ === 1'b1) && (dut.k1_d2_add_49_I10_aco_carry[7] === 1'b1) && (dut.m1_d1_N435 === 1'b1) && (dut.kd1_d2_add_49_I2_aco_carry[13] === 1'b1)) $display("HIT %0d", 494);
      if ((dut.n757 === 1'b1) && (dut.m1_mult_58_ab_1__12_ === 1'b1) && (dut.n1255 === 1'b1) && (dut.kd1_r102_SUMB_1__14_ === 1'b1)) $display("HIT %0d", 495);
      if ((dut.k1_d2_sub_46_I8_carry[15] === 1'b1) && (dut.m1_d1_N570 === 1'b1) && (dut.kd1_d2_sub_46_I15_carry[12] === 1'b1) && (dut.k1_x1[5] === 1'b1)) $display("HIT %0d", 496);
      if ((dut.m1_mult_58_ab_4__4_ === 1'b1) && (dut.kd1_d2_N631 === 1'b1) && (dut.kd1_r100_SUMB_7__7_ === 1'b1) && (dut.k1_d2_sub_46_I12_carry[6] === 1'b1)) $display("HIT %0d", 497);
      if ((dut.k1_d2_N119 === 1'b1) && (dut.k1_n61 === 1'b1) && (dut.kd1_r102_SUMB_1__8_ === 1'b1) && (dut.kd1_n48 === 1'b0)) $display("HIT %0d", 498);
      if ((dut.m1_d1_N580 === 1'b1) && (dut.k1_d2_n61 === 1'b1) && (dut.k1_d2_add_49_I3_aco_carry[12] === 1'b1) && (dut.k1_d2_N232 === 1'b1)) $display("HIT %0d", 499);
    end
  endtask

endmodule
