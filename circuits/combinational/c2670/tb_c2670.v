`timescale 1ns/1ps

////////////////////////////////////////////////////////////////////////////////
// Standalone Gate-Level Combinational Verification Testbench: C2670
// Primary Inputs:  233
// Primary Outputs: 140
// Test Patterns:   2328 MC-ATPG Patterns
// Injected Trojans: 199
////////////////////////////////////////////////////////////////////////////////

module tb_c2670;

  localparam NUM_PIS = 233;
  localparam NUM_POS = 140;
  localparam NUM_PATS = 2328;
  localparam CLK_PERIOD = 10;

  reg [NUM_PIS-1:0] pi_mem [0:NUM_PATS-1];
  reg [NUM_PIS-1:0] pi;
  wire [NUM_POS-1:0] po;

  integer p_idx;
  integer hit_count = 0;
  reg [198:0] hit_recorded;

  // Fully Connected Combinational DUT Instance
  c2670 dut (
    .N1(pi[0]),
    .N2(pi[1]),
    .N3(pi[2]),
    .N4(pi[3]),
    .N5(pi[4]),
    .N6(pi[5]),
    .N7(pi[6]),
    .N8(pi[7]),
    .N11(pi[8]),
    .N14(pi[9]),
    .N15(pi[10]),
    .N16(pi[11]),
    .N19(pi[12]),
    .N20(pi[13]),
    .N21(pi[14]),
    .N22(pi[15]),
    .N23(pi[16]),
    .N24(pi[17]),
    .N25(pi[18]),
    .N26(pi[19]),
    .N27(pi[20]),
    .N28(pi[21]),
    .N29(pi[22]),
    .N32(pi[23]),
    .N33(pi[24]),
    .N34(pi[25]),
    .N35(pi[26]),
    .N36(pi[27]),
    .N37(pi[28]),
    .N40(pi[29]),
    .N43(pi[30]),
    .N44(pi[31]),
    .N47(pi[32]),
    .N48(pi[33]),
    .N49(pi[34]),
    .N50(pi[35]),
    .N51(pi[36]),
    .N52(pi[37]),
    .N53(pi[38]),
    .N54(pi[39]),
    .N55(pi[40]),
    .N56(pi[41]),
    .N57(pi[42]),
    .N60(pi[43]),
    .N61(pi[44]),
    .N62(pi[45]),
    .N63(pi[46]),
    .N64(pi[47]),
    .N65(pi[48]),
    .N66(pi[49]),
    .N67(pi[50]),
    .N68(pi[51]),
    .N69(pi[52]),
    .N72(pi[53]),
    .N73(pi[54]),
    .N74(pi[55]),
    .N75(pi[56]),
    .N76(pi[57]),
    .N77(pi[58]),
    .N78(pi[59]),
    .N79(pi[60]),
    .N80(pi[61]),
    .N81(pi[62]),
    .N82(pi[63]),
    .N85(pi[64]),
    .N86(pi[65]),
    .N87(pi[66]),
    .N88(pi[67]),
    .N89(pi[68]),
    .N90(pi[69]),
    .N91(pi[70]),
    .N92(pi[71]),
    .N93(pi[72]),
    .N94(pi[73]),
    .N95(pi[74]),
    .N96(pi[75]),
    .N99(pi[76]),
    .N100(pi[77]),
    .N101(pi[78]),
    .N102(pi[79]),
    .N103(pi[80]),
    .N104(pi[81]),
    .N105(pi[82]),
    .N106(pi[83]),
    .N107(pi[84]),
    .N108(pi[85]),
    .N111(pi[86]),
    .N112(pi[87]),
    .N113(pi[88]),
    .N114(pi[89]),
    .N115(pi[90]),
    .N116(pi[91]),
    .N117(pi[92]),
    .N118(pi[93]),
    .N119(pi[94]),
    .N120(pi[95]),
    .N123(pi[96]),
    .N124(pi[97]),
    .N125(pi[98]),
    .N126(pi[99]),
    .N127(pi[100]),
    .N128(pi[101]),
    .N129(pi[102]),
    .N130(pi[103]),
    .N131(pi[104]),
    .N132(pi[105]),
    .N135(pi[106]),
    .N136(pi[107]),
    .N137(pi[108]),
    .N138(pi[109]),
    .N139(pi[110]),
    .N140(pi[111]),
    .N141(pi[112]),
    .N142(pi[113]),
    .N219(pi[114]),
    .N224(pi[115]),
    .N227(pi[116]),
    .N230(pi[117]),
    .N231(pi[118]),
    .N234(pi[119]),
    .N237(pi[120]),
    .N241(pi[121]),
    .N246(pi[122]),
    .N253(pi[123]),
    .N256(pi[124]),
    .N259(pi[125]),
    .N262(pi[126]),
    .N263(pi[127]),
    .N266(pi[128]),
    .N269(pi[129]),
    .N272(pi[130]),
    .N275(pi[131]),
    .N278(pi[132]),
    .N281(pi[133]),
    .N284(pi[134]),
    .N287(pi[135]),
    .N290(pi[136]),
    .N294(pi[137]),
    .N297(pi[138]),
    .N301(pi[139]),
    .N305(pi[140]),
    .N309(pi[141]),
    .N313(pi[142]),
    .N316(pi[143]),
    .N319(pi[144]),
    .N322(pi[145]),
    .N325(pi[146]),
    .N328(pi[147]),
    .N331(pi[148]),
    .N334(pi[149]),
    .N337(pi[150]),
    .N340(pi[151]),
    .N343(pi[152]),
    .N346(pi[153]),
    .N349(pi[154]),
    .N352(pi[155]),
    .N355(pi[156]),
    .N143_I(pi[157]),
    .N144_I(pi[158]),
    .N145_I(pi[159]),
    .N146_I(pi[160]),
    .N147_I(pi[161]),
    .N148_I(pi[162]),
    .N149_I(pi[163]),
    .N150_I(pi[164]),
    .N151_I(pi[165]),
    .N152_I(pi[166]),
    .N153_I(pi[167]),
    .N154_I(pi[168]),
    .N155_I(pi[169]),
    .N156_I(pi[170]),
    .N157_I(pi[171]),
    .N158_I(pi[172]),
    .N159_I(pi[173]),
    .N160_I(pi[174]),
    .N161_I(pi[175]),
    .N162_I(pi[176]),
    .N163_I(pi[177]),
    .N164_I(pi[178]),
    .N165_I(pi[179]),
    .N166_I(pi[180]),
    .N167_I(pi[181]),
    .N168_I(pi[182]),
    .N169_I(pi[183]),
    .N170_I(pi[184]),
    .N171_I(pi[185]),
    .N172_I(pi[186]),
    .N173_I(pi[187]),
    .N174_I(pi[188]),
    .N175_I(pi[189]),
    .N176_I(pi[190]),
    .N177_I(pi[191]),
    .N178_I(pi[192]),
    .N179_I(pi[193]),
    .N180_I(pi[194]),
    .N181_I(pi[195]),
    .N182_I(pi[196]),
    .N183_I(pi[197]),
    .N184_I(pi[198]),
    .N185_I(pi[199]),
    .N186_I(pi[200]),
    .N187_I(pi[201]),
    .N188_I(pi[202]),
    .N189_I(pi[203]),
    .N190_I(pi[204]),
    .N191_I(pi[205]),
    .N192_I(pi[206]),
    .N193_I(pi[207]),
    .N194_I(pi[208]),
    .N195_I(pi[209]),
    .N196_I(pi[210]),
    .N197_I(pi[211]),
    .N198_I(pi[212]),
    .N199_I(pi[213]),
    .N200_I(pi[214]),
    .N201_I(pi[215]),
    .N202_I(pi[216]),
    .N203_I(pi[217]),
    .N204_I(pi[218]),
    .N205_I(pi[219]),
    .N206_I(pi[220]),
    .N207_I(pi[221]),
    .N208_I(pi[222]),
    .N209_I(pi[223]),
    .N210_I(pi[224]),
    .N211_I(pi[225]),
    .N212_I(pi[226]),
    .N213_I(pi[227]),
    .N214_I(pi[228]),
    .N215_I(pi[229]),
    .N216_I(pi[230]),
    .N217_I(pi[231]),
    .N218_I(pi[232]),
    .N398(po[0]),
    .N400(po[1]),
    .N401(po[2]),
    .N419(po[3]),
    .N420(po[4]),
    .N456(po[5]),
    .N457(po[6]),
    .N458(po[7]),
    .N487(po[8]),
    .N488(po[9]),
    .N489(po[10]),
    .N490(po[11]),
    .N491(po[12]),
    .N492(po[13]),
    .N493(po[14]),
    .N494(po[15]),
    .N792(po[16]),
    .N799(po[17]),
    .N805(po[18]),
    .N1026(po[19]),
    .N1028(po[20]),
    .N1029(po[21]),
    .N1269(po[22]),
    .N1277(po[23]),
    .N1448(po[24]),
    .N1726(po[25]),
    .N1816(po[26]),
    .N1817(po[27]),
    .N1818(po[28]),
    .N1819(po[29]),
    .N1820(po[30]),
    .N1821(po[31]),
    .N1969(po[32]),
    .N1970(po[33]),
    .N1971(po[34]),
    .N2010(po[35]),
    .N2012(po[36]),
    .N2014(po[37]),
    .N2016(po[38]),
    .N2018(po[39]),
    .N2020(po[40]),
    .N2022(po[41]),
    .N2387(po[42]),
    .N2388(po[43]),
    .N2389(po[44]),
    .N2390(po[45]),
    .N2496(po[46]),
    .N2643(po[47]),
    .N2644(po[48]),
    .N2891(po[49]),
    .N2925(po[50]),
    .N2970(po[51]),
    .N2971(po[52]),
    .N3038(po[53]),
    .N3079(po[54]),
    .N3546(po[55]),
    .N3671(po[56]),
    .N3803(po[57]),
    .N3804(po[58]),
    .N3809(po[59]),
    .N3851(po[60]),
    .N3875(po[61]),
    .N3881(po[62]),
    .N3882(po[63]),
    .N143_O(po[64]),
    .N144_O(po[65]),
    .N145_O(po[66]),
    .N146_O(po[67]),
    .N147_O(po[68]),
    .N148_O(po[69]),
    .N149_O(po[70]),
    .N150_O(po[71]),
    .N151_O(po[72]),
    .N152_O(po[73]),
    .N153_O(po[74]),
    .N154_O(po[75]),
    .N155_O(po[76]),
    .N156_O(po[77]),
    .N157_O(po[78]),
    .N158_O(po[79]),
    .N159_O(po[80]),
    .N160_O(po[81]),
    .N161_O(po[82]),
    .N162_O(po[83]),
    .N163_O(po[84]),
    .N164_O(po[85]),
    .N165_O(po[86]),
    .N166_O(po[87]),
    .N167_O(po[88]),
    .N168_O(po[89]),
    .N169_O(po[90]),
    .N170_O(po[91]),
    .N171_O(po[92]),
    .N172_O(po[93]),
    .N173_O(po[94]),
    .N174_O(po[95]),
    .N175_O(po[96]),
    .N176_O(po[97]),
    .N177_O(po[98]),
    .N178_O(po[99]),
    .N179_O(po[100]),
    .N180_O(po[101]),
    .N181_O(po[102]),
    .N182_O(po[103]),
    .N183_O(po[104]),
    .N184_O(po[105]),
    .N185_O(po[106]),
    .N186_O(po[107]),
    .N187_O(po[108]),
    .N188_O(po[109]),
    .N189_O(po[110]),
    .N190_O(po[111]),
    .N191_O(po[112]),
    .N192_O(po[113]),
    .N193_O(po[114]),
    .N194_O(po[115]),
    .N195_O(po[116]),
    .N196_O(po[117]),
    .N197_O(po[118]),
    .N198_O(po[119]),
    .N199_O(po[120]),
    .N200_O(po[121]),
    .N201_O(po[122]),
    .N202_O(po[123]),
    .N203_O(po[124]),
    .N204_O(po[125]),
    .N205_O(po[126]),
    .N206_O(po[127]),
    .N207_O(po[128]),
    .N208_O(po[129]),
    .N209_O(po[130]),
    .N210_O(po[131]),
    .N211_O(po[132]),
    .N212_O(po[133]),
    .N213_O(po[134]),
    .N214_O(po[135]),
    .N215_O(po[136]),
    .N216_O(po[137]),
    .N217_O(po[138]),
    .N218_O(po[139])
  );

  initial begin
    $dumpfile("c2670.vcd"); $dumpvars(0, tb_c2670);
    $display("================================================================================");
    $display("[START] Running Gate-Level Trojan Activation Testbench: C2670 (%0d patterns)", NUM_PATS);
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
    $display("[DONE] Simulation Complete. Total Unique Trojans Triggered: %0d / 199", hit_count);
    $display("================================================================================");
    $finish;
  end

  task check_trojans;
    begin
      if (dut.N1064 === 1'b1) begin
        if (!hit_recorded[0]) begin
          hit_recorded[0] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 0);
        end
      end
      if (dut.N3489 === 1'b0) begin
        if (!hit_recorded[1]) begin
          hit_recorded[1] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 1);
        end
      end
      if (dut.N3875 === 1'b1) begin
        if (!hit_recorded[2]) begin
          hit_recorded[2] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 2);
        end
      end
      if (dut.N3552 === 1'b1) begin
        if (!hit_recorded[3]) begin
          hit_recorded[3] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 3);
        end
      end
      if (dut.N3482 === 1'b0) begin
        if (!hit_recorded[4]) begin
          hit_recorded[4] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 4);
        end
      end
      if (dut.N2975 === 1'b0) begin
        if (!hit_recorded[5]) begin
          hit_recorded[5] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 5);
        end
      end
      if (dut.N2894 === 1'b1) begin
        if (!hit_recorded[6]) begin
          hit_recorded[6] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 6);
        end
      end
      if (dut.N3293 === 1'b1) begin
        if (!hit_recorded[7]) begin
          hit_recorded[7] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 7);
        end
      end
      if (dut.N3555 === 1'b1) begin
        if (!hit_recorded[8]) begin
          hit_recorded[8] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 8);
        end
      end
      if (dut.N3736 === 1'b1) begin
        if (!hit_recorded[9]) begin
          hit_recorded[9] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 9);
        end
      end
      if (dut.N1489 === 1'b1) begin
        if (!hit_recorded[10]) begin
          hit_recorded[10] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 10);
        end
      end
      if (dut.N1785 === 1'b1) begin
        if (!hit_recorded[11]) begin
          hit_recorded[11] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 11);
        end
      end
      if (dut.N3882 === 1'b0) begin
        if (!hit_recorded[12]) begin
          hit_recorded[12] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 12);
        end
      end
      if (dut.N3694 === 1'b0) begin
        if (!hit_recorded[13]) begin
          hit_recorded[13] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 13);
        end
      end
      if (dut.N1488 === 1'b1) begin
        if (!hit_recorded[14]) begin
          hit_recorded[14] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 14);
        end
      end
      if (dut.N1448 === 1'b0) begin
        if (!hit_recorded[15]) begin
          hit_recorded[15] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 15);
        end
      end
      if (dut.N1277 === 1'b1) begin
        if (!hit_recorded[16]) begin
          hit_recorded[16] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 16);
        end
      end
      if (dut.N3881 === 1'b1) begin
        if (!hit_recorded[17]) begin
          hit_recorded[17] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 17);
        end
      end
      if (dut.N3818 === 1'b0) begin
        if (!hit_recorded[18]) begin
          hit_recorded[18] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 18);
        end
      end
      if (dut.N3146 === 1'b1) begin
        if (!hit_recorded[19]) begin
          hit_recorded[19] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 19);
        end
      end
      if (dut.N1536 === 1'b1) begin
        if (!hit_recorded[20]) begin
          hit_recorded[20] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 20);
        end
      end
      if (dut.N2032 === 1'b1) begin
        if (!hit_recorded[21]) begin
          hit_recorded[21] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 21);
        end
      end
      if (dut.N3193 === 1'b1) begin
        if (!hit_recorded[22]) begin
          hit_recorded[22] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 22);
        end
      end
      if (dut.N1068 === 1'b1) begin
        if (!hit_recorded[23]) begin
          hit_recorded[23] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 23);
        end
      end
      if (dut.n_391 === 1'b1) begin
        if (!hit_recorded[24]) begin
          hit_recorded[24] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 24);
        end
      end
      if (dut.N2938 === 1'b1) begin
        if (!hit_recorded[25]) begin
          hit_recorded[25] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 25);
        end
      end
      if (dut.N3554 === 1'b1) begin
        if (!hit_recorded[26]) begin
          hit_recorded[26] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 26);
        end
      end
      if (dut.N1463 === 1'b1) begin
        if (!hit_recorded[27]) begin
          hit_recorded[27] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 27);
        end
      end
      if (dut.N3301 === 1'b1) begin
        if (!hit_recorded[28]) begin
          hit_recorded[28] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 28);
        end
      end
      if (dut.N1454 === 1'b1) begin
        if (!hit_recorded[29]) begin
          hit_recorded[29] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 29);
        end
      end
      if (dut.N2840 === 1'b1) begin
        if (!hit_recorded[30]) begin
          hit_recorded[30] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 30);
        end
      end
      if (dut.N3152 === 1'b1) begin
        if (!hit_recorded[31]) begin
          hit_recorded[31] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 31);
        end
      end
      if (dut.N2155 === 1'b1) begin
        if (!hit_recorded[32]) begin
          hit_recorded[32] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 32);
        end
      end
      if (dut.n_395 === 1'b1) begin
        if (!hit_recorded[33]) begin
          hit_recorded[33] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 33);
        end
      end
      if (dut.N1486 === 1'b1) begin
        if (!hit_recorded[34]) begin
          hit_recorded[34] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 34);
        end
      end
      if (dut.N3191 === 1'b1) begin
        if (!hit_recorded[35]) begin
          hit_recorded[35] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 35);
        end
      end
      if (dut.N1473 === 1'b1) begin
        if (!hit_recorded[36]) begin
          hit_recorded[36] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 36);
        end
      end
      if (dut.N1971 === 1'b0) begin
        if (!hit_recorded[37]) begin
          hit_recorded[37] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 37);
        end
      end
      if (dut.N495 === 1'b1) begin
        if (!hit_recorded[38]) begin
          hit_recorded[38] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 38);
        end
      end
      if (dut.N1490 === 1'b1) begin
        if (!hit_recorded[39]) begin
          hit_recorded[39] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 39);
        end
      end
      if (dut.N2250 === 1'b1) begin
        if (!hit_recorded[40]) begin
          hit_recorded[40] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 40);
        end
      end
      if (dut.N1543 === 1'b1) begin
        if (!hit_recorded[41]) begin
          hit_recorded[41] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 41);
        end
      end
      if (dut.N2839 === 1'b1) begin
        if (!hit_recorded[42]) begin
          hit_recorded[42] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 42);
        end
      end
      if (dut.N1822 === 1'b1) begin
        if (!hit_recorded[43]) begin
          hit_recorded[43] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 43);
        end
      end
      if (dut.N1480 === 1'b1) begin
        if (!hit_recorded[44]) begin
          hit_recorded[44] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 44);
        end
      end
      if (dut.N1491 === 1'b1) begin
        if (!hit_recorded[45]) begin
          hit_recorded[45] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 45);
        end
      end
      if (dut.N3149 === 1'b1) begin
        if (!hit_recorded[46]) begin
          hit_recorded[46] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 46);
        end
      end
      if (dut.N3807 === 1'b1) begin
        if (!hit_recorded[47]) begin
          hit_recorded[47] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 47);
        end
      end
      if (dut.N1472 === 1'b1) begin
        if (!hit_recorded[48]) begin
          hit_recorded[48] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 48);
        end
      end
      if (dut.N1459 === 1'b1) begin
        if (!hit_recorded[49]) begin
          hit_recorded[49] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 49);
        end
      end
      if (dut.N3291 === 1'b1) begin
        if (!hit_recorded[50]) begin
          hit_recorded[50] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 50);
        end
      end
      if (dut.N1456 === 1'b1) begin
        if (!hit_recorded[51]) begin
          hit_recorded[51] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 51);
        end
      end
      if (dut.N3197 === 1'b1) begin
        if (!hit_recorded[52]) begin
          hit_recorded[52] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 52);
        end
      end
      if (dut.N1465 === 1'b1) begin
        if (!hit_recorded[53]) begin
          hit_recorded[53] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 53);
        end
      end
      if (dut.N2897 === 1'b1) begin
        if (!hit_recorded[54]) begin
          hit_recorded[54] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 54);
        end
      end
      if (dut.N1535 === 1'b1) begin
        if (!hit_recorded[55]) begin
          hit_recorded[55] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 55);
        end
      end
      if (dut.N3779 === 1'b1) begin
        if (!hit_recorded[56]) begin
          hit_recorded[56] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 56);
        end
      end
      if (dut.N2612 === 1'b1) begin
        if (!hit_recorded[57]) begin
          hit_recorded[57] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 57);
        end
      end
      if (dut.N1531 === 1'b1) begin
        if (!hit_recorded[58]) begin
          hit_recorded[58] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 58);
        end
      end
      if (dut.N2972 === 1'b0) begin
        if (!hit_recorded[59]) begin
          hit_recorded[59] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 59);
        end
      end
      if (dut.N2981 === 1'b0) begin
        if (!hit_recorded[60]) begin
          hit_recorded[60] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 60);
        end
      end
      if (dut.N1532 === 1'b1) begin
        if (!hit_recorded[61]) begin
          hit_recorded[61] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 61);
        end
      end
      if (dut.N799 === 1'b0) begin
        if (!hit_recorded[62]) begin
          hit_recorded[62] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 62);
        end
      end
      if (dut.N1970 === 1'b0) begin
        if (!hit_recorded[63]) begin
          hit_recorded[63] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 63);
        end
      end
      if (dut.N2158 === 1'b1) begin
        if (!hit_recorded[64]) begin
          hit_recorded[64] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 64);
        end
      end
      if (dut.N1909 === 1'b1) begin
        if (!hit_recorded[65]) begin
          hit_recorded[65] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 65);
        end
      end
      if (dut.N1481 === 1'b1) begin
        if (!hit_recorded[66]) begin
          hit_recorded[66] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 66);
        end
      end
      if (dut.N1487 === 1'b1) begin
        if (!hit_recorded[67]) begin
          hit_recorded[67] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 67);
        end
      end
      if (dut.N547 === 1'b1) begin
        if (!hit_recorded[68]) begin
          hit_recorded[68] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 68);
        end
      end
      if (dut.N1470 === 1'b1) begin
        if (!hit_recorded[69]) begin
          hit_recorded[69] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 69);
        end
      end
      if (dut.N2043 === 1'b1) begin
        if (!hit_recorded[70]) begin
          hit_recorded[70] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 70);
        end
      end
      if (dut.N1458 === 1'b1) begin
        if (!hit_recorded[71]) begin
          hit_recorded[71] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 71);
        end
      end
      if (dut.N1478 === 1'b1) begin
        if (!hit_recorded[72]) begin
          hit_recorded[72] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 72);
        end
      end
      if (dut.N3838 === 1'b1) begin
        if (!hit_recorded[73]) begin
          hit_recorded[73] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 73);
        end
      end
      if (dut.N3778 === 1'b1) begin
        if (!hit_recorded[74]) begin
          hit_recorded[74] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 74);
        end
      end
      if (dut.N2939 === 1'b1) begin
        if (!hit_recorded[75]) begin
          hit_recorded[75] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 75);
        end
      end
      if (dut.N1534 === 1'b1) begin
        if (!hit_recorded[76]) begin
          hit_recorded[76] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 76);
        end
      end
      if (dut.N1541 === 1'b1) begin
        if (!hit_recorded[77]) begin
          hit_recorded[77] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 77);
        end
      end
      if (dut.N3734 === 1'b1) begin
        if (!hit_recorded[78]) begin
          hit_recorded[78] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 78);
        end
      end
      if (dut.N3817 === 1'b1) begin
        if (!hit_recorded[79]) begin
          hit_recorded[79] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 79);
        end
      end
      if (dut.N1171 === 1'b1) begin
        if (!hit_recorded[80]) begin
          hit_recorded[80] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 80);
        end
      end
      if (dut.N2611 === 1'b1) begin
        if (!hit_recorded[81]) begin
          hit_recorded[81] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 81);
        end
      end
      if (dut.N3143 === 1'b1) begin
        if (!hit_recorded[82]) begin
          hit_recorded[82] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 82);
        end
      end
      if (dut.N1098 === 1'b1) begin
        if (!hit_recorded[83]) begin
          hit_recorded[83] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 83);
        end
      end
      if (dut.N1124 === 1'b1) begin
        if (!hit_recorded[84]) begin
          hit_recorded[84] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 84);
        end
      end
      if (dut.N2157 === 1'b1) begin
        if (!hit_recorded[85]) begin
          hit_recorded[85] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 85);
        end
      end
      if (dut.N1468 === 1'b1) begin
        if (!hit_recorded[86]) begin
          hit_recorded[86] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 86);
        end
      end
      if (dut.N544 === 1'b1) begin
        if (!hit_recorded[87]) begin
          hit_recorded[87] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 87);
        end
      end
      if (dut.N1099 === 1'b1) begin
        if (!hit_recorded[88]) begin
          hit_recorded[88] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 88);
        end
      end
      if (dut.N1467 === 1'b1) begin
        if (!hit_recorded[89]) begin
          hit_recorded[89] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 89);
        end
      end
      if (dut.N1464 === 1'b1) begin
        if (!hit_recorded[90]) begin
          hit_recorded[90] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 90);
        end
      end
      if (dut.N2963 === 1'b0) begin
        if (!hit_recorded[91]) begin
          hit_recorded[91] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 91);
        end
      end
      if (dut.N2772 === 1'b0) begin
        if (!hit_recorded[92]) begin
          hit_recorded[92] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 92);
        end
      end
      if (dut.N1477 === 1'b1) begin
        if (!hit_recorded[93]) begin
          hit_recorded[93] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 93);
        end
      end
      if (dut.N1483 === 1'b1) begin
        if (!hit_recorded[94]) begin
          hit_recorded[94] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 94);
        end
      end
      if (dut.N1125 === 1'b1) begin
        if (!hit_recorded[95]) begin
          hit_recorded[95] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 95);
        end
      end
      if (dut.N1475 === 1'b1) begin
        if (!hit_recorded[96]) begin
          hit_recorded[96] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 96);
        end
      end
      if (dut.N1029 === 1'b0) begin
        if (!hit_recorded[97]) begin
          hit_recorded[97] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 97);
        end
      end
      if (dut.N3487 === 1'b0) begin
        if (!hit_recorded[98]) begin
          hit_recorded[98] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 98);
        end
      end
      if (dut.N3038 === 1'b1) begin
        if (!hit_recorded[99]) begin
          hit_recorded[99] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 99);
        end
      end
      if (dut.N1485 === 1'b1) begin
        if (!hit_recorded[100]) begin
          hit_recorded[100] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 100);
        end
      end
      if (dut.N485 === 1'b1) begin
        if (!hit_recorded[101]) begin
          hit_recorded[101] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 101);
        end
      end
      if (dut.N1539 === 1'b1) begin
        if (!hit_recorded[102]) begin
          hit_recorded[102] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 102);
        end
      end
      if (dut.N1067 === 1'b1) begin
        if (!hit_recorded[103]) begin
          hit_recorded[103] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 103);
        end
      end
      if (dut.N3735 === 1'b1) begin
        if (!hit_recorded[104]) begin
          hit_recorded[104] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 104);
        end
      end
      if (dut.N3603 === 1'b0) begin
        if (!hit_recorded[105]) begin
          hit_recorded[105] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 105);
        end
      end
      if (dut.N2177 === 1'b1) begin
        if (!hit_recorded[106]) begin
          hit_recorded[106] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 106);
        end
      end
      if (dut.N1484 === 1'b1) begin
        if (!hit_recorded[107]) begin
          hit_recorded[107] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 107);
        end
      end
      if (dut.N1101 === 1'b1) begin
        if (!hit_recorded[108]) begin
          hit_recorded[108] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 108);
        end
      end
      if (dut.N1529 === 1'b1) begin
        if (!hit_recorded[109]) begin
          hit_recorded[109] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 109);
        end
      end
      if (dut.N2978 === 1'b0) begin
        if (!hit_recorded[110]) begin
          hit_recorded[110] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 110);
        end
      end
      if (dut.N3553 === 1'b1) begin
        if (!hit_recorded[111]) begin
          hit_recorded[111] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 111);
        end
      end
      if (dut.N1066 === 1'b1) begin
        if (!hit_recorded[112]) begin
          hit_recorded[112] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 112);
        end
      end
      if (dut.N1065 === 1'b1) begin
        if (!hit_recorded[113]) begin
          hit_recorded[113] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 113);
        end
      end
      if (dut.N3222 === 1'b1) begin
        if (!hit_recorded[114]) begin
          hit_recorded[114] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 114);
        end
      end
      if (dut.N3483 === 1'b0) begin
        if (!hit_recorded[115]) begin
          hit_recorded[115] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 115);
        end
      end
      if (dut.N2033 === 1'b1) begin
        if (!hit_recorded[116]) begin
          hit_recorded[116] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 116);
        end
      end
      if (dut.N1482 === 1'b1) begin
        if (!hit_recorded[117]) begin
          hit_recorded[117] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 117);
        end
      end
      if (dut.N1533 === 1'b1) begin
        if (!hit_recorded[118]) begin
          hit_recorded[118] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 118);
        end
      end
      if (dut.N1460 === 1'b1) begin
        if (!hit_recorded[119]) begin
          hit_recorded[119] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 119);
        end
      end
      if (dut.N1452 === 1'b1) begin
        if (!hit_recorded[120]) begin
          hit_recorded[120] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 120);
        end
      end
      if (dut.N1530 === 1'b1) begin
        if (!hit_recorded[121]) begin
          hit_recorded[121] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 121);
        end
      end
      if (dut.N3762 === 1'b1) begin
        if (!hit_recorded[122]) begin
          hit_recorded[122] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 122);
        end
      end
      if (dut.N3615 === 1'b0) begin
        if (!hit_recorded[123]) begin
          hit_recorded[123] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 123);
        end
      end
      if (dut.N3282 === 1'b1) begin
        if (!hit_recorded[124]) begin
          hit_recorded[124] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 124);
        end
      end
      if (dut.N1535 === 1'b1 && dut.N3301 === 1'b1) begin
        if (!hit_recorded[125]) begin
          hit_recorded[125] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 125);
        end
      end
      if (dut.N1784 === 1'b1 && dut.N1277 === 1'b1) begin
        if (!hit_recorded[126]) begin
          hit_recorded[126] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 126);
        end
      end
      if (dut.N3881 === 1'b1 && dut.N2897 === 1'b1) begin
        if (!hit_recorded[127]) begin
          hit_recorded[127] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 127);
        end
      end
      if (dut.N3615 === 1'b0 && dut.N1277 === 1'b1) begin
        if (!hit_recorded[128]) begin
          hit_recorded[128] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 128);
        end
      end
      if (dut.N1101 === 1'b1 && dut.N1483 === 1'b1) begin
        if (!hit_recorded[129]) begin
          hit_recorded[129] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 129);
        end
      end
      if (dut.N2894 === 1'b1 && dut.N1277 === 1'b1) begin
        if (!hit_recorded[130]) begin
          hit_recorded[130] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 130);
        end
      end
      if (dut.N3483 === 1'b0 && dut.N2250 === 1'b1) begin
        if (!hit_recorded[131]) begin
          hit_recorded[131] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 131);
        end
      end
      if (dut.N1479 === 1'b1 && dut.N1971 === 1'b0) begin
        if (!hit_recorded[132]) begin
          hit_recorded[132] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 132);
        end
      end
      if (dut.N2938 === 1'b1 && dut.N2250 === 1'b1) begin
        if (!hit_recorded[133]) begin
          hit_recorded[133] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 133);
        end
      end
      if (dut.N2113 === 1'b1 && dut.N1473 === 1'b1) begin
        if (!hit_recorded[134]) begin
          hit_recorded[134] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 134);
        end
      end
      if (dut.N1534 === 1'b1 && dut.N3193 === 1'b1) begin
        if (!hit_recorded[135]) begin
          hit_recorded[135] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 135);
        end
      end
      if (dut.N1479 === 1'b1 && dut.N1656 === 1'b0) begin
        if (!hit_recorded[136]) begin
          hit_recorded[136] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 136);
        end
      end
      if (dut.N1465 === 1'b1 && dut.N3778 === 1'b1) begin
        if (!hit_recorded[137]) begin
          hit_recorded[137] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 137);
        end
      end
      if (dut.N1463 === 1'b1 && dut.N2938 === 1'b1) begin
        if (!hit_recorded[138]) begin
          hit_recorded[138] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 138);
        end
      end
      if (dut.N2897 === 1'b1 && dut.N3818 === 1'b0) begin
        if (!hit_recorded[139]) begin
          hit_recorded[139] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 139);
        end
      end
      if (dut.N1033 === 1'b0 && dut.N3484 === 1'b0) begin
        if (!hit_recorded[140]) begin
          hit_recorded[140] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 140);
        end
      end
      if (dut.N1487 === 1'b1 && dut.N1032 === 1'b0) begin
        if (!hit_recorded[141]) begin
          hit_recorded[141] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 141);
        end
      end
      if (dut.N3735 === 1'b1 && dut.n_393 === 1'b1) begin
        if (!hit_recorded[142]) begin
          hit_recorded[142] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 142);
        end
      end
      if (dut.N1471 === 1'b1 && dut.N1461 === 1'b1) begin
        if (!hit_recorded[143]) begin
          hit_recorded[143] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 143);
        end
      end
      if (dut.N1539 === 1'b1 && dut.N2033 === 1'b1) begin
        if (!hit_recorded[144]) begin
          hit_recorded[144] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 144);
        end
      end
      if (dut.N3296 === 1'b1 && dut.N1908 === 1'b1) begin
        if (!hit_recorded[145]) begin
          hit_recorded[145] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 145);
        end
      end
      if (dut.N1466 === 1'b1 && dut.N1823 === 1'b1) begin
        if (!hit_recorded[146]) begin
          hit_recorded[146] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 146);
        end
      end
      if (dut.n_394 === 1'b1 && dut.N1467 === 1'b1) begin
        if (!hit_recorded[147]) begin
          hit_recorded[147] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 147);
        end
      end
      if (dut.N3838 === 1'b1 && dut.N1480 === 1'b1) begin
        if (!hit_recorded[148]) begin
          hit_recorded[148] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 148);
        end
      end
      if (dut.N2611 === 1'b1 && dut.N1097 === 1'b1) begin
        if (!hit_recorded[149]) begin
          hit_recorded[149] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 149);
        end
      end
      if (dut.N3818 === 1'b0 && dut.N3603 === 1'b0 && dut.N3554 === 1'b1) begin
        if (!hit_recorded[150]) begin
          hit_recorded[150] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 150);
        end
      end
      if (dut.N2972 === 1'b0 && dut.N3293 === 1'b1 && dut.N1539 === 1'b1) begin
        if (!hit_recorded[151]) begin
          hit_recorded[151] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 151);
        end
      end
      if (dut.N1269 === 1'b0 && dut.N2963 === 1'b0 && dut.N2939 === 1'b1) begin
        if (!hit_recorded[152]) begin
          hit_recorded[152] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 152);
        end
      end
      if (dut.N3194 === 1'b1 && dut.N799 === 1'b0 && dut.N1532 === 1'b1) begin
        if (!hit_recorded[153]) begin
          hit_recorded[153] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 153);
        end
      end
      if (dut.N1908 === 1'b1 && dut.N544 === 1'b1 && dut.N1656 === 1'b0) begin
        if (!hit_recorded[154]) begin
          hit_recorded[154] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 154);
        end
      end
      if (dut.N2158 === 1'b1 && dut.N1454 === 1'b1 && dut.N2359 === 1'b0) begin
        if (!hit_recorded[155]) begin
          hit_recorded[155] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 155);
        end
      end
      if (dut.N1454 === 1'b1 && dut.N1540 === 1'b1 && dut.N1479 === 1'b1) begin
        if (!hit_recorded[156]) begin
          hit_recorded[156] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 156);
        end
      end
      if (dut.N3491 === 1'b0 && dut.N1533 === 1'b1 && dut.N1473 === 1'b1) begin
        if (!hit_recorded[157]) begin
          hit_recorded[157] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 157);
        end
      end
      if (dut.N1066 === 1'b1 && dut.N3489 === 1'b0 && dut.N3807 === 1'b1) begin
        if (!hit_recorded[158]) begin
          hit_recorded[158] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 158);
        end
      end
      if (dut.N1466 === 1'b1 && dut.N1536 === 1'b1 && dut.N2894 === 1'b1) begin
        if (!hit_recorded[159]) begin
          hit_recorded[159] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 159);
        end
      end
      if (dut.N3152 === 1'b1 && dut.N3553 === 1'b1 && dut.N2178 === 1'b1) begin
        if (!hit_recorded[160]) begin
          hit_recorded[160] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 160);
        end
      end
      if (dut.N3807 === 1'b1 && dut.N799 === 1'b0 && dut.N1543 === 1'b1) begin
        if (!hit_recorded[161]) begin
          hit_recorded[161] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 161);
        end
      end
      if (dut.N1784 === 1'b1 && dut.N1065 === 1'b1 && dut.N1475 === 1'b1) begin
        if (!hit_recorded[162]) begin
          hit_recorded[162] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 162);
        end
      end
      if (dut.N547 === 1'b1 && dut.N1529 === 1'b1 && dut.N3808 === 1'b1) begin
        if (!hit_recorded[163]) begin
          hit_recorded[163] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 163);
        end
      end
      if (dut.N2177 === 1'b1 && dut.N1066 === 1'b1 && dut.N3146 === 1'b1) begin
        if (!hit_recorded[164]) begin
          hit_recorded[164] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 164);
        end
      end
      if (dut.N799 === 1'b0 && dut.N3807 === 1'b1 && dut.N3762 === 1'b1) begin
        if (!hit_recorded[165]) begin
          hit_recorded[165] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 165);
        end
      end
      if (dut.N3283 === 1'b1 && dut.n_391 === 1'b1 && dut.N3149 === 1'b1) begin
        if (!hit_recorded[166]) begin
          hit_recorded[166] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 166);
        end
      end
      if (dut.N3818 === 1'b0 && dut.n_390 === 1'b1 && dut.N3692 === 1'b0) begin
        if (!hit_recorded[167]) begin
          hit_recorded[167] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 167);
        end
      end
      if (dut.N2158 === 1'b1 && dut.N3222 === 1'b1 && dut.N2896 === 1'b1) begin
        if (!hit_recorded[168]) begin
          hit_recorded[168] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 168);
        end
      end
      if (dut.N1099 === 1'b1 && dut.N1452 === 1'b1 && dut.N3692 === 1'b0) begin
        if (!hit_recorded[169]) begin
          hit_recorded[169] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 169);
        end
      end
      if (dut.N1468 === 1'b1 && dut.N2981 === 1'b0 && dut.N1491 === 1'b1) begin
        if (!hit_recorded[170]) begin
          hit_recorded[170] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 170);
        end
      end
      if (dut.N3733 === 1'b1 && dut.N1100 === 1'b1 && dut.N1066 === 1'b1) begin
        if (!hit_recorded[171]) begin
          hit_recorded[171] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 171);
        end
      end
      if (dut.N1098 === 1'b1 && dut.N3488 === 1'b0 && dut.N1100 === 1'b1) begin
        if (!hit_recorded[172]) begin
          hit_recorded[172] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 172);
        end
      end
      if (dut.N799 === 1'b0 && dut.N1485 === 1'b1 && dut.N3735 === 1'b1) begin
        if (!hit_recorded[173]) begin
          hit_recorded[173] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 173);
        end
      end
      if (dut.N1458 === 1'b1 && dut.N1822 === 1'b1 && dut.N1539 === 1'b1 && dut.N1171 === 1'b1) begin
        if (!hit_recorded[174]) begin
          hit_recorded[174] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 174);
        end
      end
      if (dut.N3283 === 1'b1 && dut.N547 === 1'b1 && dut.n_392 === 1'b1 && dut.N2032 === 1'b1) begin
        if (!hit_recorded[175]) begin
          hit_recorded[175] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 175);
        end
      end
      if (dut.n_394 === 1'b1 && dut.N1468 === 1'b1 && dut.N3818 === 1'b0 && dut.N3485 === 1'b0) begin
        if (!hit_recorded[176]) begin
          hit_recorded[176] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 176);
        end
      end
      if (dut.N1448 === 1'b0 && dut.N3079 === 1'b0 && dut.N1170 === 1'b1 && dut.N2975 === 1'b0) begin
        if (!hit_recorded[177]) begin
          hit_recorded[177] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 177);
        end
      end
      if (dut.N1532 === 1'b1 && dut.N3284 === 1'b1 && dut.N495 === 1'b1 && dut.N3489 === 1'b0) begin
        if (!hit_recorded[178]) begin
          hit_recorded[178] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 178);
        end
      end
      if (dut.N1459 === 1'b1 && dut.N2158 === 1'b1 && dut.N1908 === 1'b1 && dut.N1909 === 1'b1) begin
        if (!hit_recorded[179]) begin
          hit_recorded[179] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 179);
        end
      end
      if (dut.N3291 === 1'b1 && dut.N2896 === 1'b1 && dut.N3485 === 1'b0 && dut.N1127 === 1'b1) begin
        if (!hit_recorded[180]) begin
          hit_recorded[180] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 180);
        end
      end
      if (dut.N792 === 1'b0 && dut.N3223 === 1'b1 && dut.N2042 === 1'b1 && dut.N1126 === 1'b1) begin
        if (!hit_recorded[181]) begin
          hit_recorded[181] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 181);
        end
      end
      if (dut.N3818 === 1'b0 && dut.N1029 === 1'b0 && dut.N3192 === 1'b1 && dut.N1067 === 1'b1) begin
        if (!hit_recorded[182]) begin
          hit_recorded[182] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 182);
        end
      end
      if (dut.N2981 === 1'b0 && dut.N3615 === 1'b0 && dut.N3732 === 1'b1 && dut.N1531 === 1'b1) begin
        if (!hit_recorded[183]) begin
          hit_recorded[183] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 183);
        end
      end
      if (dut.N3194 === 1'b1 && dut.N3079 === 1'b0 && dut.N1124 === 1'b1 && dut.N1822 === 1'b1) begin
        if (!hit_recorded[184]) begin
          hit_recorded[184] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 184);
        end
      end
      if (dut.N2158 === 1'b1 && dut.N1481 === 1'b1 && dut.N3807 === 1'b1 && dut.N2975 === 1'b0) begin
        if (!hit_recorded[185]) begin
          hit_recorded[185] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 185);
        end
      end
      if (dut.N1172 === 1'b1 && dut.N1970 === 1'b0 && dut.N3281 === 1'b1 && dut.N3553 === 1'b1) begin
        if (!hit_recorded[186]) begin
          hit_recorded[186] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 186);
        end
      end
      if (dut.N2897 === 1'b1 && dut.n_395 === 1'b1 && dut.N2177 === 1'b1 && dut.N3293 === 1'b1) begin
        if (!hit_recorded[187]) begin
          hit_recorded[187] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 187);
        end
      end
      if (dut.N3216 === 1'b1 && dut.N3778 === 1'b1 && dut.N3552 === 1'b1 && dut.N1101 === 1'b1) begin
        if (!hit_recorded[188]) begin
          hit_recorded[188] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 188);
        end
      end
      if (dut.N3484 === 1'b0 && dut.N1909 === 1'b1 && dut.N3761 === 1'b1 && dut.N1538 === 1'b1) begin
        if (!hit_recorded[189]) begin
          hit_recorded[189] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 189);
        end
      end
      if (dut.N2177 === 1'b1 && dut.N495 === 1'b1 && dut.N3552 === 1'b1 && dut.N1032 === 1'b0) begin
        if (!hit_recorded[190]) begin
          hit_recorded[190] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 190);
        end
      end
      if (dut.N3191 === 1'b1 && dut.N2177 === 1'b1 && dut.N2840 === 1'b1 && dut.N1457 === 1'b1) begin
        if (!hit_recorded[191]) begin
          hit_recorded[191] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 191);
        end
      end
      if (dut.N1487 === 1'b1 && dut.N3555 === 1'b1 && dut.N3733 === 1'b1 && dut.N2359 === 1'b0) begin
        if (!hit_recorded[192]) begin
          hit_recorded[192] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 192);
        end
      end
      if (dut.N1469 === 1'b1 && dut.N1481 === 1'b1 && dut.N3193 === 1'b1 && dut.N1127 === 1'b1) begin
        if (!hit_recorded[193]) begin
          hit_recorded[193] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 193);
        end
      end
      if (dut.N2113 === 1'b1 && dut.N1542 === 1'b1 && dut.N1066 === 1'b1 && dut.N1469 === 1'b1) begin
        if (!hit_recorded[194]) begin
          hit_recorded[194] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 194);
        end
      end
      if (dut.N3488 === 1'b0 && dut.N1098 === 1'b1 && dut.N2896 === 1'b1 && dut.N2963 === 1'b0) begin
        if (!hit_recorded[195]) begin
          hit_recorded[195] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 195);
        end
      end
      if (dut.n_395 === 1'b1 && dut.N1529 === 1'b1 && dut.N1171 === 1'b1 && dut.N1536 === 1'b1) begin
        if (!hit_recorded[196]) begin
          hit_recorded[196] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 196);
        end
      end
      if (dut.N2839 === 1'b1 && dut.N1460 === 1'b1 && dut.N495 === 1'b1 && dut.N1823 === 1'b1) begin
        if (!hit_recorded[197]) begin
          hit_recorded[197] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 197);
        end
      end
      if (dut.N1029 === 1'b0 && dut.N1909 === 1'b1 && dut.N2611 === 1'b1 && dut.N1482 === 1'b1) begin
        if (!hit_recorded[198]) begin
          hit_recorded[198] = 1;
          hit_count = hit_count + 1;
          $display("HIT %0d", 198);
        end
      end
    end
  endtask

endmodule
