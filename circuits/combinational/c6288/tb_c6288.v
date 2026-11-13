`timescale 1ns/1ps

////////////////////////////////////////////////////////////////////////////////
// Standalone Gate-Level Combinational Verification Testbench: C6288
// Primary Inputs:  32
// Primary Outputs: 32
// Test Patterns:   1164 MC-ATPG Patterns
// Injected Trojans: 199
////////////////////////////////////////////////////////////////////////////////

module tb_c6288;

  localparam NUM_PIS = 32;
  localparam NUM_POS = 32;
  localparam MAX_PATS = 100000;
  localparam CLK_PERIOD = 10;

  reg [NUM_PIS-1:0] pi_mem [0:MAX_PATS-1];
  reg [NUM_PIS-1:0] pi;
  wire [NUM_POS-1:0] po;

  integer p_idx, total_pats, fd, scan_ret;
  integer hit_count = 0;
  reg [198:0] hit_recorded;

  // Fully Connected Combinational DUT Instance
  c6288 dut (
    .N1(pi[0]),
    .N18(pi[1]),
    .N35(pi[2]),
    .N52(pi[3]),
    .N69(pi[4]),
    .N86(pi[5]),
    .N103(pi[6]),
    .N120(pi[7]),
    .N137(pi[8]),
    .N154(pi[9]),
    .N171(pi[10]),
    .N188(pi[11]),
    .N205(pi[12]),
    .N222(pi[13]),
    .N239(pi[14]),
    .N256(pi[15]),
    .N273(pi[16]),
    .N290(pi[17]),
    .N307(pi[18]),
    .N324(pi[19]),
    .N341(pi[20]),
    .N358(pi[21]),
    .N375(pi[22]),
    .N392(pi[23]),
    .N409(pi[24]),
    .N426(pi[25]),
    .N443(pi[26]),
    .N460(pi[27]),
    .N477(pi[28]),
    .N494(pi[29]),
    .N511(pi[30]),
    .N528(pi[31]),
    .N545(po[0]),
    .N1581(po[1]),
    .N1901(po[2]),
    .N2223(po[3]),
    .N2548(po[4]),
    .N2877(po[5]),
    .N3211(po[6]),
    .N3552(po[7]),
    .N3895(po[8]),
    .N4241(po[9]),
    .N4591(po[10]),
    .N4946(po[11]),
    .N5308(po[12]),
    .N5672(po[13]),
    .N5971(po[14]),
    .N6123(po[15]),
    .N6150(po[16]),
    .N6160(po[17]),
    .N6170(po[18]),
    .N6180(po[19]),
    .N6190(po[20]),
    .N6200(po[21]),
    .N6210(po[22]),
    .N6220(po[23]),
    .N6230(po[24]),
    .N6240(po[25]),
    .N6250(po[26]),
    .N6260(po[27]),
    .N6270(po[28]),
    .N6280(po[29]),
    .N6287(po[30]),
    .N6288(po[31])
  );

  initial begin
    // Load ASCII binary test patterns dynamically
    fd = $fopen("scan_pi.txt", "r");
    if (fd == 0) begin
      $display("[-] ERROR: Could not open scan_pi.txt");
      $finish;
    end
    total_pats = 0;
    while (!$feof(fd) && total_pats < MAX_PATS) begin
      scan_ret = $fscanf(fd, "%b\n", pi_mem[total_pats]);
      if (scan_ret == 1) begin
        total_pats = total_pats + 1;
      end
    end
    $fclose(fd);

    $display("================================================================================");
    $display("[START] Running Gate-Level Trojan Activation Testbench: C6288 (%0d patterns)", total_pats);
    $display("================================================================================");

    hit_recorded = 0;
    pi = 0;
    #20;

    // Pattern Replay Loop
    for (p_idx = 0; p_idx < total_pats; p_idx = p_idx + 1) begin
      pi = pi_mem[p_idx];
      #CLK_PERIOD; // Allow combinational logic to propagate and settle
      check_trojans();
    end

    $display("================================================================================");
    $display("[DONE] Simulation Complete. Total Unique Trojans Triggered: %0d / 199", hit_count);
    $display("================================================================================");
    $finish;
  end

  task check_trojans;
    begin
      if (dut.N2338 === 1'b1) begin
        if (!hit_recorded[0]) begin
          hit_recorded[0] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 0);
        end
      end
      if (dut.N5234 === 1'b1) begin
        if (!hit_recorded[1]) begin
          hit_recorded[1] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 1);
        end
      end
      if (dut.N5213 === 1'b1) begin
        if (!hit_recorded[2]) begin
          hit_recorded[2] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 2);
        end
      end
      if (dut.N5817 === 1'b1) begin
        if (!hit_recorded[3]) begin
          hit_recorded[3] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 3);
        end
      end
      if (dut.N3300 === 1'b1) begin
        if (!hit_recorded[4]) begin
          hit_recorded[4] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 4);
        end
      end
      if (dut.N2639 === 1'b1) begin
        if (!hit_recorded[5]) begin
          hit_recorded[5] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 5);
        end
      end
      if (dut.N2348 === 1'b1) begin
        if (!hit_recorded[6]) begin
          hit_recorded[6] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 6);
        end
      end
      if (dut.N1490 === 1'b1) begin
        if (!hit_recorded[7]) begin
          hit_recorded[7] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 7);
        end
      end
      if (dut.N5725 === 1'b1) begin
        if (!hit_recorded[8]) begin
          hit_recorded[8] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 8);
        end
      end
      if (dut.N4963 === 1'b1) begin
        if (!hit_recorded[9]) begin
          hit_recorded[9] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 9);
        end
      end
      if (dut.N5670 === 1'b1) begin
        if (!hit_recorded[10]) begin
          hit_recorded[10] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 10);
        end
      end
      if (dut.N4460 === 1'b1) begin
        if (!hit_recorded[11]) begin
          hit_recorded[11] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 11);
        end
      end
      if (dut.N4812 === 1'b1) begin
        if (!hit_recorded[12]) begin
          hit_recorded[12] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 12);
        end
      end
      if (dut.N5768 === 1'b1) begin
        if (!hit_recorded[13]) begin
          hit_recorded[13] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 13);
        end
      end
      if (dut.N3327 === 1'b1) begin
        if (!hit_recorded[14]) begin
          hit_recorded[14] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 14);
        end
      end
      if (dut.N5365 === 1'b1) begin
        if (!hit_recorded[15]) begin
          hit_recorded[15] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 15);
        end
      end
      if (dut.N3474 === 1'b1) begin
        if (!hit_recorded[16]) begin
          hit_recorded[16] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 16);
        end
      end
      if (dut.N2997 === 1'b1) begin
        if (!hit_recorded[17]) begin
          hit_recorded[17] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 17);
        end
      end
      if (dut.N4879 === 1'b1) begin
        if (!hit_recorded[18]) begin
          hit_recorded[18] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 18);
        end
      end
      if (dut.N4384 === 1'b1) begin
        if (!hit_recorded[19]) begin
          hit_recorded[19] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 19);
        end
      end
      if (dut.N4173 === 1'b1) begin
        if (!hit_recorded[20]) begin
          hit_recorded[20] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 20);
        end
      end
      if (dut.N3160 === 1'b1) begin
        if (!hit_recorded[21]) begin
          hit_recorded[21] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 21);
        end
      end
      if (dut.N1688 === 1'b1) begin
        if (!hit_recorded[22]) begin
          hit_recorded[22] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 22);
        end
      end
      if (dut.N2667 === 1'b1) begin
        if (!hit_recorded[23]) begin
          hit_recorded[23] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 23);
        end
      end
      if (dut.N1458 === 1'b1) begin
        if (!hit_recorded[24]) begin
          hit_recorded[24] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 24);
        end
      end
      if (dut.N6235 === 1'b1) begin
        if (!hit_recorded[25]) begin
          hit_recorded[25] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 25);
        end
      end
      if (dut.N4995 === 1'b1) begin
        if (!hit_recorded[26]) begin
          hit_recorded[26] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 26);
        end
      end
      if (dut.N2659 === 1'b1) begin
        if (!hit_recorded[27]) begin
          hit_recorded[27] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 27);
        end
      end
      if (dut.N5155 === 1'b1) begin
        if (!hit_recorded[28]) begin
          hit_recorded[28] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 28);
        end
      end
      if (dut.N5331 === 1'b1) begin
        if (!hit_recorded[29]) begin
          hit_recorded[29] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 29);
        end
      end
      if (dut.N4395 === 1'b1) begin
        if (!hit_recorded[30]) begin
          hit_recorded[30] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 30);
        end
      end
      if (dut.N4393 === 1'b1) begin
        if (!hit_recorded[31]) begin
          hit_recorded[31] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 31);
        end
      end
      if (dut.N3494 === 1'b1) begin
        if (!hit_recorded[32]) begin
          hit_recorded[32] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 32);
        end
      end
      if (dut.N2682 === 1'b1) begin
        if (!hit_recorded[33]) begin
          hit_recorded[33] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 33);
        end
      end
      if (dut.N3150 === 1'b1) begin
        if (!hit_recorded[34]) begin
          hit_recorded[34] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 34);
        end
      end
      if (dut.N3845 === 1'b1) begin
        if (!hit_recorded[35]) begin
          hit_recorded[35] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 35);
        end
      end
      if (dut.N5042 === 1'b1) begin
        if (!hit_recorded[36]) begin
          hit_recorded[36] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 36);
        end
      end
      if (dut.N2264 === 1'b1) begin
        if (!hit_recorded[37]) begin
          hit_recorded[37] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 37);
        end
      end
      if (dut.N4353 === 1'b1) begin
        if (!hit_recorded[38]) begin
          hit_recorded[38] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 38);
        end
      end
      if (dut.N4870 === 1'b1) begin
        if (!hit_recorded[39]) begin
          hit_recorded[39] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 39);
        end
      end
      if (dut.N6133 === 1'b1) begin
        if (!hit_recorded[40]) begin
          hit_recorded[40] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 40);
        end
      end
      if (dut.N3657 === 1'b1) begin
        if (!hit_recorded[41]) begin
          hit_recorded[41] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 41);
        end
      end
      if (dut.N2650 === 1'b1) begin
        if (!hit_recorded[42]) begin
          hit_recorded[42] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 42);
        end
      end
      if (dut.N3484 === 1'b1) begin
        if (!hit_recorded[43]) begin
          hit_recorded[43] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 43);
        end
      end
      if (dut.N6175 === 1'b1) begin
        if (!hit_recorded[44]) begin
          hit_recorded[44] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 44);
        end
      end
      if (dut.N1511 === 1'b1) begin
        if (!hit_recorded[45]) begin
          hit_recorded[45] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 45);
        end
      end
      if (dut.N1546 === 1'b1) begin
        if (!hit_recorded[46]) begin
          hit_recorded[46] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 46);
        end
      end
      if (dut.N3333 === 1'b1) begin
        if (!hit_recorded[47]) begin
          hit_recorded[47] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 47);
        end
      end
      if (dut.N2841 === 1'b1) begin
        if (!hit_recorded[48]) begin
          hit_recorded[48] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 48);
        end
      end
      if (dut.N5420 === 1'b1) begin
        if (!hit_recorded[49]) begin
          hit_recorded[49] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 49);
        end
      end
      if (dut.N4100 === 1'b1) begin
        if (!hit_recorded[50]) begin
          hit_recorded[50] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 50);
        end
      end
      if (dut.N2330 === 1'b1) begin
        if (!hit_recorded[51]) begin
          hit_recorded[51] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 51);
        end
      end
      if (dut.N2166 === 1'b1) begin
        if (!hit_recorded[52]) begin
          hit_recorded[52] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 52);
        end
      end
      if (dut.N5596 === 1'b1) begin
        if (!hit_recorded[53]) begin
          hit_recorded[53] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 53);
        end
      end
      if (dut.N3850 === 1'b1) begin
        if (!hit_recorded[54]) begin
          hit_recorded[54] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 54);
        end
      end
      if (dut.N4359 === 1'b1) begin
        if (!hit_recorded[55]) begin
          hit_recorded[55] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 55);
        end
      end
      if (dut.N2657 === 1'b1) begin
        if (!hit_recorded[56]) begin
          hit_recorded[56] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 56);
        end
      end
      if (dut.N2159 === 1'b1) begin
        if (!hit_recorded[57]) begin
          hit_recorded[57] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 57);
        end
      end
      if (dut.N4632 === 1'b1) begin
        if (!hit_recorded[58]) begin
          hit_recorded[58] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 58);
        end
      end
      if (dut.N2462 === 1'b1) begin
        if (!hit_recorded[59]) begin
          hit_recorded[59] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 59);
        end
      end
      if (dut.N6000 === 1'b1) begin
        if (!hit_recorded[60]) begin
          hit_recorded[60] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 60);
        end
      end
      if (dut.N1824 === 1'b1) begin
        if (!hit_recorded[61]) begin
          hit_recorded[61] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 61);
        end
      end
      if (dut.N5759 === 1'b1) begin
        if (!hit_recorded[62]) begin
          hit_recorded[62] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 62);
        end
      end
      if (dut.N4049 === 1'b1) begin
        if (!hit_recorded[63]) begin
          hit_recorded[63] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 63);
        end
      end
      if (dut.N2923 === 1'b1) begin
        if (!hit_recorded[64]) begin
          hit_recorded[64] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 64);
        end
      end
      if (dut.N4561 === 1'b1) begin
        if (!hit_recorded[65]) begin
          hit_recorded[65] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 65);
        end
      end
      if (dut.N3206 === 1'b1) begin
        if (!hit_recorded[66]) begin
          hit_recorded[66] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 66);
        end
      end
      if (dut.N6195 === 1'b1) begin
        if (!hit_recorded[67]) begin
          hit_recorded[67] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 67);
        end
      end
      if (dut.N4138 === 1'b1) begin
        if (!hit_recorded[68]) begin
          hit_recorded[68] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 68);
        end
      end
      if (dut.N5113 === 1'b1) begin
        if (!hit_recorded[69]) begin
          hit_recorded[69] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 69);
        end
      end
      if (dut.N5966 === 1'b1) begin
        if (!hit_recorded[70]) begin
          hit_recorded[70] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 70);
        end
      end
      if (dut.N4875 === 1'b1) begin
        if (!hit_recorded[71]) begin
          hit_recorded[71] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 71);
        end
      end
      if (dut.N5051 === 1'b1) begin
        if (!hit_recorded[72]) begin
          hit_recorded[72] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 72);
        end
      end
      if (dut.N3360 === 1'b1) begin
        if (!hit_recorded[73]) begin
          hit_recorded[73] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 73);
        end
      end
      if (dut.N3339 === 1'b1) begin
        if (!hit_recorded[74]) begin
          hit_recorded[74] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 74);
        end
      end
      if (dut.N2169 === 1'b1) begin
        if (!hit_recorded[75]) begin
          hit_recorded[75] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 75);
        end
      end
      if (dut.N3881 === 1'b1) begin
        if (!hit_recorded[76]) begin
          hit_recorded[76] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 76);
        end
      end
      if (dut.N4178 === 1'b1) begin
        if (!hit_recorded[77]) begin
          hit_recorded[77] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 77);
        end
      end
      if (dut.N6106 === 1'b1) begin
        if (!hit_recorded[78]) begin
          hit_recorded[78] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 78);
        end
      end
      if (dut.N2222 === 1'b1) begin
        if (!hit_recorded[79]) begin
          hit_recorded[79] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 79);
        end
      end
      if (dut.N3662 === 1'b1) begin
        if (!hit_recorded[80]) begin
          hit_recorded[80] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 80);
        end
      end
      if (dut.N2334 === 1'b1) begin
        if (!hit_recorded[81]) begin
          hit_recorded[81] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 81);
        end
      end
      if (dut.N5030 === 1'b1) begin
        if (!hit_recorded[82]) begin
          hit_recorded[82] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 82);
        end
      end
      if (dut.N4587 === 1'b1) begin
        if (!hit_recorded[83]) begin
          hit_recorded[83] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 83);
        end
      end
      if (dut.N4779 === 1'b1) begin
        if (!hit_recorded[84]) begin
          hit_recorded[84] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 84);
        end
      end
      if (dut.N5244 === 1'b1) begin
        if (!hit_recorded[85]) begin
          hit_recorded[85] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 85);
        end
      end
      if (dut.N4899 === 1'b1) begin
        if (!hit_recorded[86]) begin
          hit_recorded[86] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 86);
        end
      end
      if (dut.N3602 === 1'b1) begin
        if (!hit_recorded[87]) begin
          hit_recorded[87] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 87);
        end
      end
      if (dut.N5658 === 1'b1) begin
        if (!hit_recorded[88]) begin
          hit_recorded[88] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 88);
        end
      end
      if (dut.N6101 === 1'b1) begin
        if (!hit_recorded[89]) begin
          hit_recorded[89] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 89);
        end
      end
      if (dut.N1708 === 1'b1) begin
        if (!hit_recorded[90]) begin
          hit_recorded[90] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 90);
        end
      end
      if (dut.N5236 === 1'b1) begin
        if (!hit_recorded[91]) begin
          hit_recorded[91] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 91);
        end
      end
      if (dut.N2661 === 1'b1) begin
        if (!hit_recorded[92]) begin
          hit_recorded[92] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 92);
        end
      end
      if (dut.N2164 === 1'b1) begin
        if (!hit_recorded[93]) begin
          hit_recorded[93] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 93);
        end
      end
      if (dut.N1874 === 1'b1) begin
        if (!hit_recorded[94]) begin
          hit_recorded[94] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 94);
        end
      end
      if (dut.N5364 === 1'b1) begin
        if (!hit_recorded[95]) begin
          hit_recorded[95] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 95);
        end
      end
      if (dut.N2332 === 1'b1) begin
        if (!hit_recorded[96]) begin
          hit_recorded[96] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 96);
        end
      end
      if (dut.N5844 === 1'b1) begin
        if (!hit_recorded[97]) begin
          hit_recorded[97] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 97);
        end
      end
      if (dut.N2826 === 1'b1) begin
        if (!hit_recorded[98]) begin
          hit_recorded[98] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 98);
        end
      end
      if (dut.N5945 === 1'b1) begin
        if (!hit_recorded[99]) begin
          hit_recorded[99] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 99);
        end
      end
      if (dut.N2475 === 1'b1) begin
        if (!hit_recorded[100]) begin
          hit_recorded[100] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 100);
        end
      end
      if (dut.N4534 === 1'b1) begin
        if (!hit_recorded[101]) begin
          hit_recorded[101] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 101);
        end
      end
      if (dut.N1836 === 1'b1) begin
        if (!hit_recorded[102]) begin
          hit_recorded[102] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 102);
        end
      end
      if (dut.N3145 === 1'b1) begin
        if (!hit_recorded[103]) begin
          hit_recorded[103] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 103);
        end
      end
      if (dut.N3581 === 1'b1) begin
        if (!hit_recorded[104]) begin
          hit_recorded[104] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 104);
        end
      end
      if (dut.N2149 === 1'b1) begin
        if (!hit_recorded[105]) begin
          hit_recorded[105] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 105);
        end
      end
      if (dut.N1876 === 1'b1) begin
        if (!hit_recorded[106]) begin
          hit_recorded[106] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 106);
        end
      end
      if (dut.N5954 === 1'b1) begin
        if (!hit_recorded[107]) begin
          hit_recorded[107] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 107);
        end
      end
      if (dut.N6185 === 1'b1) begin
        if (!hit_recorded[108]) begin
          hit_recorded[108] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 108);
        end
      end
      if (dut.N1571 === 1'b1) begin
        if (!hit_recorded[109]) begin
          hit_recorded[109] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 109);
        end
      end
      if (dut.N1859 === 1'b1) begin
        if (!hit_recorded[110]) begin
          hit_recorded[110] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 110);
        end
      end
      if (dut.N2156 === 1'b1) begin
        if (!hit_recorded[111]) begin
          hit_recorded[111] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 111);
        end
      end
      if (dut.N4285 === 1'b1) begin
        if (!hit_recorded[112]) begin
          hit_recorded[112] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 112);
        end
      end
      if (dut.N3208 === 1'b1) begin
        if (!hit_recorded[113]) begin
          hit_recorded[113] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 113);
        end
      end
      if (dut.N3668 === 1'b1) begin
        if (!hit_recorded[114]) begin
          hit_recorded[114] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 114);
        end
      end
      if (dut.N4737 === 1'b1) begin
        if (!hit_recorded[115]) begin
          hit_recorded[115] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 115);
        end
      end
      if (dut.N1889 === 1'b1) begin
        if (!hit_recorded[116]) begin
          hit_recorded[116] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 116);
        end
      end
      if (dut.N5146 === 1'b1) begin
        if (!hit_recorded[117]) begin
          hit_recorded[117] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 117);
        end
      end
      if (dut.N4150 === 1'b1) begin
        if (!hit_recorded[118]) begin
          hit_recorded[118] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 118);
        end
      end
      if (dut.N3804 === 1'b1) begin
        if (!hit_recorded[119]) begin
          hit_recorded[119] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 119);
        end
      end
      if (dut.N3185 === 1'b1) begin
        if (!hit_recorded[120]) begin
          hit_recorded[120] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 120);
        end
      end
      if (dut.N2184 === 1'b1) begin
        if (!hit_recorded[121]) begin
          hit_recorded[121] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 121);
        end
      end
      if (dut.N3930 === 1'b1) begin
        if (!hit_recorded[122]) begin
          hit_recorded[122] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 122);
        end
      end
      if (dut.N5747 === 1'b1) begin
        if (!hit_recorded[123]) begin
          hit_recorded[123] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 123);
        end
      end
      if (dut.N2317 === 1'b1) begin
        if (!hit_recorded[124]) begin
          hit_recorded[124] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 124);
        end
      end
      if (dut.N2033 === 1'b1 && dut.N4759 === 1'b1) begin
        if (!hit_recorded[125]) begin
          hit_recorded[125] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 125);
        end
      end
      if (dut.N2486 === 1'b1 && dut.N2856 === 1'b1) begin
        if (!hit_recorded[126]) begin
          hit_recorded[126] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 126);
        end
      end
      if (dut.N5738 === 1'b1 && dut.N1450 === 1'b1) begin
        if (!hit_recorded[127]) begin
          hit_recorded[127] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 127);
        end
      end
      if (dut.N3494 === 1'b1 && dut.N1498 === 1'b1) begin
        if (!hit_recorded[128]) begin
          hit_recorded[128] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 128);
        end
      end
      if (dut.N2543 === 1'b1 && dut.N1856 === 1'b1) begin
        if (!hit_recorded[129]) begin
          hit_recorded[129] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 129);
        end
      end
      if (dut.N3360 === 1'b1 && dut.N2977 === 1'b1) begin
        if (!hit_recorded[130]) begin
          hit_recorded[130] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 130);
        end
      end
      if (dut.N3335 === 1'b1 && dut.N2744 === 1'b1) begin
        if (!hit_recorded[131]) begin
          hit_recorded[131] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 131);
        end
      end
      if (dut.N2022 === 1'b1 && dut.N3542 === 1'b1) begin
        if (!hit_recorded[132]) begin
          hit_recorded[132] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 132);
        end
      end
      if (dut.N2336 === 1'b1 && dut.N1702 === 1'b1) begin
        if (!hit_recorded[133]) begin
          hit_recorded[133] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 133);
        end
      end
      if (dut.N1874 === 1'b1 && dut.N5030 === 1'b1) begin
        if (!hit_recorded[134]) begin
          hit_recorded[134] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 134);
        end
      end
      if (dut.N4355 === 1'b1 && dut.N2151 === 1'b1) begin
        if (!hit_recorded[135]) begin
          hit_recorded[135] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 135);
        end
      end
      if (dut.N2016 === 1'b1 && dut.N5768 === 1'b1) begin
        if (!hit_recorded[136]) begin
          hit_recorded[136] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 136);
        end
      end
      if (dut.N4138 === 1'b1 && dut.N1854 === 1'b1) begin
        if (!hit_recorded[137]) begin
          hit_recorded[137] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 137);
        end
      end
      if (dut.N4357 === 1'b1 && dut.N3348 === 1'b1) begin
        if (!hit_recorded[138]) begin
          hit_recorded[138] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 138);
        end
      end
      if (dut.N1708 === 1'b1 && dut.N4047 === 1'b1) begin
        if (!hit_recorded[139]) begin
          hit_recorded[139] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 139);
        end
      end
      if (dut.N6165 === 1'b1 && dut.N4439 === 1'b1) begin
        if (!hit_recorded[140]) begin
          hit_recorded[140] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 140);
        end
      end
      if (dut.N4696 === 1'b1 && dut.N1551 === 1'b1) begin
        if (!hit_recorded[141]) begin
          hit_recorded[141] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 141);
        end
      end
      if (dut.N4098 === 1'b1 && dut.N4716 === 1'b1) begin
        if (!hit_recorded[142]) begin
          hit_recorded[142] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 142);
        end
      end
      if (dut.N4849 === 1'b1 && dut.N4215 === 1'b1) begin
        if (!hit_recorded[143]) begin
          hit_recorded[143] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 143);
        end
      end
      if (dut.N3813 === 1'b1 && dut.N6101 === 1'b1) begin
        if (!hit_recorded[144]) begin
          hit_recorded[144] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 144);
        end
      end
      if (dut.N4611 === 1'b1 && dut.N5069 === 1'b1) begin
        if (!hit_recorded[145]) begin
          hit_recorded[145] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 145);
        end
      end
      if (dut.N2171 === 1'b1 && dut.N5537 === 1'b1) begin
        if (!hit_recorded[146]) begin
          hit_recorded[146] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 146);
        end
      end
      if (dut.N2169 === 1'b1 && dut.N1704 === 1'b1) begin
        if (!hit_recorded[147]) begin
          hit_recorded[147] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 147);
        end
      end
      if (dut.N1494 === 1'b1 && dut.N4285 === 1'b1) begin
        if (!hit_recorded[148]) begin
          hit_recorded[148] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 148);
        end
      end
      if (dut.N5628 === 1'b1 && dut.N1692 === 1'b1 && dut.N2997 === 1'b1) begin
        if (!hit_recorded[149]) begin
          hit_recorded[149] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 149);
        end
      end
      if (dut.N5865 === 1'b1 && dut.N3489 === 1'b1 && dut.N6018 === 1'b1) begin
        if (!hit_recorded[150]) begin
          hit_recorded[150] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 150);
        end
      end
      if (dut.N3331 === 1'b1 && dut.N2991 === 1'b1 && dut.N3453 === 1'b1) begin
        if (!hit_recorded[151]) begin
          hit_recorded[151] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 151);
        end
      end
      if (dut.N3657 === 1'b1 && dut.N3804 === 1'b1 && dut.N5829 === 1'b1) begin
        if (!hit_recorded[152]) begin
          hit_recorded[152] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 152);
        end
      end
      if (dut.N5204 === 1'b1 && dut.N2222 === 1'b1 && dut.N4183 === 1'b1) begin
        if (!hit_recorded[153]) begin
          hit_recorded[153] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 153);
        end
      end
      if (dut.N1759 === 1'b1 && dut.N3845 === 1'b1 && dut.N2154 === 1'b1) begin
        if (!hit_recorded[154]) begin
          hit_recorded[154] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 154);
        end
      end
      if (dut.N3674 === 1'b1 && dut.N2836 === 1'b1 && dut.N2344 === 1'b1) begin
        if (!hit_recorded[155]) begin
          hit_recorded[155] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 155);
        end
      end
      if (dut.N2016 === 1'b1 && dut.N5573 === 1'b1 && dut.N1714 === 1'b0) begin
        if (!hit_recorded[156]) begin
          hit_recorded[156] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 156);
        end
      end
      if (dut.N4178 === 1'b1 && dut.N2222 === 1'b1 && dut.N4507 === 1'b1) begin
        if (!hit_recorded[157]) begin
          hit_recorded[157] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 157);
        end
      end
      if (dut.N4561 === 1'b1 && dut.N4350 === 1'b1 && dut.N1824 === 1'b1) begin
        if (!hit_recorded[158]) begin
          hit_recorded[158] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 158);
        end
      end
      if (dut.N5322 === 1'b1 && dut.N5408 === 1'b1 && dut.N5611 === 1'b1) begin
        if (!hit_recorded[159]) begin
          hit_recorded[159] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 159);
        end
      end
      if (dut.N2012 === 1'b1 && dut.N3850 === 1'b1 && dut.N6009 === 1'b1) begin
        if (!hit_recorded[160]) begin
          hit_recorded[160] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 160);
        end
      end
      if (dut.N2801 === 1'b1 && dut.N2816 === 1'b1 && dut.N2359 === 1'b1) begin
        if (!hit_recorded[161]) begin
          hit_recorded[161] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 161);
        end
      end
      if (dut.N1462 === 1'b1 && dut.N4448 === 1'b1 && dut.N1684 === 1'b1) begin
        if (!hit_recorded[162]) begin
          hit_recorded[162] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 162);
        end
      end
      if (dut.N2639 === 1'b1 && dut.N1566 === 1'b1 && dut.N5071 === 1'b1) begin
        if (!hit_recorded[163]) begin
          hit_recorded[163] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 163);
        end
      end
      if (dut.N2921 === 1'b1 && dut.N2655 === 1'b1 && dut.N4993 === 1'b1) begin
        if (!hit_recorded[164]) begin
          hit_recorded[164] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 164);
        end
      end
      if (dut.N3494 === 1'b1 && dut.N3300 === 1'b1 && dut.N4355 === 1'b1) begin
        if (!hit_recorded[165]) begin
          hit_recorded[165] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 165);
        end
      end
      if (dut.N5573 === 1'b1 && dut.N4339 === 1'b1 && dut.N5514 === 1'b1) begin
        if (!hit_recorded[166]) begin
          hit_recorded[166] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 166);
        end
      end
      if (dut.N4007 === 1'b1 && dut.N2174 === 1'b1 && dut.N1849 === 1'b1) begin
        if (!hit_recorded[167]) begin
          hit_recorded[167] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 167);
        end
      end
      if (dut.N3180 === 1'b1 && dut.N4710 === 1'b1 && dut.N1876 === 1'b1) begin
        if (!hit_recorded[168]) begin
          hit_recorded[168] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 168);
        end
      end
      if (dut.N2806 === 1'b1 && dut.N4725 === 1'b1 && dut.N4273 === 1'b1) begin
        if (!hit_recorded[169]) begin
          hit_recorded[169] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 169);
        end
      end
      if (dut.N6000 === 1'b1 && dut.N2204 === 1'b1 && dut.N4290 === 1'b1) begin
        if (!hit_recorded[170]) begin
          hit_recorded[170] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 170);
        end
      end
      if (dut.N2169 === 1'b1 && dut.N3170 === 1'b1 && dut.N2789 === 1'b1) begin
        if (!hit_recorded[171]) begin
          hit_recorded[171] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 171);
        end
      end
      if (dut.N4582 === 1'b1 && dut.N2330 === 1'b1 && dut.N2671 === 1'b1) begin
        if (!hit_recorded[172]) begin
          hit_recorded[172] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 172);
        end
      end
      if (dut.N2586 === 1'b1 && dut.N3333 === 1'b1 && dut.N2811 === 1'b1) begin
        if (!hit_recorded[173]) begin
          hit_recorded[173] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 173);
        end
      end
      if (dut.N3881 === 1'b1 && dut.N2137 === 1'b1 && dut.N4791 === 1'b1 && dut.N1708 === 1'b1) begin
        if (!hit_recorded[174]) begin
          hit_recorded[174] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 174);
        end
      end
      if (dut.N1556 === 1'b1 && dut.N6080 === 1'b1 && dut.N3825 === 1'b1 && dut.N4911 === 1'b1) begin
        if (!hit_recorded[175]) begin
          hit_recorded[175] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 175);
        end
      end
      if (dut.N3509 === 1'b1 && dut.N3984 === 1'b1 && dut.N2743 === 1'b1 && dut.N4273 === 1'b1) begin
        if (!hit_recorded[176]) begin
          hit_recorded[176] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 176);
        end
      end
      if (dut.N3921 === 1'b1 && dut.N6147 === 1'b1 && dut.N2328 === 1'b1 && dut.N5331 === 1'b1) begin
        if (!hit_recorded[177]) begin
          hit_recorded[177] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 177);
        end
      end
      if (dut.N1694 === 1'b1 && dut.N2991 === 1'b1 && dut.N2204 === 1'b1 && dut.N2811 === 1'b1) begin
        if (!hit_recorded[178]) begin
          hit_recorded[178] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 178);
        end
      end
      if (dut.N5331 === 1'b1 && dut.N5637 === 1'b1 && dut.N1486 === 1'b1 && dut.N1871 === 1'b1) begin
        if (!hit_recorded[179]) begin
          hit_recorded[179] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 179);
        end
      end
      if (dut.N6265 === 1'b1 && dut.N5471 === 1'b1 && dut.N2322 === 1'b1 && dut.N3254 === 1'b1) begin
        if (!hit_recorded[180]) begin
          hit_recorded[180] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 180);
        end
      end
      if (dut.N4972 === 1'b1 && dut.N4359 === 1'b1 && dut.N3930 === 1'b1 && dut.N1546 === 1'b1) begin
        if (!hit_recorded[181]) begin
          hit_recorded[181] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 181);
        end
      end
      if (dut.N2496 === 1'b1 && dut.N2476 === 1'b1 && dut.N1506 === 1'b1 && dut.N3685 === 1'b1) begin
        if (!hit_recorded[182]) begin
          hit_recorded[182] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 182);
        end
      end
      if (dut.N2151 === 1'b1 && dut.N2873 === 1'b1 && dut.N3252 === 1'b1 && dut.N2014 === 1'b1) begin
        if (!hit_recorded[183]) begin
          hit_recorded[183] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 183);
        end
      end
      if (dut.N1714 === 1'b0 && dut.N2359 === 1'b1 && dut.N2821 === 1'b1 && dut.N5322 === 1'b1) begin
        if (!hit_recorded[184]) begin
          hit_recorded[184] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 184);
        end
      end
      if (dut.N4183 === 1'b1 && dut.N2806 === 1'b1 && dut.N4894 === 1'b1 && dut.N2026 === 1'b1) begin
        if (!hit_recorded[185]) begin
          hit_recorded[185] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 185);
        end
      end
      if (dut.N2137 === 1'b1 && dut.N1541 === 1'b1 && dut.N4570 === 1'b1 && dut.N2169 === 1'b1) begin
        if (!hit_recorded[186]) begin
          hit_recorded[186] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 186);
        end
      end
      if (dut.N5817 === 1'b1 && dut.N4172 === 1'b1 && dut.N6265 === 1'b1 && dut.N2022 === 1'b1) begin
        if (!hit_recorded[187]) begin
          hit_recorded[187] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 187);
        end
      end
      if (dut.N4972 === 1'b1 && dut.N2989 === 1'b1 && dut.N4372 === 1'b1 && dut.N2326 === 1'b1) begin
        if (!hit_recorded[188]) begin
          hit_recorded[188] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 188);
        end
      end
      if (dut.N1946 === 1'b1 && dut.N5573 === 1'b1 && dut.N6000 === 1'b1 && dut.N3930 === 1'b1) begin
        if (!hit_recorded[189]) begin
          hit_recorded[189] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 189);
        end
      end
      if (dut.N5817 === 1'b1 && dut.N4183 === 1'b1 && dut.N3850 === 1'b1 && dut.N3155 === 1'b1) begin
        if (!hit_recorded[190]) begin
          hit_recorded[190] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 190);
        end
      end
      if (dut.N2344 === 1'b1 && dut.N2164 === 1'b1 && dut.N1696 === 1'b1 && dut.N4849 === 1'b1) begin
        if (!hit_recorded[191]) begin
          hit_recorded[191] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 191);
        end
      end
      if (dut.N1478 === 1'b1 && dut.N1821 === 1'b1 && dut.N3697 === 1'b1 && dut.N5829 === 1'b1) begin
        if (!hit_recorded[192]) begin
          hit_recorded[192] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 192);
        end
      end
      if (dut.N5287 === 1'b1 && dut.N5923 === 1'b1 && dut.N4582 === 1'b1 && dut.N4899 === 1'b1) begin
        if (!hit_recorded[193]) begin
          hit_recorded[193] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 193);
        end
      end
      if (dut.N6275 === 1'b1 && dut.N4549 === 1'b1 && dut.N4188 === 1'b1 && dut.N2506 === 1'b1) begin
        if (!hit_recorded[194]) begin
          hit_recorded[194] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 194);
        end
      end
      if (dut.N4361 === 1'b1 && dut.N5365 === 1'b1 && dut.N1536 === 1'b1 && dut.N6035 === 1'b1) begin
        if (!hit_recorded[195]) begin
          hit_recorded[195] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 195);
        end
      end
      if (dut.N4013 === 1'b1 && dut.N1474 === 1'b1 && dut.N3672 === 1'b1 && dut.N1506 === 1'b1) begin
        if (!hit_recorded[196]) begin
          hit_recorded[196] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 196);
        end
      end
      if (dut.N2481 === 1'b1 && dut.N5298 === 1'b1 && dut.N5979 === 1'b1 && dut.N1685 === 1'b1) begin
        if (!hit_recorded[197]) begin
          hit_recorded[197] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 197);
        end
      end
      if (dut.N5552 === 1'b1 && dut.N5438 === 1'b1 && dut.N2181 === 1'b1 && dut.N1551 === 1'b1) begin
        if (!hit_recorded[198]) begin
          hit_recorded[198] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 198);
        end
      end
    end
  endtask

endmodule
