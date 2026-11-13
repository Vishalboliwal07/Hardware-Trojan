`timescale 1ns/1ps

////////////////////////////////////////////////////////////////////////////////
// Standalone Gate-Level Combinational Verification Testbench: C7552
// Primary Inputs:  207
// Primary Outputs: 108
// Test Patterns:   1684 MC-ATPG Patterns
// Injected Trojans: 200
////////////////////////////////////////////////////////////////////////////////

module tb_c7552;

  localparam NUM_PIS = 207;
  localparam NUM_POS = 108;
  localparam MAX_PATS = 100000;
  localparam CLK_PERIOD = 10;

  reg [NUM_PIS-1:0] pi_mem [0:MAX_PATS-1];
  reg [NUM_PIS-1:0] pi;
  wire [NUM_POS-1:0] po;

  integer p_idx, total_pats, fd, scan_ret;
  integer hit_count = 0;
  reg [199:0] hit_recorded;

  // Fully Connected Combinational DUT Instance
  c7552 dut (
    .N1(pi[0]),
    .N5(pi[1]),
    .N9(pi[2]),
    .N12(pi[3]),
    .N15(pi[4]),
    .N18(pi[5]),
    .N23(pi[6]),
    .N26(pi[7]),
    .N29(pi[8]),
    .N32(pi[9]),
    .N35(pi[10]),
    .N38(pi[11]),
    .N41(pi[12]),
    .N44(pi[13]),
    .N47(pi[14]),
    .N50(pi[15]),
    .N53(pi[16]),
    .N54(pi[17]),
    .N55(pi[18]),
    .N56(pi[19]),
    .N57(pi[20]),
    .N58(pi[21]),
    .N59(pi[22]),
    .N60(pi[23]),
    .N61(pi[24]),
    .N62(pi[25]),
    .N63(pi[26]),
    .N64(pi[27]),
    .N65(pi[28]),
    .N66(pi[29]),
    .N69(pi[30]),
    .N70(pi[31]),
    .N73(pi[32]),
    .N74(pi[33]),
    .N75(pi[34]),
    .N76(pi[35]),
    .N77(pi[36]),
    .N78(pi[37]),
    .N79(pi[38]),
    .N80(pi[39]),
    .N81(pi[40]),
    .N82(pi[41]),
    .N83(pi[42]),
    .N84(pi[43]),
    .N85(pi[44]),
    .N86(pi[45]),
    .N87(pi[46]),
    .N88(pi[47]),
    .N89(pi[48]),
    .N94(pi[49]),
    .N97(pi[50]),
    .N100(pi[51]),
    .N103(pi[52]),
    .N106(pi[53]),
    .N109(pi[54]),
    .N110(pi[55]),
    .N111(pi[56]),
    .N112(pi[57]),
    .N113(pi[58]),
    .N114(pi[59]),
    .N115(pi[60]),
    .N118(pi[61]),
    .N121(pi[62]),
    .N124(pi[63]),
    .N127(pi[64]),
    .N130(pi[65]),
    .N133(pi[66]),
    .N134(pi[67]),
    .N135(pi[68]),
    .N138(pi[69]),
    .N141(pi[70]),
    .N144(pi[71]),
    .N147(pi[72]),
    .N150(pi[73]),
    .N151(pi[74]),
    .N152(pi[75]),
    .N153(pi[76]),
    .N154(pi[77]),
    .N155(pi[78]),
    .N156(pi[79]),
    .N157(pi[80]),
    .N158(pi[81]),
    .N159(pi[82]),
    .N160(pi[83]),
    .N161(pi[84]),
    .N162(pi[85]),
    .N163(pi[86]),
    .N164(pi[87]),
    .N165(pi[88]),
    .N166(pi[89]),
    .N167(pi[90]),
    .N168(pi[91]),
    .N169(pi[92]),
    .N170(pi[93]),
    .N171(pi[94]),
    .N172(pi[95]),
    .N173(pi[96]),
    .N174(pi[97]),
    .N175(pi[98]),
    .N176(pi[99]),
    .N177(pi[100]),
    .N178(pi[101]),
    .N179(pi[102]),
    .N180(pi[103]),
    .N181(pi[104]),
    .N182(pi[105]),
    .N183(pi[106]),
    .N184(pi[107]),
    .N185(pi[108]),
    .N186(pi[109]),
    .N187(pi[110]),
    .N188(pi[111]),
    .N189(pi[112]),
    .N190(pi[113]),
    .N191(pi[114]),
    .N192(pi[115]),
    .N193(pi[116]),
    .N194(pi[117]),
    .N195(pi[118]),
    .N196(pi[119]),
    .N197(pi[120]),
    .N198(pi[121]),
    .N199(pi[122]),
    .N200(pi[123]),
    .N201(pi[124]),
    .N202(pi[125]),
    .N203(pi[126]),
    .N204(pi[127]),
    .N205(pi[128]),
    .N206(pi[129]),
    .N207(pi[130]),
    .N208(pi[131]),
    .N209(pi[132]),
    .N210(pi[133]),
    .N211(pi[134]),
    .N212(pi[135]),
    .N213(pi[136]),
    .N214(pi[137]),
    .N215(pi[138]),
    .N216(pi[139]),
    .N217(pi[140]),
    .N218(pi[141]),
    .N219(pi[142]),
    .N220(pi[143]),
    .N221(pi[144]),
    .N222(pi[145]),
    .N223(pi[146]),
    .N224(pi[147]),
    .N225(pi[148]),
    .N226(pi[149]),
    .N227(pi[150]),
    .N228(pi[151]),
    .N229(pi[152]),
    .N230(pi[153]),
    .N231(pi[154]),
    .N232(pi[155]),
    .N233(pi[156]),
    .N234(pi[157]),
    .N235(pi[158]),
    .N236(pi[159]),
    .N237(pi[160]),
    .N238(pi[161]),
    .N239(pi[162]),
    .N240(pi[163]),
    .N242(pi[164]),
    .N245(pi[165]),
    .N248(pi[166]),
    .N251(pi[167]),
    .N254(pi[168]),
    .N257(pi[169]),
    .N260(pi[170]),
    .N263(pi[171]),
    .N267(pi[172]),
    .N271(pi[173]),
    .N274(pi[174]),
    .N277(pi[175]),
    .N280(pi[176]),
    .N283(pi[177]),
    .N286(pi[178]),
    .N289(pi[179]),
    .N293(pi[180]),
    .N296(pi[181]),
    .N299(pi[182]),
    .N303(pi[183]),
    .N307(pi[184]),
    .N310(pi[185]),
    .N313(pi[186]),
    .N316(pi[187]),
    .N319(pi[188]),
    .N322(pi[189]),
    .N325(pi[190]),
    .N328(pi[191]),
    .N331(pi[192]),
    .N334(pi[193]),
    .N337(pi[194]),
    .N340(pi[195]),
    .N343(pi[196]),
    .N346(pi[197]),
    .N349(pi[198]),
    .N352(pi[199]),
    .N355(pi[200]),
    .N358(pi[201]),
    .N361(pi[202]),
    .N364(pi[203]),
    .N367(pi[204]),
    .N382(pi[205]),
    .N241_I(pi[206]),
    .N387(po[0]),
    .N388(po[1]),
    .N478(po[2]),
    .N482(po[3]),
    .N484(po[4]),
    .N486(po[5]),
    .N489(po[6]),
    .N492(po[7]),
    .N501(po[8]),
    .N505(po[9]),
    .N507(po[10]),
    .N509(po[11]),
    .N511(po[12]),
    .N513(po[13]),
    .N515(po[14]),
    .N517(po[15]),
    .N519(po[16]),
    .N535(po[17]),
    .N537(po[18]),
    .N539(po[19]),
    .N541(po[20]),
    .N543(po[21]),
    .N545(po[22]),
    .N547(po[23]),
    .N549(po[24]),
    .N551(po[25]),
    .N553(po[26]),
    .N556(po[27]),
    .N559(po[28]),
    .N561(po[29]),
    .N563(po[30]),
    .N565(po[31]),
    .N567(po[32]),
    .N569(po[33]),
    .N571(po[34]),
    .N573(po[35]),
    .N582(po[36]),
    .N643(po[37]),
    .N707(po[38]),
    .N813(po[39]),
    .N881(po[40]),
    .N882(po[41]),
    .N883(po[42]),
    .N884(po[43]),
    .N885(po[44]),
    .N889(po[45]),
    .N945(po[46]),
    .N1110(po[47]),
    .N1111(po[48]),
    .N1112(po[49]),
    .N1113(po[50]),
    .N1114(po[51]),
    .N1489(po[52]),
    .N1490(po[53]),
    .N1781(po[54]),
    .N10025(po[55]),
    .N10101(po[56]),
    .N10102(po[57]),
    .N10103(po[58]),
    .N10104(po[59]),
    .N10109(po[60]),
    .N10110(po[61]),
    .N10111(po[62]),
    .N10112(po[63]),
    .N10350(po[64]),
    .N10351(po[65]),
    .N10352(po[66]),
    .N10353(po[67]),
    .N10574(po[68]),
    .N10575(po[69]),
    .N10576(po[70]),
    .N10628(po[71]),
    .N10632(po[72]),
    .N10641(po[73]),
    .N10704(po[74]),
    .N10706(po[75]),
    .N10711(po[76]),
    .N10712(po[77]),
    .N10713(po[78]),
    .N10714(po[79]),
    .N10715(po[80]),
    .N10716(po[81]),
    .N10717(po[82]),
    .N10718(po[83]),
    .N10729(po[84]),
    .N10759(po[85]),
    .N10760(po[86]),
    .N10761(po[87]),
    .N10762(po[88]),
    .N10763(po[89]),
    .N10827(po[90]),
    .N10837(po[91]),
    .N10838(po[92]),
    .N10839(po[93]),
    .N10840(po[94]),
    .N10868(po[95]),
    .N10869(po[96]),
    .N10870(po[97]),
    .N10871(po[98]),
    .N10905(po[99]),
    .N10906(po[100]),
    .N10907(po[101]),
    .N10908(po[102]),
    .N11333(po[103]),
    .N11334(po[104]),
    .N11340(po[105]),
    .N11342(po[106]),
    .N241_O(po[107])
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
    $display("[START] Running Gate-Level Trojan Activation Testbench: C7552 (%0d patterns)", total_pats);
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
    $display("[DONE] Simulation Complete. Total Unique Trojans Triggered: %0d / 200", hit_count);
    $display("================================================================================");
    $finish;
  end

  task check_trojans;
    begin
      if (dut.N10289 === 1'b1) begin
        if (!hit_recorded[0]) begin
          hit_recorded[0] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 0);
        end
      end
      if (dut.N7067 === 1'b1) begin
        if (!hit_recorded[1]) begin
          hit_recorded[1] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 1);
        end
      end
      if (dut.N9064 === 1'b0) begin
        if (!hit_recorded[2]) begin
          hit_recorded[2] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 2);
        end
      end
      if (dut.N6806 === 1'b0) begin
        if (!hit_recorded[3]) begin
          hit_recorded[3] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 3);
        end
      end
      if (dut.N8455 === 1'b1) begin
        if (!hit_recorded[4]) begin
          hit_recorded[4] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 4);
        end
      end
      if (dut.N8609 === 1'b1) begin
        if (!hit_recorded[5]) begin
          hit_recorded[5] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 5);
        end
      end
      if (dut.N8548 === 1'b1) begin
        if (!hit_recorded[6]) begin
          hit_recorded[6] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 6);
        end
      end
      if (dut.N9585 === 1'b1) begin
        if (!hit_recorded[7]) begin
          hit_recorded[7] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 7);
        end
      end
      if (dut.N10917 === 1'b0) begin
        if (!hit_recorded[8]) begin
          hit_recorded[8] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 8);
        end
      end
      if (dut.N8354 === 1'b1) begin
        if (!hit_recorded[9]) begin
          hit_recorded[9] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 9);
        end
      end
      if (dut.N6782 === 1'b1) begin
        if (!hit_recorded[10]) begin
          hit_recorded[10] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 10);
        end
      end
      if (dut.N10535 === 1'b0) begin
        if (!hit_recorded[11]) begin
          hit_recorded[11] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 11);
        end
      end
      if (dut.N9604 === 1'b1) begin
        if (!hit_recorded[12]) begin
          hit_recorded[12] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 12);
        end
      end
      if (dut.n_352 === 1'b1) begin
        if (!hit_recorded[13]) begin
          hit_recorded[13] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 13);
        end
      end
      if (dut.N6861 === 1'b1) begin
        if (!hit_recorded[14]) begin
          hit_recorded[14] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 14);
        end
      end
      if (dut.N5586 === 1'b0) begin
        if (!hit_recorded[15]) begin
          hit_recorded[15] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 15);
        end
      end
      if (dut.N10013 === 1'b1) begin
        if (!hit_recorded[16]) begin
          hit_recorded[16] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 16);
        end
      end
      if (dut.N9790 === 1'b1) begin
        if (!hit_recorded[17]) begin
          hit_recorded[17] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 17);
        end
      end
      if (dut.N8351 === 1'b1) begin
        if (!hit_recorded[18]) begin
          hit_recorded[18] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 18);
        end
      end
      if (dut.N8280 === 1'b1) begin
        if (!hit_recorded[19]) begin
          hit_recorded[19] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 19);
        end
      end
      if (dut.N8281 === 1'b1) begin
        if (!hit_recorded[20]) begin
          hit_recorded[20] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 20);
        end
      end
      if (dut.N8340 === 1'b1) begin
        if (!hit_recorded[21]) begin
          hit_recorded[21] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 21);
        end
      end
      if (dut.N9372 === 1'b1) begin
        if (!hit_recorded[22]) begin
          hit_recorded[22] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 22);
        end
      end
      if (dut.N9065 === 1'b0) begin
        if (!hit_recorded[23]) begin
          hit_recorded[23] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 23);
        end
      end
      if (dut.N8436 === 1'b1) begin
        if (!hit_recorded[24]) begin
          hit_recorded[24] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 24);
        end
      end
      if (dut.N8404 === 1'b1) begin
        if (!hit_recorded[25]) begin
          hit_recorded[25] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 25);
        end
      end
      if (dut.N10738 === 1'b0) begin
        if (!hit_recorded[26]) begin
          hit_recorded[26] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 26);
        end
      end
      if (dut.N11226 === 1'b1) begin
        if (!hit_recorded[27]) begin
          hit_recorded[27] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 27);
        end
      end
      if (dut.N9273 === 1'b0) begin
        if (!hit_recorded[28]) begin
          hit_recorded[28] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 28);
        end
      end
      if (dut.N10259 === 1'b0) begin
        if (!hit_recorded[29]) begin
          hit_recorded[29] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 29);
        end
      end
      if (dut.N5188 === 1'b0) begin
        if (!hit_recorded[30]) begin
          hit_recorded[30] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 30);
        end
      end
      if (dut.N9285 === 1'b1) begin
        if (!hit_recorded[31]) begin
          hit_recorded[31] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 31);
        end
      end
      if (dut.N11223 === 1'b1) begin
        if (!hit_recorded[32]) begin
          hit_recorded[32] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 32);
        end
      end
      if (dut.N8513 === 1'b1) begin
        if (!hit_recorded[33]) begin
          hit_recorded[33] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 33);
        end
      end
      if (dut.N6860 === 1'b1) begin
        if (!hit_recorded[34]) begin
          hit_recorded[34] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 34);
        end
      end
      if (dut.N10021 === 1'b1) begin
        if (!hit_recorded[35]) begin
          hit_recorded[35] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 35);
        end
      end
      if (dut.N6196 === 1'b1) begin
        if (!hit_recorded[36]) begin
          hit_recorded[36] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 36);
        end
      end
      if (dut.N8547 === 1'b1) begin
        if (!hit_recorded[37]) begin
          hit_recorded[37] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 37);
        end
      end
      if (dut.N10176 === 1'b1) begin
        if (!hit_recorded[38]) begin
          hit_recorded[38] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 38);
        end
      end
      if (dut.N6249 === 1'b1) begin
        if (!hit_recorded[39]) begin
          hit_recorded[39] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 39);
        end
      end
      if (dut.N6771 === 1'b1) begin
        if (!hit_recorded[40]) begin
          hit_recorded[40] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 40);
        end
      end
      if (dut.N5740 === 1'b1) begin
        if (!hit_recorded[41]) begin
          hit_recorded[41] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 41);
        end
      end
      if (dut.N8449 === 1'b1) begin
        if (!hit_recorded[42]) begin
          hit_recorded[42] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 42);
        end
      end
      if (dut.N8863 === 1'b1) begin
        if (!hit_recorded[43]) begin
          hit_recorded[43] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 43);
        end
      end
      if (dut.N10862 === 1'b0) begin
        if (!hit_recorded[44]) begin
          hit_recorded[44] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 44);
        end
      end
      if (dut.N7441 === 1'b0) begin
        if (!hit_recorded[45]) begin
          hit_recorded[45] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 45);
        end
      end
      if (dut.N10923 === 1'b0) begin
        if (!hit_recorded[46]) begin
          hit_recorded[46] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 46);
        end
      end
      if (dut.N4806 === 1'b1) begin
        if (!hit_recorded[47]) begin
          hit_recorded[47] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 47);
        end
      end
      if (dut.N5477 === 1'b0) begin
        if (!hit_recorded[48]) begin
          hit_recorded[48] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 48);
        end
      end
      if (dut.N8262 === 1'b1) begin
        if (!hit_recorded[49]) begin
          hit_recorded[49] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 49);
        end
      end
      if (dut.N8216 === 1'b0) begin
        if (!hit_recorded[50]) begin
          hit_recorded[50] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 50);
        end
      end
      if (dut.N6840 === 1'b1) begin
        if (!hit_recorded[51]) begin
          hit_recorded[51] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 51);
        end
      end
      if (dut.N6848 === 1'b1) begin
        if (!hit_recorded[52]) begin
          hit_recorded[52] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 52);
        end
      end
      if (dut.N8437 === 1'b1) begin
        if (!hit_recorded[53]) begin
          hit_recorded[53] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 53);
        end
      end
      if (dut.N10055 === 1'b1) begin
        if (!hit_recorded[54]) begin
          hit_recorded[54] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 54);
        end
      end
      if (dut.N9964 === 1'b0) begin
        if (!hit_recorded[55]) begin
          hit_recorded[55] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 55);
        end
      end
      if (dut.N2117 === 1'b0) begin
        if (!hit_recorded[56]) begin
          hit_recorded[56] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 56);
        end
      end
      if (dut.N1113 === 1'b0) begin
        if (!hit_recorded[57]) begin
          hit_recorded[57] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 57);
        end
      end
      if (dut.N10234 === 1'b0) begin
        if (!hit_recorded[58]) begin
          hit_recorded[58] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 58);
        end
      end
      if (dut.N10439 === 1'b0) begin
        if (!hit_recorded[59]) begin
          hit_recorded[59] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 59);
        end
      end
      if (dut.N10577 === 1'b1) begin
        if (!hit_recorded[60]) begin
          hit_recorded[60] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 60);
        end
      end
      if (dut.N8438 === 1'b1) begin
        if (!hit_recorded[61]) begin
          hit_recorded[61] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 61);
        end
      end
      if (dut.N6849 === 1'b1) begin
        if (!hit_recorded[62]) begin
          hit_recorded[62] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 62);
        end
      end
      if (dut.N9025 === 1'b1) begin
        if (!hit_recorded[63]) begin
          hit_recorded[63] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 63);
        end
      end
      if (dut.N9371 === 1'b1) begin
        if (!hit_recorded[64]) begin
          hit_recorded[64] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 64);
        end
      end
      if (dut.N8145 === 1'b0) begin
        if (!hit_recorded[65]) begin
          hit_recorded[65] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 65);
        end
      end
      if (dut.N8579 === 1'b1) begin
        if (!hit_recorded[66]) begin
          hit_recorded[66] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 66);
        end
      end
      if (dut.N7100 === 1'b1) begin
        if (!hit_recorded[67]) begin
          hit_recorded[67] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 67);
        end
      end
      if (dut.N10648 === 1'b1) begin
        if (!hit_recorded[68]) begin
          hit_recorded[68] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 68);
        end
      end
      if (dut.N9408 === 1'b1) begin
        if (!hit_recorded[69]) begin
          hit_recorded[69] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 69);
        end
      end
      if (dut.N10060 === 1'b1) begin
        if (!hit_recorded[70]) begin
          hit_recorded[70] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 70);
        end
      end
      if (dut.N11155 === 1'b1) begin
        if (!hit_recorded[71]) begin
          hit_recorded[71] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 71);
        end
      end
      if (dut.N9280 === 1'b1) begin
        if (!hit_recorded[72]) begin
          hit_recorded[72] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 72);
        end
      end
      if (dut.N8405 === 1'b1) begin
        if (!hit_recorded[73]) begin
          hit_recorded[73] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 73);
        end
      end
      if (dut.N5469 === 1'b1) begin
        if (!hit_recorded[74]) begin
          hit_recorded[74] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 74);
        end
      end
      if (dut.N8276 === 1'b0) begin
        if (!hit_recorded[75]) begin
          hit_recorded[75] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 75);
        end
      end
      if (dut.N8421 === 1'b1) begin
        if (!hit_recorded[76]) begin
          hit_recorded[76] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 76);
        end
      end
      if (dut.N10113 === 1'b0) begin
        if (!hit_recorded[77]) begin
          hit_recorded[77] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 77);
        end
      end
      if (dut.N9650 === 1'b0) begin
        if (!hit_recorded[78]) begin
          hit_recorded[78] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 78);
        end
      end
      if (dut.N5960 === 1'b1) begin
        if (!hit_recorded[79]) begin
          hit_recorded[79] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 79);
        end
      end
      if (dut.N9419 === 1'b1) begin
        if (!hit_recorded[80]) begin
          hit_recorded[80] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 80);
        end
      end
      if (dut.N9258 === 1'b0) begin
        if (!hit_recorded[81]) begin
          hit_recorded[81] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 81);
        end
      end
      if (dut.N8412 === 1'b1) begin
        if (!hit_recorded[82]) begin
          hit_recorded[82] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 82);
        end
      end
      if (dut.N9286 === 1'b1) begin
        if (!hit_recorded[83]) begin
          hit_recorded[83] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 83);
        end
      end
      if (dut.N9863 === 1'b0) begin
        if (!hit_recorded[84]) begin
          hit_recorded[84] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 84);
        end
      end
      if (dut.N10278 === 1'b1) begin
        if (!hit_recorded[85]) begin
          hit_recorded[85] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 85);
        end
      end
      if (dut.N6844 === 1'b1) begin
        if (!hit_recorded[86]) begin
          hit_recorded[86] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 86);
        end
      end
      if (dut.N8430 === 1'b1) begin
        if (!hit_recorded[87]) begin
          hit_recorded[87] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 87);
        end
      end
      if (dut.N6770 === 1'b1) begin
        if (!hit_recorded[88]) begin
          hit_recorded[88] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 88);
        end
      end
      if (dut.N9422 === 1'b1) begin
        if (!hit_recorded[89]) begin
          hit_recorded[89] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 89);
        end
      end
      if (dut.N9754 === 1'b1) begin
        if (!hit_recorded[90]) begin
          hit_recorded[90] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 90);
        end
      end
      if (dut.N7552 === 1'b0) begin
        if (!hit_recorded[91]) begin
          hit_recorded[91] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 91);
        end
      end
      if (dut.N10082 === 1'b0) begin
        if (!hit_recorded[92]) begin
          hit_recorded[92] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 92);
        end
      end
      if (dut.N7066 === 1'b1) begin
        if (!hit_recorded[93]) begin
          hit_recorded[93] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 93);
        end
      end
      if (dut.N1109 === 1'b1) begin
        if (!hit_recorded[94]) begin
          hit_recorded[94] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 94);
        end
      end
      if (dut.N10551 === 1'b1) begin
        if (!hit_recorded[95]) begin
          hit_recorded[95] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 95);
        end
      end
      if (dut.N9432 === 1'b0) begin
        if (!hit_recorded[96]) begin
          hit_recorded[96] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 96);
        end
      end
      if (dut.N6711 === 1'b0) begin
        if (!hit_recorded[97]) begin
          hit_recorded[97] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 97);
        end
      end
      if (dut.N10747 === 1'b0) begin
        if (!hit_recorded[98]) begin
          hit_recorded[98] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 98);
        end
      end
      if (dut.N2866 === 1'b1) begin
        if (!hit_recorded[99]) begin
          hit_recorded[99] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 99);
        end
      end
      if (dut.N9958 === 1'b0) begin
        if (!hit_recorded[100]) begin
          hit_recorded[100] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 100);
        end
      end
      if (dut.N8348 === 1'b1) begin
        if (!hit_recorded[101]) begin
          hit_recorded[101] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 101);
        end
      end
      if (dut.N10922 === 1'b0) begin
        if (!hit_recorded[102]) begin
          hit_recorded[102] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 102);
        end
      end
      if (dut.N8541 === 1'b1) begin
        if (!hit_recorded[103]) begin
          hit_recorded[103] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 103);
        end
      end
      if (dut.n_353 === 1'b1) begin
        if (!hit_recorded[104]) begin
          hit_recorded[104] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 104);
        end
      end
      if (dut.N9307 === 1'b1) begin
        if (!hit_recorded[105]) begin
          hit_recorded[105] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 105);
        end
      end
      if (dut.N10451 === 1'b1) begin
        if (!hit_recorded[106]) begin
          hit_recorded[106] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 106);
        end
      end
      if (dut.N8416 === 1'b1) begin
        if (!hit_recorded[107]) begin
          hit_recorded[107] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 107);
        end
      end
      if (dut.N4333 === 1'b0) begin
        if (!hit_recorded[108]) begin
          hit_recorded[108] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 108);
        end
      end
      if (dut.N10271 === 1'b0) begin
        if (!hit_recorded[109]) begin
          hit_recorded[109] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 109);
        end
      end
      if (dut.N8298 === 1'b1) begin
        if (!hit_recorded[110]) begin
          hit_recorded[110] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 110);
        end
      end
      if (dut.N10247 === 1'b0) begin
        if (!hit_recorded[111]) begin
          hit_recorded[111] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 111);
        end
      end
      if (dut.N9053 === 1'b1) begin
        if (!hit_recorded[112]) begin
          hit_recorded[112] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 112);
        end
      end
      if (dut.N10178 === 1'b1) begin
        if (!hit_recorded[113]) begin
          hit_recorded[113] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 113);
        end
      end
      if (dut.N8578 === 1'b1) begin
        if (!hit_recorded[114]) begin
          hit_recorded[114] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 114);
        end
      end
      if (dut.N9602 === 1'b1) begin
        if (!hit_recorded[115]) begin
          hit_recorded[115] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 115);
        end
      end
      if (dut.N10036 === 1'b0) begin
        if (!hit_recorded[116]) begin
          hit_recorded[116] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 116);
        end
      end
      if (dut.N10073 === 1'b0) begin
        if (!hit_recorded[117]) begin
          hit_recorded[117] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 117);
        end
      end
      if (dut.N8356 === 1'b1) begin
        if (!hit_recorded[118]) begin
          hit_recorded[118] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 118);
        end
      end
      if (dut.N9968 === 1'b0) begin
        if (!hit_recorded[119]) begin
          hit_recorded[119] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 119);
        end
      end
      if (dut.N10093 === 1'b0) begin
        if (!hit_recorded[120]) begin
          hit_recorded[120] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 120);
        end
      end
      if (dut.N8357 === 1'b1) begin
        if (!hit_recorded[121]) begin
          hit_recorded[121] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 121);
        end
      end
      if (dut.N8274 === 1'b0) begin
        if (!hit_recorded[122]) begin
          hit_recorded[122] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 122);
        end
      end
      if (dut.N1489 === 1'b0) begin
        if (!hit_recorded[123]) begin
          hit_recorded[123] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 123);
        end
      end
      if (dut.N6773 === 1'b1) begin
        if (!hit_recorded[124]) begin
          hit_recorded[124] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 124);
        end
      end
      if (dut.N4303 === 1'b0 && dut.N8433 === 1'b1) begin
        if (!hit_recorded[125]) begin
          hit_recorded[125] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 125);
        end
      end
      if (dut.N4784 === 1'b0 && dut.N8449 === 1'b1) begin
        if (!hit_recorded[126]) begin
          hit_recorded[126] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 126);
        end
      end
      if (dut.N9873 === 1'b0 && dut.N8276 === 1'b0) begin
        if (!hit_recorded[127]) begin
          hit_recorded[127] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 127);
        end
      end
      if (dut.N9432 === 1'b0 && dut.N8547 === 1'b1) begin
        if (!hit_recorded[128]) begin
          hit_recorded[128] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 128);
        end
      end
      if (dut.N10270 === 1'b0 && dut.N6199 === 1'b1) begin
        if (!hit_recorded[129]) begin
          hit_recorded[129] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 129);
        end
      end
      if (dut.N6852 === 1'b1 && dut.N7477 === 1'b0) begin
        if (!hit_recorded[130]) begin
          hit_recorded[130] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 130);
        end
      end
      if (dut.N9614 === 1'b1 && dut.N9426 === 1'b1) begin
        if (!hit_recorded[131]) begin
          hit_recorded[131] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 131);
        end
      end
      if (dut.N7060 === 1'b1 && dut.N8285 === 1'b1) begin
        if (!hit_recorded[132]) begin
          hit_recorded[132] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 132);
        end
      end
      if (dut.N11224 === 1'b1 && dut.N10922 === 1'b0) begin
        if (!hit_recorded[133]) begin
          hit_recorded[133] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 133);
        end
      end
      if (dut.N8438 === 1'b1 && dut.N9621 === 1'b1) begin
        if (!hit_recorded[134]) begin
          hit_recorded[134] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 134);
        end
      end
      if (dut.N8404 === 1'b1 && dut.N11152 === 1'b1) begin
        if (!hit_recorded[135]) begin
          hit_recorded[135] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 135);
        end
      end
      if (dut.N8513 === 1'b1 && dut.N9964 === 1'b0) begin
        if (!hit_recorded[136]) begin
          hit_recorded[136] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 136);
        end
      end
      if (dut.N8276 === 1'b0 && dut.N9970 === 1'b0) begin
        if (!hit_recorded[137]) begin
          hit_recorded[137] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 137);
        end
      end
      if (dut.N10271 === 1'b0 && dut.N6852 === 1'b1) begin
        if (!hit_recorded[138]) begin
          hit_recorded[138] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 138);
        end
      end
      if (dut.N8454 === 1'b1 && dut.N8284 === 1'b1) begin
        if (!hit_recorded[139]) begin
          hit_recorded[139] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 139);
        end
      end
      if (dut.N9764 === 1'b0 && dut.n_332 === 1'b1) begin
        if (!hit_recorded[140]) begin
          hit_recorded[140] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 140);
        end
      end
      if (dut.N5755 === 1'b1 && dut.N9273 === 1'b0) begin
        if (!hit_recorded[141]) begin
          hit_recorded[141] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 141);
        end
      end
      if (dut.N7066 === 1'b1 && dut.N9285 === 1'b1) begin
        if (!hit_recorded[142]) begin
          hit_recorded[142] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 142);
        end
      end
      if (dut.N6767 === 1'b1 && dut.N9256 === 1'b0) begin
        if (!hit_recorded[143]) begin
          hit_recorded[143] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 143);
        end
      end
      if (dut.N10082 === 1'b0 && dut.N575 === 1'b1) begin
        if (!hit_recorded[144]) begin
          hit_recorded[144] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 144);
        end
      end
      if (dut.N8409 === 1'b1 && dut.N9375 === 1'b0) begin
        if (!hit_recorded[145]) begin
          hit_recorded[145] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 145);
        end
      end
      if (dut.N6849 === 1'b1 && dut.N6841 === 1'b1) begin
        if (!hit_recorded[146]) begin
          hit_recorded[146] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 146);
        end
      end
      if (dut.N10060 === 1'b1 && dut.N8354 === 1'b1) begin
        if (!hit_recorded[147]) begin
          hit_recorded[147] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 147);
        end
      end
      if (dut.N6849 === 1'b1 && dut.N8405 === 1'b1) begin
        if (!hit_recorded[148]) begin
          hit_recorded[148] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 148);
        end
      end
      if (dut.N9773 === 1'b0 && dut.N10056 === 1'b1) begin
        if (!hit_recorded[149]) begin
          hit_recorded[149] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 149);
        end
      end
      if (dut.N8452 === 1'b1 && dut.n_318 === 1'b1 && dut.N8394 === 1'b1) begin
        if (!hit_recorded[150]) begin
          hit_recorded[150] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 150);
        end
      end
      if (dut.N9621 === 1'b1 && dut.N6836 === 1'b1 && dut.N10445 === 1'b0) begin
        if (!hit_recorded[151]) begin
          hit_recorded[151] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 151);
        end
      end
      if (dut.n_335 === 1'b1 && dut.N10816 === 1'b0 && dut.N7064 === 1'b1) begin
        if (!hit_recorded[152]) begin
          hit_recorded[152] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 152);
        end
      end
      if (dut.N5587 === 1'b0 && dut.N5475 === 1'b0 && dut.N10746 === 1'b0) begin
        if (!hit_recorded[153]) begin
          hit_recorded[153] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 153);
        end
      end
      if (dut.N9736 === 1'b1 && dut.N10259 === 1'b0 && dut.N9419 === 1'b1) begin
        if (!hit_recorded[154]) begin
          hit_recorded[154] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 154);
        end
      end
      if (dut.N11227 === 1'b1 && dut.N10705 === 1'b1 && dut.N8283 === 1'b1) begin
        if (!hit_recorded[155]) begin
          hit_recorded[155] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 155);
        end
      end
      if (dut.N7103 === 1'b1 && dut.N575 === 1'b1 && dut.N6800 === 1'b0) begin
        if (!hit_recorded[156]) begin
          hit_recorded[156] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 156);
        end
      end
      if (dut.N8339 === 1'b1 && dut.N9961 === 1'b0 && dut.N10093 === 1'b0) begin
        if (!hit_recorded[157]) begin
          hit_recorded[157] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 157);
        end
      end
      if (dut.N10041 === 1'b1 && dut.N9968 === 1'b0 && dut.N10737 === 1'b0) begin
        if (!hit_recorded[158]) begin
          hit_recorded[158] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 158);
        end
      end
      if (dut.N8548 === 1'b1 && dut.n_353 === 1'b1 && dut.N4303 === 1'b0) begin
        if (!hit_recorded[159]) begin
          hit_recorded[159] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 159);
        end
      end
      if (dut.N9653 === 1'b0 && dut.N5185 === 1'b0 && dut.N8888 === 1'b0) begin
        if (!hit_recorded[160]) begin
          hit_recorded[160] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 160);
        end
      end
      if (dut.N4487 === 1'b0 && dut.N8298 === 1'b1 && dut.N6779 === 1'b1) begin
        if (!hit_recorded[161]) begin
          hit_recorded[161] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 161);
        end
      end
      if (dut.N6806 === 1'b0 && dut.N6854 === 1'b1 && dut.N10388 === 1'b1) begin
        if (!hit_recorded[162]) begin
          hit_recorded[162] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 162);
        end
      end
      if (dut.N6848 === 1'b1 && dut.N9307 === 1'b1 && dut.N11223 === 1'b1) begin
        if (!hit_recorded[163]) begin
          hit_recorded[163] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 163);
        end
      end
      if (dut.N9024 === 1'b1 && dut.N9604 === 1'b1 && dut.N9602 === 1'b1) begin
        if (!hit_recorded[164]) begin
          hit_recorded[164] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 164);
        end
      end
      if (dut.N9732 === 1'b1 && dut.N6845 === 1'b1 && dut.N8283 === 1'b1) begin
        if (!hit_recorded[165]) begin
          hit_recorded[165] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 165);
        end
      end
      if (dut.N10234 === 1'b0 && dut.N10598 === 1'b1 && dut.N9560 === 1'b1) begin
        if (!hit_recorded[166]) begin
          hit_recorded[166] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 166);
        end
      end
      if (dut.N7057 === 1'b1 && dut.N6779 === 1'b1 && dut.N10073 === 1'b0) begin
        if (!hit_recorded[167]) begin
          hit_recorded[167] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 167);
        end
      end
      if (dut.N6861 === 1'b1 && dut.N10451 === 1'b1 && dut.N10206 === 1'b0) begin
        if (!hit_recorded[168]) begin
          hit_recorded[168] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 168);
        end
      end
      if (dut.N10248 === 1'b0 && dut.N9370 === 1'b1 && dut.N10289 === 1'b1) begin
        if (!hit_recorded[169]) begin
          hit_recorded[169] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 169);
        end
      end
      if (dut.N10333 === 1'b0 && dut.N6833 === 1'b1 && dut.N8627 === 1'b1) begin
        if (!hit_recorded[170]) begin
          hit_recorded[170] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 170);
        end
      end
      if (dut.N10746 === 1'b0 && dut.N9873 === 1'b0 && dut.N10280 === 1'b1) begin
        if (!hit_recorded[171]) begin
          hit_recorded[171] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 171);
        end
      end
      if (dut.N9846 === 1'b0 && dut.N6859 === 1'b1 && dut.N9560 === 1'b1) begin
        if (!hit_recorded[172]) begin
          hit_recorded[172] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 172);
        end
      end
      if (dut.N5165 === 1'b0 && dut.N10058 === 1'b1 && dut.N8863 === 1'b1) begin
        if (!hit_recorded[173]) begin
          hit_recorded[173] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 173);
        end
      end
      if (dut.N10264 === 1'b0 && dut.N9399 === 1'b1 && dut.N6766 === 1'b1) begin
        if (!hit_recorded[174]) begin
          hit_recorded[174] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 174);
        end
      end
      if (dut.N8609 === 1'b1 && dut.N8541 === 1'b1 && dut.N10060 === 1'b1 && dut.N9846 === 1'b0) begin
        if (!hit_recorded[175]) begin
          hit_recorded[175] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 175);
        end
      end
      if (dut.N10581 === 1'b1 && dut.N9569 === 1'b0 && dut.N10036 === 1'b0 && dut.N10399 === 1'b1) begin
        if (!hit_recorded[176]) begin
          hit_recorded[176] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 176);
        end
      end
      if (dut.N8540 === 1'b1 && dut.N9906 === 1'b1 && dut.N10581 === 1'b1 && dut.N10445 === 1'b0) begin
        if (!hit_recorded[177]) begin
          hit_recorded[177] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 177);
        end
      end
      if (dut.N10085 === 1'b0 && dut.N10575 === 1'b0 && dut.N10113 === 1'b0 && dut.N10596 === 1'b1) begin
        if (!hit_recorded[178]) begin
          hit_recorded[178] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 178);
        end
      end
      if (dut.N9603 === 1'b1 && dut.N10042 === 1'b1 && dut.N9604 === 1'b1 && dut.N9613 === 1'b1) begin
        if (!hit_recorded[179]) begin
          hit_recorded[179] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 179);
        end
      end
      if (dut.N2653 === 1'b0 && dut.N5960 === 1'b1 && dut.N10439 === 1'b0 && dut.N10729 === 1'b0) begin
        if (!hit_recorded[180]) begin
          hit_recorded[180] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 180);
        end
      end
      if (dut.N10648 === 1'b1 && dut.N9873 === 1'b0 && dut.N8554 === 1'b1 && dut.N4326 === 1'b0) begin
        if (!hit_recorded[181]) begin
          hit_recorded[181] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 181);
        end
      end
      if (dut.N5744 === 1'b1 && dut.N9371 === 1'b1 && dut.N7441 === 1'b0 && dut.N10247 === 1'b0) begin
        if (!hit_recorded[182]) begin
          hit_recorded[182] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 182);
        end
      end
      if (dut.N1109 === 1'b1 && dut.N6855 === 1'b1 && dut.N10212 === 1'b0 && dut.N528 === 1'b1) begin
        if (!hit_recorded[183]) begin
          hit_recorded[183] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 183);
        end
      end
      if (dut.N10746 === 1'b0 && dut.N9271 === 1'b0 && dut.N10265 === 1'b0 && dut.N8418 === 1'b1) begin
        if (!hit_recorded[184]) begin
          hit_recorded[184] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 184);
        end
      end
      if (dut.N7105 === 1'b1 && dut.N5586 === 1'b0 && dut.N9407 === 1'b0 && dut.N10093 === 1'b0) begin
        if (!hit_recorded[185]) begin
          hit_recorded[185] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 185);
        end
      end
      if (dut.N6767 === 1'b1 && dut.N8409 === 1'b1 && dut.N10059 === 1'b1 && dut.N10272 === 1'b0) begin
        if (!hit_recorded[186]) begin
          hit_recorded[186] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 186);
        end
      end
      if (dut.N9601 === 1'b0 && dut.N10574 === 1'b0 && dut.N10084 === 1'b0 && dut.N8340 === 1'b1) begin
        if (!hit_recorded[187]) begin
          hit_recorded[187] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 187);
        end
      end
      if (dut.N4784 === 1'b0 && dut.N5188 === 1'b0 && dut.N8276 === 1'b0 && dut.N6249 === 1'b1) begin
        if (!hit_recorded[188]) begin
          hit_recorded[188] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 188);
        end
      end
      if (dut.N4326 === 1'b0 && dut.N5183 === 1'b0 && dut.N5747 === 1'b0 && dut.N8608 === 1'b0) begin
        if (!hit_recorded[189]) begin
          hit_recorded[189] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 189);
        end
      end
      if (dut.N6249 === 1'b1 && dut.N9585 === 1'b1 && dut.N9276 === 1'b0 && dut.N9613 === 1'b1) begin
        if (!hit_recorded[190]) begin
          hit_recorded[190] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 190);
        end
      end
      if (dut.N8341 === 1'b1 && dut.N10596 === 1'b1 && dut.N3379 === 1'b1 && dut.N8285 === 1'b1) begin
        if (!hit_recorded[191]) begin
          hit_recorded[191] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 191);
        end
      end
      if (dut.N9307 === 1'b1 && dut.N9396 === 1'b1 && dut.N10014 === 1'b1 && dut.N883 === 1'b0) begin
        if (!hit_recorded[192]) begin
          hit_recorded[192] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 192);
        end
      end
      if (dut.N8342 === 1'b1 && dut.N6766 === 1'b1 && dut.N10576 === 1'b0 && dut.N11155 === 1'b1) begin
        if (!hit_recorded[193]) begin
          hit_recorded[193] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 193);
        end
      end
      if (dut.N11225 === 1'b1 && dut.N8866 === 1'b1 && dut.N7062 === 1'b1 && dut.N6800 === 1'b0) begin
        if (!hit_recorded[194]) begin
          hit_recorded[194] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 194);
        end
      end
      if (dut.N9276 === 1'b0 && dut.N9256 === 1'b0 && dut.N1489 === 1'b0 && dut.N8341 === 1'b1) begin
        if (!hit_recorded[195]) begin
          hit_recorded[195] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 195);
        end
      end
      if (dut.N10056 === 1'b1 && dut.N8513 === 1'b1 && dut.N8539 === 1'b1 && dut.N9385 === 1'b1) begin
        if (!hit_recorded[196]) begin
          hit_recorded[196] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 196);
        end
      end
      if (dut.N7060 === 1'b1 && dut.N8865 === 1'b1 && dut.N5323 === 1'b0 && dut.N8483 === 1'b1) begin
        if (!hit_recorded[197]) begin
          hit_recorded[197] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 197);
        end
      end
      if (dut.N8539 === 1'b1 && dut.N8513 === 1'b1 && dut.N9344 === 1'b1 && dut.N9262 === 1'b0) begin
        if (!hit_recorded[198]) begin
          hit_recorded[198] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 198);
        end
      end
      if (dut.N8276 === 1'b0 && dut.N5586 === 1'b0 && dut.N8355 === 1'b1 && dut.N10037 === 1'b0) begin
        if (!hit_recorded[199]) begin
          hit_recorded[199] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 199);
        end
      end
    end
  endtask

endmodule
