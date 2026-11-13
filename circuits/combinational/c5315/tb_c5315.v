`timescale 1ns/1ps

////////////////////////////////////////////////////////////////////////////////
// Standalone Gate-Level Combinational Verification Testbench: C5315
// Primary Inputs:  178
// Primary Outputs: 123
// Test Patterns:   4162 MC-ATPG Patterns
// Injected Trojans: 200
////////////////////////////////////////////////////////////////////////////////

module tb_c5315;

  localparam NUM_PIS = 178;
  localparam NUM_POS = 123;
  localparam NUM_PATS = 4162;
  localparam CLK_PERIOD = 10;

  reg [NUM_PIS-1:0] pi_mem [0:NUM_PATS-1];
  reg [NUM_PIS-1:0] pi;
  wire [NUM_POS-1:0] po;

  integer p_idx;
  integer hit_count = 0;
  reg [199:0] hit_recorded;

  // Fully Connected Combinational DUT Instance
  c5315 dut (
    .N1(pi[0]),
    .N4(pi[1]),
    .N11(pi[2]),
    .N14(pi[3]),
    .N17(pi[4]),
    .N20(pi[5]),
    .N23(pi[6]),
    .N24(pi[7]),
    .N25(pi[8]),
    .N26(pi[9]),
    .N27(pi[10]),
    .N31(pi[11]),
    .N34(pi[12]),
    .N37(pi[13]),
    .N40(pi[14]),
    .N43(pi[15]),
    .N46(pi[16]),
    .N49(pi[17]),
    .N52(pi[18]),
    .N53(pi[19]),
    .N54(pi[20]),
    .N61(pi[21]),
    .N64(pi[22]),
    .N67(pi[23]),
    .N70(pi[24]),
    .N73(pi[25]),
    .N76(pi[26]),
    .N79(pi[27]),
    .N80(pi[28]),
    .N81(pi[29]),
    .N82(pi[30]),
    .N83(pi[31]),
    .N86(pi[32]),
    .N87(pi[33]),
    .N88(pi[34]),
    .N91(pi[35]),
    .N94(pi[36]),
    .N97(pi[37]),
    .N100(pi[38]),
    .N103(pi[39]),
    .N106(pi[40]),
    .N109(pi[41]),
    .N112(pi[42]),
    .N113(pi[43]),
    .N114(pi[44]),
    .N115(pi[45]),
    .N116(pi[46]),
    .N117(pi[47]),
    .N118(pi[48]),
    .N119(pi[49]),
    .N120(pi[50]),
    .N121(pi[51]),
    .N122(pi[52]),
    .N123(pi[53]),
    .N126(pi[54]),
    .N127(pi[55]),
    .N128(pi[56]),
    .N129(pi[57]),
    .N130(pi[58]),
    .N131(pi[59]),
    .N132(pi[60]),
    .N135(pi[61]),
    .N136(pi[62]),
    .N137(pi[63]),
    .N140(pi[64]),
    .N141(pi[65]),
    .N145(pi[66]),
    .N146(pi[67]),
    .N149(pi[68]),
    .N152(pi[69]),
    .N155(pi[70]),
    .N158(pi[71]),
    .N161(pi[72]),
    .N164(pi[73]),
    .N167(pi[74]),
    .N170(pi[75]),
    .N173(pi[76]),
    .N176(pi[77]),
    .N179(pi[78]),
    .N182(pi[79]),
    .N185(pi[80]),
    .N188(pi[81]),
    .N191(pi[82]),
    .N194(pi[83]),
    .N197(pi[84]),
    .N200(pi[85]),
    .N203(pi[86]),
    .N206(pi[87]),
    .N209(pi[88]),
    .N210(pi[89]),
    .N217(pi[90]),
    .N218(pi[91]),
    .N225(pi[92]),
    .N226(pi[93]),
    .N233(pi[94]),
    .N234(pi[95]),
    .N241(pi[96]),
    .N242(pi[97]),
    .N245(pi[98]),
    .N248(pi[99]),
    .N251(pi[100]),
    .N254(pi[101]),
    .N257(pi[102]),
    .N264(pi[103]),
    .N265(pi[104]),
    .N272(pi[105]),
    .N273(pi[106]),
    .N280(pi[107]),
    .N281(pi[108]),
    .N288(pi[109]),
    .N289(pi[110]),
    .N292(pi[111]),
    .N293(pi[112]),
    .N299(pi[113]),
    .N302(pi[114]),
    .N307(pi[115]),
    .N308(pi[116]),
    .N315(pi[117]),
    .N316(pi[118]),
    .N323(pi[119]),
    .N324(pi[120]),
    .N331(pi[121]),
    .N332(pi[122]),
    .N335(pi[123]),
    .N338(pi[124]),
    .N341(pi[125]),
    .N348(pi[126]),
    .N351(pi[127]),
    .N358(pi[128]),
    .N361(pi[129]),
    .N366(pi[130]),
    .N369(pi[131]),
    .N372(pi[132]),
    .N373(pi[133]),
    .N374(pi[134]),
    .N386(pi[135]),
    .N389(pi[136]),
    .N400(pi[137]),
    .N411(pi[138]),
    .N422(pi[139]),
    .N435(pi[140]),
    .N446(pi[141]),
    .N457(pi[142]),
    .N468(pi[143]),
    .N479(pi[144]),
    .N490(pi[145]),
    .N503(pi[146]),
    .N514(pi[147]),
    .N523(pi[148]),
    .N534(pi[149]),
    .N545(pi[150]),
    .N549(pi[151]),
    .N552(pi[152]),
    .N556(pi[153]),
    .N559(pi[154]),
    .N562(pi[155]),
    .N566(pi[156]),
    .N571(pi[157]),
    .N574(pi[158]),
    .N577(pi[159]),
    .N580(pi[160]),
    .N583(pi[161]),
    .N588(pi[162]),
    .N591(pi[163]),
    .N592(pi[164]),
    .N595(pi[165]),
    .N596(pi[166]),
    .N597(pi[167]),
    .N598(pi[168]),
    .N599(pi[169]),
    .N603(pi[170]),
    .N607(pi[171]),
    .N610(pi[172]),
    .N613(pi[173]),
    .N616(pi[174]),
    .N619(pi[175]),
    .N625(pi[176]),
    .N631(pi[177]),
    .N709(po[0]),
    .N816(po[1]),
    .N1066(po[2]),
    .N1137(po[3]),
    .N1138(po[4]),
    .N1139(po[5]),
    .N1140(po[6]),
    .N1141(po[7]),
    .N1142(po[8]),
    .N1143(po[9]),
    .N1144(po[10]),
    .N1145(po[11]),
    .N1147(po[12]),
    .N1152(po[13]),
    .N1153(po[14]),
    .N1154(po[15]),
    .N1155(po[16]),
    .N1972(po[17]),
    .N2054(po[18]),
    .N2060(po[19]),
    .N2061(po[20]),
    .N2139(po[21]),
    .N2142(po[22]),
    .N2309(po[23]),
    .N2387(po[24]),
    .N2527(po[25]),
    .N2584(po[26]),
    .N2590(po[27]),
    .N2623(po[28]),
    .N3357(po[29]),
    .N3358(po[30]),
    .N3359(po[31]),
    .N3360(po[32]),
    .N3604(po[33]),
    .N3613(po[34]),
    .N4272(po[35]),
    .N4275(po[36]),
    .N4278(po[37]),
    .N4279(po[38]),
    .N4737(po[39]),
    .N4738(po[40]),
    .N4739(po[41]),
    .N4740(po[42]),
    .N5240(po[43]),
    .N5388(po[44]),
    .N6641(po[45]),
    .N6643(po[46]),
    .N6646(po[47]),
    .N6648(po[48]),
    .N6716(po[49]),
    .N6877(po[50]),
    .N6924(po[51]),
    .N6925(po[52]),
    .N6926(po[53]),
    .N6927(po[54]),
    .N7015(po[55]),
    .N7363(po[56]),
    .N7365(po[57]),
    .N7432(po[58]),
    .N7449(po[59]),
    .N7465(po[60]),
    .N7466(po[61]),
    .N7467(po[62]),
    .N7469(po[63]),
    .N7470(po[64]),
    .N7471(po[65]),
    .N7472(po[66]),
    .N7473(po[67]),
    .N7474(po[68]),
    .N7476(po[69]),
    .N7503(po[70]),
    .N7504(po[71]),
    .N7506(po[72]),
    .N7511(po[73]),
    .N7515(po[74]),
    .N7516(po[75]),
    .N7517(po[76]),
    .N7518(po[77]),
    .N7519(po[78]),
    .N7520(po[79]),
    .N7521(po[80]),
    .N7522(po[81]),
    .N7600(po[82]),
    .N7601(po[83]),
    .N7602(po[84]),
    .N7603(po[85]),
    .N7604(po[86]),
    .N7605(po[87]),
    .N7606(po[88]),
    .N7607(po[89]),
    .N7626(po[90]),
    .N7698(po[91]),
    .N7699(po[92]),
    .N7700(po[93]),
    .N7701(po[94]),
    .N7702(po[95]),
    .N7703(po[96]),
    .N7704(po[97]),
    .N7705(po[98]),
    .N7706(po[99]),
    .N7707(po[100]),
    .N7735(po[101]),
    .N7736(po[102]),
    .N7737(po[103]),
    .N7738(po[104]),
    .N7739(po[105]),
    .N7740(po[106]),
    .N7741(po[107]),
    .N7742(po[108]),
    .N7754(po[109]),
    .N7755(po[110]),
    .N7756(po[111]),
    .N7757(po[112]),
    .N7758(po[113]),
    .N7759(po[114]),
    .N7760(po[115]),
    .N7761(po[116]),
    .N8075(po[117]),
    .N8076(po[118]),
    .N8123(po[119]),
    .N8124(po[120]),
    .N8127(po[121]),
    .N8128(po[122])
  );

  initial begin
    $display("================================================================================");
    $display("[START] Running Gate-Level Trojan Activation Testbench: C5315 (%0d patterns)", NUM_PATS);
    $display("================================================================================");

    // Load ASCII binary test patterns
    $readmemb("scan_pi.txt", pi_mem);

    hit_recorded = 0;
    pi = 0;
    #20;

    // Pattern Replay Loop
    for (p_idx = 0; p_idx < NUM_PATS; p_idx = p_idx + 1) begin
      pi = pi_mem[p_idx];
      #CLK_PERIOD; // Allow combinational logic to propagate and settle
      check_trojans();
    end

    $display("================================================================================");
    $display("[DONE] Simulation Complete. Total Unique Trojans Triggered: %0d / 200", hit_count);
    $display("================================================================================");
    $finish;
  end

  task check_trojans;
    begin
      if (dut.N7147 === 1'b1) begin
        if (!hit_recorded[0]) begin
          hit_recorded[0] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 0);
        end
      end
      if (dut.N7493 === 1'b0) begin
        if (!hit_recorded[1]) begin
          hit_recorded[1] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 1);
        end
      end
      if (dut.N6091 === 1'b1) begin
        if (!hit_recorded[2]) begin
          hit_recorded[2] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 2);
        end
      end
      if (dut.N8119 === 1'b1) begin
        if (!hit_recorded[3]) begin
          hit_recorded[3] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 3);
        end
      end
      if (dut.N6925 === 1'b0) begin
        if (!hit_recorded[4]) begin
          hit_recorded[4] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 4);
        end
      end
      if (dut.N7678 === 1'b1) begin
        if (!hit_recorded[5]) begin
          hit_recorded[5] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 5);
        end
      end
      if (dut.N7681 === 1'b1) begin
        if (!hit_recorded[6]) begin
          hit_recorded[6] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 6);
        end
      end
      if (dut.N7433 === 1'b1) begin
        if (!hit_recorded[7]) begin
          hit_recorded[7] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 7);
        end
      end
      if (dut.N8118 === 1'b1) begin
        if (!hit_recorded[8]) begin
          hit_recorded[8] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 8);
        end
      end
      if (dut.N6099 === 1'b1) begin
        if (!hit_recorded[9]) begin
          hit_recorded[9] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 9);
        end
      end
      if (dut.N3635 === 1'b1) begin
        if (!hit_recorded[10]) begin
          hit_recorded[10] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 10);
        end
      end
      if (dut.N7822 === 1'b0) begin
        if (!hit_recorded[11]) begin
          hit_recorded[11] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 11);
        end
      end
      if (dut.N2922 === 1'b1) begin
        if (!hit_recorded[12]) begin
          hit_recorded[12] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 12);
        end
      end
      if (dut.N6072 === 1'b1) begin
        if (!hit_recorded[13]) begin
          hit_recorded[13] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 13);
        end
      end
      if (dut.N4278 === 1'b0) begin
        if (!hit_recorded[14]) begin
          hit_recorded[14] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 14);
        end
      end
      if (dut.N4956 === 1'b1) begin
        if (!hit_recorded[15]) begin
          hit_recorded[15] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 15);
        end
      end
      if (dut.N6801 === 1'b1) begin
        if (!hit_recorded[16]) begin
          hit_recorded[16] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 16);
        end
      end
      if (dut.N6100 === 1'b1) begin
        if (!hit_recorded[17]) begin
          hit_recorded[17] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 17);
        end
      end
      if (dut.N6104 === 1'b1) begin
        if (!hit_recorded[18]) begin
          hit_recorded[18] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 18);
        end
      end
      if (dut.N7450 === 1'b1) begin
        if (!hit_recorded[19]) begin
          hit_recorded[19] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 19);
        end
      end
      if (dut.N7492 === 1'b0) begin
        if (!hit_recorded[20]) begin
          hit_recorded[20] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 20);
        end
      end
      if (dut.N3409 === 1'b1) begin
        if (!hit_recorded[21]) begin
          hit_recorded[21] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 21);
        end
      end
      if (dut.N7197 === 1'b1) begin
        if (!hit_recorded[22]) begin
          hit_recorded[22] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 22);
        end
      end
      if (dut.N6117 === 1'b1) begin
        if (!hit_recorded[23]) begin
          hit_recorded[23] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 23);
        end
      end
      if (dut.N3623 === 1'b1) begin
        if (!hit_recorded[24]) begin
          hit_recorded[24] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 24);
        end
      end
      if (dut.N7696 === 1'b1) begin
        if (!hit_recorded[25]) begin
          hit_recorded[25] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 25);
        end
      end
      if (dut.N7187 === 1'b1) begin
        if (!hit_recorded[26]) begin
          hit_recorded[26] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 26);
        end
      end
      if (dut.N6714 === 1'b1) begin
        if (!hit_recorded[27]) begin
          hit_recorded[27] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 27);
        end
      end
      if (dut.N6098 === 1'b1) begin
        if (!hit_recorded[28]) begin
          hit_recorded[28] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 28);
        end
      end
      if (dut.N6834 === 1'b1) begin
        if (!hit_recorded[29]) begin
          hit_recorded[29] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 29);
        end
      end
      if (dut.N4196 === 1'b1) begin
        if (!hit_recorded[30]) begin
          hit_recorded[30] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 30);
        end
      end
      if (dut.N7440 === 1'b1) begin
        if (!hit_recorded[31]) begin
          hit_recorded[31] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 31);
        end
      end
      if (dut.N7488 === 1'b1) begin
        if (!hit_recorded[32]) begin
          hit_recorded[32] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 32);
        end
      end
      if (dut.N4275 === 1'b0) begin
        if (!hit_recorded[33]) begin
          hit_recorded[33] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 33);
        end
      end
      if (dut.N4978 === 1'b1) begin
        if (!hit_recorded[34]) begin
          hit_recorded[34] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 34);
        end
      end
      if (dut.N5061 === 1'b1) begin
        if (!hit_recorded[35]) begin
          hit_recorded[35] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 35);
        end
      end
      if (dut.N6648 === 1'b1) begin
        if (!hit_recorded[36]) begin
          hit_recorded[36] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 36);
        end
      end
      if (dut.N2614 === 1'b1) begin
        if (!hit_recorded[37]) begin
          hit_recorded[37] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 37);
        end
      end
      if (dut.N6069 === 1'b0) begin
        if (!hit_recorded[38]) begin
          hit_recorded[38] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 38);
        end
      end
      if (dut.N7679 === 1'b1) begin
        if (!hit_recorded[39]) begin
          hit_recorded[39] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 39);
        end
      end
      if (dut.N2612 === 1'b1) begin
        if (!hit_recorded[40]) begin
          hit_recorded[40] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 40);
        end
      end
      if (dut.N6956 === 1'b0) begin
        if (!hit_recorded[41]) begin
          hit_recorded[41] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 41);
        end
      end
      if (dut.N3650 === 1'b1) begin
        if (!hit_recorded[42]) begin
          hit_recorded[42] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 42);
        end
      end
      if (dut.N7320 === 1'b0) begin
        if (!hit_recorded[43]) begin
          hit_recorded[43] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 43);
        end
      end
      if (dut.N7683 === 1'b1) begin
        if (!hit_recorded[44]) begin
          hit_recorded[44] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 44);
        end
      end
      if (dut.N7447 === 1'b1) begin
        if (!hit_recorded[45]) begin
          hit_recorded[45] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 45);
        end
      end
      if (dut.N2850 === 1'b1) begin
        if (!hit_recorded[46]) begin
          hit_recorded[46] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 46);
        end
      end
      if (dut.N3662 === 1'b1) begin
        if (!hit_recorded[47]) begin
          hit_recorded[47] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 47);
        end
      end
      if (dut.N7815 === 1'b0) begin
        if (!hit_recorded[48]) begin
          hit_recorded[48] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 48);
        end
      end
      if (dut.N7787 === 1'b0) begin
        if (!hit_recorded[49]) begin
          hit_recorded[49] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 49);
        end
      end
      if (dut.N2598 === 1'b1) begin
        if (!hit_recorded[50]) begin
          hit_recorded[50] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 50);
        end
      end
      if (dut.N4033 === 1'b1) begin
        if (!hit_recorded[51]) begin
          hit_recorded[51] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 51);
        end
      end
      if (dut.N2601 === 1'b1) begin
        if (!hit_recorded[52]) begin
          hit_recorded[52] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 52);
        end
      end
      if (dut.N3645 === 1'b1) begin
        if (!hit_recorded[53]) begin
          hit_recorded[53] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 53);
        end
      end
      if (dut.N7485 === 1'b1) begin
        if (!hit_recorded[54]) begin
          hit_recorded[54] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 54);
        end
      end
      if (dut.N6721 === 1'b1) begin
        if (!hit_recorded[55]) begin
          hit_recorded[55] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 55);
        end
      end
      if (dut.N6074 === 1'b1) begin
        if (!hit_recorded[56]) begin
          hit_recorded[56] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 56);
        end
      end
      if (dut.N2588 === 1'b1) begin
        if (!hit_recorded[57]) begin
          hit_recorded[57] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 57);
        end
      end
      if (dut.N3627 === 1'b1) begin
        if (!hit_recorded[58]) begin
          hit_recorded[58] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 58);
        end
      end
      if (dut.n_329 === 1'b1) begin
        if (!hit_recorded[59]) begin
          hit_recorded[59] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 59);
        end
      end
      if (dut.N7693 === 1'b1) begin
        if (!hit_recorded[60]) begin
          hit_recorded[60] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 60);
        end
      end
      if (dut.N6843 === 1'b0) begin
        if (!hit_recorded[61]) begin
          hit_recorded[61] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 61);
        end
      end
      if (dut.N6184 === 1'b1) begin
        if (!hit_recorded[62]) begin
          hit_recorded[62] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 62);
        end
      end
      if (dut.N6699 === 1'b0) begin
        if (!hit_recorded[63]) begin
          hit_recorded[63] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 63);
        end
      end
      if (dut.N3624 === 1'b1) begin
        if (!hit_recorded[64]) begin
          hit_recorded[64] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 64);
        end
      end
      if (dut.N6715 === 1'b1) begin
        if (!hit_recorded[65]) begin
          hit_recorded[65] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 65);
        end
      end
      if (dut.N3404 === 1'b1) begin
        if (!hit_recorded[66]) begin
          hit_recorded[66] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 66);
        end
      end
      if (dut.N8114 === 1'b1) begin
        if (!hit_recorded[67]) begin
          hit_recorded[67] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 67);
        end
      end
      if (dut.N3805 === 1'b1) begin
        if (!hit_recorded[68]) begin
          hit_recorded[68] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 68);
        end
      end
      if (dut.N7438 === 1'b1) begin
        if (!hit_recorded[69]) begin
          hit_recorded[69] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 69);
        end
      end
      if (dut.N7636 === 1'b1) begin
        if (!hit_recorded[70]) begin
          hit_recorded[70] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 70);
        end
      end
      if (dut.N6140 === 1'b1) begin
        if (!hit_recorded[71]) begin
          hit_recorded[71] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 71);
        end
      end
      if (dut.N6703 === 1'b0) begin
        if (!hit_recorded[72]) begin
          hit_recorded[72] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 72);
        end
      end
      if (dut.N4741 === 1'b1) begin
        if (!hit_recorded[73]) begin
          hit_recorded[73] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 73);
        end
      end
      if (dut.N7444 === 1'b1) begin
        if (!hit_recorded[74]) begin
          hit_recorded[74] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 74);
        end
      end
      if (dut.N4273 === 1'b0) begin
        if (!hit_recorded[75]) begin
          hit_recorded[75] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 75);
        end
      end
      if (dut.N8115 === 1'b1) begin
        if (!hit_recorded[76]) begin
          hit_recorded[76] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 76);
        end
      end
      if (dut.N6937 === 1'b0) begin
        if (!hit_recorded[77]) begin
          hit_recorded[77] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 77);
        end
      end
      if (dut.N6095 === 1'b1) begin
        if (!hit_recorded[78]) begin
          hit_recorded[78] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 78);
        end
      end
      if (dut.N6837 === 1'b0) begin
        if (!hit_recorded[79]) begin
          hit_recorded[79] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 79);
        end
      end
      if (dut.N5062 === 1'b1) begin
        if (!hit_recorded[80]) begin
          hit_recorded[80] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 80);
        end
      end
      if (dut.N3461 === 1'b1) begin
        if (!hit_recorded[81]) begin
          hit_recorded[81] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 81);
        end
      end
      if (dut.N2848 === 1'b1) begin
        if (!hit_recorded[82]) begin
          hit_recorded[82] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 82);
        end
      end
      if (dut.N4980 === 1'b1) begin
        if (!hit_recorded[83]) begin
          hit_recorded[83] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 83);
        end
      end
      if (dut.N7455 === 1'b1) begin
        if (!hit_recorded[84]) begin
          hit_recorded[84] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 84);
        end
      end
      if (dut.N3803 === 1'b1) begin
        if (!hit_recorded[85]) begin
          hit_recorded[85] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 85);
        end
      end
      if (dut.N6094 === 1'b1) begin
        if (!hit_recorded[86]) begin
          hit_recorded[86] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 86);
        end
      end
      if (dut.N7667 === 1'b1) begin
        if (!hit_recorded[87]) begin
          hit_recorded[87] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 87);
        end
      end
      if (dut.N3026 === 1'b1) begin
        if (!hit_recorded[88]) begin
          hit_recorded[88] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 88);
        end
      end
      if (dut.N6719 === 1'b1) begin
        if (!hit_recorded[89]) begin
          hit_recorded[89] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 89);
        end
      end
      if (dut.N5156 === 1'b0) begin
        if (!hit_recorded[90]) begin
          hit_recorded[90] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 90);
        end
      end
      if (dut.N7483 === 1'b1) begin
        if (!hit_recorded[91]) begin
          hit_recorded[91] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 91);
        end
      end
      if (dut.N3638 === 1'b1) begin
        if (!hit_recorded[92]) begin
          hit_recorded[92] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 92);
        end
      end
      if (dut.N4034 === 1'b1) begin
        if (!hit_recorded[93]) begin
          hit_recorded[93] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 93);
        end
      end
      if (dut.N6083 === 1'b1) begin
        if (!hit_recorded[94]) begin
          hit_recorded[94] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 94);
        end
      end
      if (dut.N3402 === 1'b1) begin
        if (!hit_recorded[95]) begin
          hit_recorded[95] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 95);
        end
      end
      if (dut.N7688 === 1'b1) begin
        if (!hit_recorded[96]) begin
          hit_recorded[96] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 96);
        end
      end
      if (dut.N3806 === 1'b1) begin
        if (!hit_recorded[97]) begin
          hit_recorded[97] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 97);
        end
      end
      if (dut.n_328 === 1'b1) begin
        if (!hit_recorded[98]) begin
          hit_recorded[98] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 98);
        end
      end
      if (dut.N6189 === 1'b1) begin
        if (!hit_recorded[99]) begin
          hit_recorded[99] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 99);
        end
      end
      if (dut.N3788 === 1'b1) begin
        if (!hit_recorded[100]) begin
          hit_recorded[100] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 100);
        end
      end
      if (dut.N6566 === 1'b0) begin
        if (!hit_recorded[101]) begin
          hit_recorded[101] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 101);
        end
      end
      if (dut.N7990 === 1'b1) begin
        if (!hit_recorded[102]) begin
          hit_recorded[102] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 102);
        end
      end
      if (dut.N7328 === 1'b0) begin
        if (!hit_recorded[103]) begin
          hit_recorded[103] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 103);
        end
      end
      if (dut.N8071 === 1'b1) begin
        if (!hit_recorded[104]) begin
          hit_recorded[104] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 104);
        end
      end
      if (dut.N4981 === 1'b1) begin
        if (!hit_recorded[105]) begin
          hit_recorded[105] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 105);
        end
      end
      if (dut.N6377 === 1'b0) begin
        if (!hit_recorded[106]) begin
          hit_recorded[106] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 106);
        end
      end
      if (dut.N3629 === 1'b1) begin
        if (!hit_recorded[107]) begin
          hit_recorded[107] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 107);
        end
      end
      if (dut.N3504 === 1'b1) begin
        if (!hit_recorded[108]) begin
          hit_recorded[108] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 108);
        end
      end
      if (dut.N5388 === 1'b1) begin
        if (!hit_recorded[109]) begin
          hit_recorded[109] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 109);
        end
      end
      if (dut.N7338 === 1'b1) begin
        if (!hit_recorded[110]) begin
          hit_recorded[110] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 110);
        end
      end
      if (dut.N7321 === 1'b0) begin
        if (!hit_recorded[111]) begin
          hit_recorded[111] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 111);
        end
      end
      if (dut.N3658 === 1'b1) begin
        if (!hit_recorded[112]) begin
          hit_recorded[112] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 112);
        end
      end
      if (dut.N4955 === 1'b1) begin
        if (!hit_recorded[113]) begin
          hit_recorded[113] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 113);
        end
      end
      if (dut.N7994 === 1'b1) begin
        if (!hit_recorded[114]) begin
          hit_recorded[114] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 114);
        end
      end
      if (dut.N4040 === 1'b1) begin
        if (!hit_recorded[115]) begin
          hit_recorded[115] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 115);
        end
      end
      if (dut.N7682 === 1'b1) begin
        if (!hit_recorded[116]) begin
          hit_recorded[116] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 116);
        end
      end
      if (dut.N6071 === 1'b1) begin
        if (!hit_recorded[117]) begin
          hit_recorded[117] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 117);
        end
      end
      if (dut.N6955 === 1'b0) begin
        if (!hit_recorded[118]) begin
          hit_recorded[118] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 118);
        end
      end
      if (dut.N2605 === 1'b1) begin
        if (!hit_recorded[119]) begin
          hit_recorded[119] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 119);
        end
      end
      if (dut.N8113 === 1'b1) begin
        if (!hit_recorded[120]) begin
          hit_recorded[120] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 120);
        end
      end
      if (dut.N8072 === 1'b1) begin
        if (!hit_recorded[121]) begin
          hit_recorded[121] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 121);
        end
      end
      if (dut.N3660 === 1'b1) begin
        if (!hit_recorded[122]) begin
          hit_recorded[122] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 122);
        end
      end
      if (dut.N3804 === 1'b1) begin
        if (!hit_recorded[123]) begin
          hit_recorded[123] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 123);
        end
      end
      if (dut.N3483 === 1'b1) begin
        if (!hit_recorded[124]) begin
          hit_recorded[124] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 124);
        end
      end
      if (dut.N7451 === 1'b1 && dut.N6721 === 1'b1) begin
        if (!hit_recorded[125]) begin
          hit_recorded[125] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 125);
        end
      end
      if (dut.N7689 === 1'b1 && dut.n_318 === 1'b1) begin
        if (!hit_recorded[126]) begin
          hit_recorded[126] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 126);
        end
      end
      if (dut.N2586 === 1'b1 && dut.N7456 === 1'b1) begin
        if (!hit_recorded[127]) begin
          hit_recorded[127] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 127);
        end
      end
      if (dut.N3461 === 1'b1 && dut.N6153 === 1'b1) begin
        if (!hit_recorded[128]) begin
          hit_recorded[128] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 128);
        end
      end
      if (dut.N7675 === 1'b1 && dut.N7433 === 1'b1) begin
        if (!hit_recorded[129]) begin
          hit_recorded[129] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 129);
        end
      end
      if (dut.N3627 === 1'b1 && dut.N7218 === 1'b0) begin
        if (!hit_recorded[130]) begin
          hit_recorded[130] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 130);
        end
      end
      if (dut.N3452 === 1'b1 && dut.N2594 === 1'b1) begin
        if (!hit_recorded[131]) begin
          hit_recorded[131] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 131);
        end
      end
      if (dut.N4033 === 1'b1 && dut.N6175 === 1'b1) begin
        if (!hit_recorded[132]) begin
          hit_recorded[132] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 132);
        end
      end
      if (dut.N7481 === 1'b1 && dut.N6719 === 1'b1) begin
        if (!hit_recorded[133]) begin
          hit_recorded[133] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 133);
        end
      end
      if (dut.N7676 === 1'b1 && dut.N2831 === 1'b1) begin
        if (!hit_recorded[134]) begin
          hit_recorded[134] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 134);
        end
      end
      if (dut.n_323 === 1'b1 && dut.N2909 === 1'b1) begin
        if (!hit_recorded[135]) begin
          hit_recorded[135] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 135);
        end
      end
      if (dut.N6149 === 1'b1 && dut.N6703 === 1'b0) begin
        if (!hit_recorded[136]) begin
          hit_recorded[136] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 136);
        end
      end
      if (dut.N5140 === 1'b0 && dut.N3644 === 1'b1) begin
        if (!hit_recorded[137]) begin
          hit_recorded[137] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 137);
        end
      end
      if (dut.N4986 === 1'b1 && dut.N7416 === 1'b0) begin
        if (!hit_recorded[138]) begin
          hit_recorded[138] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 138);
        end
      end
      if (dut.N7483 === 1'b1 && dut.N7503 === 1'b1) begin
        if (!hit_recorded[139]) begin
          hit_recorded[139] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 139);
        end
      end
      if (dut.N4039 === 1'b1 && dut.N4975 === 1'b0) begin
        if (!hit_recorded[140]) begin
          hit_recorded[140] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 140);
        end
      end
      if (dut.N6837 === 1'b0 && dut.N2607 === 1'b1) begin
        if (!hit_recorded[141]) begin
          hit_recorded[141] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 141);
        end
      end
      if (dut.N7464 === 1'b1 && dut.N6100 === 1'b1) begin
        if (!hit_recorded[142]) begin
          hit_recorded[142] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 142);
        end
      end
      if (dut.N7147 === 1'b1 && dut.N6815 === 1'b0) begin
        if (!hit_recorded[143]) begin
          hit_recorded[143] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 143);
        end
      end
      if (dut.N6117 === 1'b1 && dut.N3505 === 1'b1) begin
        if (!hit_recorded[144]) begin
          hit_recorded[144] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 144);
        end
      end
      if (dut.N4984 === 1'b1 && dut.N3452 === 1'b1) begin
        if (!hit_recorded[145]) begin
          hit_recorded[145] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 145);
        end
      end
      if (dut.N2834 === 1'b1 && dut.N6154 === 1'b1) begin
        if (!hit_recorded[146]) begin
          hit_recorded[146] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 146);
        end
      end
      if (dut.N5161 === 1'b0 && dut.N6106 === 1'b1) begin
        if (!hit_recorded[147]) begin
          hit_recorded[147] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 147);
        end
      end
      if (dut.N7461 === 1'b1 && dut.N3451 === 1'b1) begin
        if (!hit_recorded[148]) begin
          hit_recorded[148] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 148);
        end
      end
      if (dut.N7484 === 1'b1 && dut.N4275 === 1'b0) begin
        if (!hit_recorded[149]) begin
          hit_recorded[149] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 149);
        end
      end
      if (dut.N6872 === 1'b0 && dut.N7146 === 1'b1 && dut.N5112 === 1'b0) begin
        if (!hit_recorded[150]) begin
          hit_recorded[150] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 150);
        end
      end
      if (dut.N6675 === 1'b0 && dut.N7339 === 1'b1 && dut.N2616 === 1'b1) begin
        if (!hit_recorded[151]) begin
          hit_recorded[151] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 151);
        end
      end
      if (dut.N7636 === 1'b1 && dut.N2618 === 1'b1 && dut.N6152 === 1'b1) begin
        if (!hit_recorded[152]) begin
          hit_recorded[152] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 152);
        end
      end
      if (dut.N7197 === 1'b1 && dut.N3507 === 1'b1 && dut.N6104 === 1'b1) begin
        if (!hit_recorded[153]) begin
          hit_recorded[153] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 153);
        end
      end
      if (dut.N6718 === 1'b1 && dut.N4959 === 1'b1 && dut.N7693 === 1'b1) begin
        if (!hit_recorded[154]) begin
          hit_recorded[154] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 154);
        end
      end
      if (dut.N6103 === 1'b1 && dut.N3807 === 1'b1 && dut.N4033 === 1'b1) begin
        if (!hit_recorded[155]) begin
          hit_recorded[155] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 155);
        end
      end
      if (dut.N7357 === 1'b1 && dut.N7458 === 1'b1 && dut.N7216 === 1'b0) begin
        if (!hit_recorded[156]) begin
          hit_recorded[156] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 156);
        end
      end
      if (dut.N3644 === 1'b1 && dut.N6648 === 1'b1 && dut.N7676 === 1'b1) begin
        if (!hit_recorded[157]) begin
          hit_recorded[157] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 157);
        end
      end
      if (dut.N5162 === 1'b0 && dut.N6074 === 1'b1 && dut.N7673 === 1'b1) begin
        if (!hit_recorded[158]) begin
          hit_recorded[158] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 158);
        end
      end
      if (dut.N6925 === 1'b0 && dut.N2607 === 1'b1 && dut.N7458 === 1'b1) begin
        if (!hit_recorded[159]) begin
          hit_recorded[159] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 159);
        end
      end
      if (dut.N8115 === 1'b1 && dut.N7340 === 1'b1 && dut.N6091 === 1'b1) begin
        if (!hit_recorded[160]) begin
          hit_recorded[160] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 160);
        end
      end
      if (dut.N4961 === 1'b1 && dut.N4954 === 1'b1 && dut.N2922 === 1'b1) begin
        if (!hit_recorded[161]) begin
          hit_recorded[161] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 161);
        end
      end
      if (dut.N6473 === 1'b1 && dut.N6925 === 1'b0 && dut.N7815 === 1'b0) begin
        if (!hit_recorded[162]) begin
          hit_recorded[162] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 162);
        end
      end
      if (dut.N2616 === 1'b1 && dut.N5063 === 1'b1 && dut.N6101 === 1'b1) begin
        if (!hit_recorded[163]) begin
          hit_recorded[163] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 163);
        end
      end
      if (dut.N7448 === 1'b1 && dut.N2589 === 1'b1 && dut.N3634 === 1'b1) begin
        if (!hit_recorded[164]) begin
          hit_recorded[164] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 164);
        end
      end
      if (dut.N7340 === 1'b1 && dut.N4274 === 1'b0 && dut.N6127 === 1'b1) begin
        if (!hit_recorded[165]) begin
          hit_recorded[165] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 165);
        end
      end
      if (dut.N7338 === 1'b1 && dut.N7364 === 1'b1 && dut.N8072 === 1'b1) begin
        if (!hit_recorded[166]) begin
          hit_recorded[166] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 166);
        end
      end
      if (dut.N7679 === 1'b1 && dut.N6071 === 1'b1 && dut.N2615 === 1'b1) begin
        if (!hit_recorded[167]) begin
          hit_recorded[167] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 167);
        end
      end
      if (dut.N7815 === 1'b0 && dut.N6133 === 1'b1 && dut.N7693 === 1'b1) begin
        if (!hit_recorded[168]) begin
          hit_recorded[168] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 168);
        end
      end
      if (dut.N6964 === 1'b0 && dut.N6069 === 1'b0 && dut.N6715 === 1'b1) begin
        if (!hit_recorded[169]) begin
          hit_recorded[169] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 169);
        end
      end
      if (dut.N3653 === 1'b1 && dut.N6964 === 1'b0 && dut.N7218 === 1'b0) begin
        if (!hit_recorded[170]) begin
          hit_recorded[170] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 170);
        end
      end
      if (dut.N7216 === 1'b0 && dut.N3404 === 1'b1 && dut.N4034 === 1'b1) begin
        if (!hit_recorded[171]) begin
          hit_recorded[171] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 171);
        end
      end
      if (dut.N4959 === 1'b1 && dut.N3026 === 1'b1 && dut.N3446 === 1'b1) begin
        if (!hit_recorded[172]) begin
          hit_recorded[172] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 172);
        end
      end
      if (dut.N7703 === 1'b1 && dut.N3642 === 1'b1 && dut.N6084 === 1'b1) begin
        if (!hit_recorded[173]) begin
          hit_recorded[173] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 173);
        end
      end
      if (dut.N7147 === 1'b1 && dut.N2619 === 1'b1 && dut.N2979 === 1'b1) begin
        if (!hit_recorded[174]) begin
          hit_recorded[174] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 174);
        end
      end
      if (dut.N3631 === 1'b1 && dut.N7686 === 1'b1 && dut.N3641 === 1'b1 && dut.N3505 === 1'b1) begin
        if (!hit_recorded[175]) begin
          hit_recorded[175] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 175);
        end
      end
      if (dut.N7013 === 1'b1 && dut.N6117 === 1'b1 && dut.N2981 === 1'b1 && dut.N4033 === 1'b1) begin
        if (!hit_recorded[176]) begin
          hit_recorded[176] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 176);
        end
      end
      if (dut.N7488 === 1'b1 && dut.N7487 === 1'b1 && dut.N7684 === 1'b1 && dut.N2595 === 1'b1) begin
        if (!hit_recorded[177]) begin
          hit_recorded[177] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 177);
        end
      end
      if (dut.N2981 === 1'b1 && dut.N3023 === 1'b1 && dut.N5154 === 1'b0 && dut.N7994 === 1'b1) begin
        if (!hit_recorded[178]) begin
          hit_recorded[178] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 178);
        end
      end
      if (dut.N4278 === 1'b0 && dut.N7684 === 1'b1 && dut.N3632 === 1'b1 && dut.N5154 === 1'b0) begin
        if (!hit_recorded[179]) begin
          hit_recorded[179] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 179);
        end
      end
      if (dut.N3786 === 1'b1 && dut.N2618 === 1'b1 && dut.N5155 === 1'b0 && dut.N6157 === 1'b1) begin
        if (!hit_recorded[180]) begin
          hit_recorded[180] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 180);
        end
      end
      if (dut.N3461 === 1'b1 && dut.N6872 === 1'b0 && dut.N5066 === 1'b1 && dut.N2613 === 1'b1) begin
        if (!hit_recorded[181]) begin
          hit_recorded[181] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 181);
        end
      end
      if (dut.N6083 === 1'b1 && dut.N6146 === 1'b1 && dut.N4741 === 1'b1 && dut.N7688 === 1'b1) begin
        if (!hit_recorded[182]) begin
          hit_recorded[182] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 182);
        end
      end
      if (dut.N6153 === 1'b1 && dut.N7159 === 1'b0 && dut.N3484 === 1'b1 && dut.N5117 === 1'b1) begin
        if (!hit_recorded[183]) begin
          hit_recorded[183] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 183);
        end
      end
      if (dut.N7751 === 1'b0 && dut.N2937 === 1'b1 && dut.N5061 === 1'b1 && dut.N8119 === 1'b1) begin
        if (!hit_recorded[184]) begin
          hit_recorded[184] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 184);
        end
      end
      if (dut.N3784 === 1'b1 && dut.N3633 === 1'b1 && dut.N3404 === 1'b1 && dut.N4975 === 1'b0) begin
        if (!hit_recorded[185]) begin
          hit_recorded[185] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 185);
        end
      end
      if (dut.N2589 === 1'b1 && dut.N2587 === 1'b1 && dut.N5954 === 1'b1 && dut.N4955 === 1'b1) begin
        if (!hit_recorded[186]) begin
          hit_recorded[186] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 186);
        end
      end
      if (dut.N3450 === 1'b1 && dut.N6927 === 1'b0 && dut.N3629 === 1'b1 && dut.N7440 === 1'b1) begin
        if (!hit_recorded[187]) begin
          hit_recorded[187] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 187);
        end
      end
      if (dut.N3409 === 1'b1 && dut.N5162 === 1'b0 && dut.N5063 === 1'b1 && dut.N7196 === 1'b1) begin
        if (!hit_recorded[188]) begin
          hit_recorded[188] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 188);
        end
      end
      if (dut.N3023 === 1'b1 && dut.N7696 === 1'b1 && dut.N6953 === 1'b0 && dut.N7158 === 1'b0) begin
        if (!hit_recorded[189]) begin
          hit_recorded[189] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 189);
        end
      end
      if (dut.N2596 === 1'b1 && dut.N6104 === 1'b1 && dut.N3808 === 1'b1 && dut.N6643 === 1'b1) begin
        if (!hit_recorded[190]) begin
          hit_recorded[190] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 190);
        end
      end
      if (dut.N7751 === 1'b0 && dut.N3412 === 1'b1 && dut.N7690 === 1'b1 && dut.N7695 === 1'b1) begin
        if (!hit_recorded[191]) begin
          hit_recorded[191] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 191);
        end
      end
      if (dut.N7680 === 1'b1 && dut.N2612 === 1'b1 && dut.N2703 === 1'b1 && dut.N7692 === 1'b1) begin
        if (!hit_recorded[192]) begin
          hit_recorded[192] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 192);
        end
      end
      if (dut.N6096 === 1'b1 && dut.N7342 === 1'b1 && dut.N3403 === 1'b1 && dut.N7320 === 1'b0) begin
        if (!hit_recorded[193]) begin
          hit_recorded[193] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 193);
        end
      end
      if (dut.N6925 === 1'b0 && dut.N3628 === 1'b1 && dut.N6953 === 1'b0 && dut.N7672 === 1'b1) begin
        if (!hit_recorded[194]) begin
          hit_recorded[194] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 194);
        end
      end
      if (dut.N6843 === 1'b0 && dut.N6097 === 1'b1 && dut.N7455 === 1'b1 && dut.N4978 === 1'b1) begin
        if (!hit_recorded[195]) begin
          hit_recorded[195] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 195);
        end
      end
      if (dut.N3786 === 1'b1 && dut.N4040 === 1'b1 && dut.N3657 === 1'b1 && dut.N7216 === 1'b0) begin
        if (!hit_recorded[196]) begin
          hit_recorded[196] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 196);
        end
      end
      if (dut.N7788 === 1'b0 && dut.N7672 === 1'b1 && dut.N2615 === 1'b1 && dut.N3623 === 1'b1) begin
        if (!hit_recorded[197]) begin
          hit_recorded[197] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 197);
        end
      end
      if (dut.N4958 === 1'b1 && dut.N3642 === 1'b1 && dut.N6143 === 1'b1 && dut.N2616 === 1'b1) begin
        if (!hit_recorded[198]) begin
          hit_recorded[198] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 198);
        end
      end
      if (dut.N7788 === 1'b0 && dut.N6066 === 1'b0 && dut.N6154 === 1'b1 && dut.N3805 === 1'b1) begin
        if (!hit_recorded[199]) begin
          hit_recorded[199] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 199);
        end
      end
    end
  endtask

endmodule
