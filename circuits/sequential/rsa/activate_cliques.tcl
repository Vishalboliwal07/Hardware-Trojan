read_netlist /home/nanodcmaster/Synopsys/pdk/SCL_PDK_3/SCLPDK_V3.0_KIT/scl180/stdcell/fs120/6M1L/verilog/tmax_model/lib_flow_ss/verilog_udp.v -library
read_netlist /home/nanodcmaster/Synopsys/pdk/SCL_PDK_3/SCLPDK_V3.0_KIT/scl180/stdcell/fs120/6M1L/verilog/tmax_model/lib_flow_ss/verilog.v -library
read_netlist synthesised_scan.v
set_rules N17 ignore
set_rules N20 ignore
set_rules C4 ignore
run_build_model rsa
run_drc rsa_scan.spf
set_faults -model stuck
set_messages -nodisplay
set_commands noabort
catch {add_atpg_constraints mc_0_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_0_1 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_0_2 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_0_3 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_0.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_1_0 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_1_1 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_1_2 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_1_3 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_1.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_2_0 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_2_1 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_2_2 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_2_3 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_2.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_3_0 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_3_1 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_3_2 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_3_3 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_3.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_4_0 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_4_1 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_4_2 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_4_3 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_4.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_5_0 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_5_1 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_5_2 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_5_3 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_5.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_6_0 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_6_1 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_6_2 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_6_3 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_6.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_7_0 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_7_1 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_7_2 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
catch {add_atpg_constraints mc_7_3 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_7.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_8_0 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_8_1 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
catch {add_atpg_constraints mc_8_2 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
catch {add_atpg_constraints mc_8_3 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_8.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_9_0 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
catch {add_atpg_constraints mc_9_1 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
catch {add_atpg_constraints mc_9_2 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
catch {add_atpg_constraints mc_9_3 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_9.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_10_0 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
catch {add_atpg_constraints mc_10_1 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
catch {add_atpg_constraints mc_10_2 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
catch {add_atpg_constraints mc_10_3 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_10.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_11_0 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
catch {add_atpg_constraints mc_11_1 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
catch {add_atpg_constraints mc_11_2 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
catch {add_atpg_constraints mc_11_3 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_11.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_12_0 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
catch {add_atpg_constraints mc_12_1 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
catch {add_atpg_constraints mc_12_2 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
catch {add_atpg_constraints mc_12_3 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_12.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_13_0 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
catch {add_atpg_constraints mc_13_1 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
catch {add_atpg_constraints mc_13_2 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
catch {add_atpg_constraints mc_13_3 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_13.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_14_0 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
catch {add_atpg_constraints mc_14_1 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
catch {add_atpg_constraints mc_14_2 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
catch {add_atpg_constraints mc_14_3 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_14.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_15_0 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
catch {add_atpg_constraints mc_15_1 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
catch {add_atpg_constraints mc_15_2 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
catch {add_atpg_constraints mc_15_3 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_15.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_16_0 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
catch {add_atpg_constraints mc_16_1 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
catch {add_atpg_constraints mc_16_2 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
catch {add_atpg_constraints mc_16_3 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_16.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_17_0 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
catch {add_atpg_constraints mc_17_1 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
catch {add_atpg_constraints mc_17_2 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
catch {add_atpg_constraints mc_17_3 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_17.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_18_0 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
catch {add_atpg_constraints mc_18_1 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
catch {add_atpg_constraints mc_18_2 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
catch {add_atpg_constraints mc_18_3 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_18.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_19_0 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
catch {add_atpg_constraints mc_19_1 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
catch {add_atpg_constraints mc_19_2 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
catch {add_atpg_constraints mc_19_3 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_19.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_20_0 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
catch {add_atpg_constraints mc_20_1 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
catch {add_atpg_constraints mc_20_2 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
catch {add_atpg_constraints mc_20_3 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_20.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_21_0 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
catch {add_atpg_constraints mc_21_1 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
catch {add_atpg_constraints mc_21_2 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
catch {add_atpg_constraints mc_21_3 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_21.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_22_0 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
catch {add_atpg_constraints mc_22_1 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
catch {add_atpg_constraints mc_22_2 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
catch {add_atpg_constraints mc_22_3 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_22.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_23_0 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
catch {add_atpg_constraints mc_23_1 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
catch {add_atpg_constraints mc_23_2 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
catch {add_atpg_constraints mc_23_3 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_23.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_24_0 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
catch {add_atpg_constraints mc_24_1 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
catch {add_atpg_constraints mc_24_2 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
catch {add_atpg_constraints mc_24_3 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_24.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_25_0 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
catch {add_atpg_constraints mc_25_1 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
catch {add_atpg_constraints mc_25_2 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
catch {add_atpg_constraints mc_25_3 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_25.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_26_0 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
catch {add_atpg_constraints mc_26_1 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
catch {add_atpg_constraints mc_26_2 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
catch {add_atpg_constraints mc_26_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_26.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_27_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_27_1 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
catch {add_atpg_constraints mc_27_2 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
catch {add_atpg_constraints mc_27_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_27.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_28_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_28_1 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_28_2 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
catch {add_atpg_constraints mc_28_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_28.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_29_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_29_1 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_29_2 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_29_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_29.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_30_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_30_1 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_30_2 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_30_3 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_30.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_31_0 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_31_1 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_31_2 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_31_3 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_31.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_32_0 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_32_1 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_32_2 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_32_3 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_32.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_33_0 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_33_1 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_33_2 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_33_3 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_33.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_34_0 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_34_1 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_34_2 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_34_3 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_34.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_35_0 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_35_1 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_35_2 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
catch {add_atpg_constraints mc_35_3 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_35.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_36_0 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_36_1 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_36_2 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
catch {add_atpg_constraints mc_36_3 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_36.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_37_0 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_37_1 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
catch {add_atpg_constraints mc_37_2 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
catch {add_atpg_constraints mc_37_3 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_37.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_38_0 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_38_1 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
catch {add_atpg_constraints mc_38_2 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
catch {add_atpg_constraints mc_38_3 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_38.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_39_0 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
catch {add_atpg_constraints mc_39_1 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
catch {add_atpg_constraints mc_39_2 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
catch {add_atpg_constraints mc_39_3 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_39.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_40_0 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
catch {add_atpg_constraints mc_40_1 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
catch {add_atpg_constraints mc_40_2 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
catch {add_atpg_constraints mc_40_3 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_40.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_41_0 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
catch {add_atpg_constraints mc_41_1 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
catch {add_atpg_constraints mc_41_2 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
catch {add_atpg_constraints mc_41_3 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_41.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_42_0 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
catch {add_atpg_constraints mc_42_1 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
catch {add_atpg_constraints mc_42_2 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
catch {add_atpg_constraints mc_42_3 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_42.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_43_0 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
catch {add_atpg_constraints mc_43_1 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
catch {add_atpg_constraints mc_43_2 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
catch {add_atpg_constraints mc_43_3 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_43.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_44_0 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
catch {add_atpg_constraints mc_44_1 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
catch {add_atpg_constraints mc_44_2 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
catch {add_atpg_constraints mc_44_3 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_44.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_45_0 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
catch {add_atpg_constraints mc_45_1 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
catch {add_atpg_constraints mc_45_2 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
catch {add_atpg_constraints mc_45_3 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_45.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_46_0 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
catch {add_atpg_constraints mc_46_1 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
catch {add_atpg_constraints mc_46_2 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
catch {add_atpg_constraints mc_46_3 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_46.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_47_0 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
catch {add_atpg_constraints mc_47_1 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
catch {add_atpg_constraints mc_47_2 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
catch {add_atpg_constraints mc_47_3 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_47.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_48_0 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
catch {add_atpg_constraints mc_48_1 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
catch {add_atpg_constraints mc_48_2 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
catch {add_atpg_constraints mc_48_3 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_48.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_49_0 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
catch {add_atpg_constraints mc_49_1 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
catch {add_atpg_constraints mc_49_2 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
catch {add_atpg_constraints mc_49_3 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_49.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_50_0 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
catch {add_atpg_constraints mc_50_1 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
catch {add_atpg_constraints mc_50_2 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
catch {add_atpg_constraints mc_50_3 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_50.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_51_0 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
catch {add_atpg_constraints mc_51_1 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
catch {add_atpg_constraints mc_51_2 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
catch {add_atpg_constraints mc_51_3 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_51.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_52_0 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
catch {add_atpg_constraints mc_52_1 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
catch {add_atpg_constraints mc_52_2 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
catch {add_atpg_constraints mc_52_3 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_52.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_53_0 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
catch {add_atpg_constraints mc_53_1 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
catch {add_atpg_constraints mc_53_2 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
catch {add_atpg_constraints mc_53_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_53.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_54_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_54_1 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
catch {add_atpg_constraints mc_54_2 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
catch {add_atpg_constraints mc_54_3 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_54.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_55_0 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_55_1 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
catch {add_atpg_constraints mc_55_2 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
catch {add_atpg_constraints mc_55_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_55.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_56_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_56_1 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_56_2 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
catch {add_atpg_constraints mc_56_3 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_56.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_57_0 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_57_1 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_57_2 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
catch {add_atpg_constraints mc_57_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_57.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_58_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_58_1 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_58_2 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_58_3 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_58.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_59_0 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_59_1 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_59_2 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_59_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_59.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_60_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_60_1 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_60_2 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_60_3 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_60.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_61_0 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_61_1 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_61_2 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_61_3 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_61.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_62_0 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_62_1 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_62_2 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_62_3 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_62.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_63_0 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_63_1 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_63_2 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
catch {add_atpg_constraints mc_63_3 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_63.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_64_0 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_64_1 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_64_2 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
catch {add_atpg_constraints mc_64_3 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_64.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_65_0 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_65_1 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_65_2 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
catch {add_atpg_constraints mc_65_3 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_65.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_66_0 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_66_1 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
catch {add_atpg_constraints mc_66_2 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
catch {add_atpg_constraints mc_66_3 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_66.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_67_0 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_67_1 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
catch {add_atpg_constraints mc_67_2 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
catch {add_atpg_constraints mc_67_3 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_67.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_68_0 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_68_1 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
catch {add_atpg_constraints mc_68_2 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
catch {add_atpg_constraints mc_68_3 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_68.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_69_0 1 k1_d2_N106}
catch {add_faults -stuck 0 k1_d2_N106}
catch {add_atpg_constraints mc_69_1 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
catch {add_atpg_constraints mc_69_2 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
catch {add_atpg_constraints mc_69_3 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_69.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_70_0 1 k1_d2_N107}
catch {add_faults -stuck 0 k1_d2_N107}
catch {add_atpg_constraints mc_70_1 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
catch {add_atpg_constraints mc_70_2 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
catch {add_atpg_constraints mc_70_3 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_70.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_71_0 1 k1_d2_N108}
catch {add_faults -stuck 0 k1_d2_N108}
catch {add_atpg_constraints mc_71_1 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
catch {add_atpg_constraints mc_71_2 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
catch {add_atpg_constraints mc_71_3 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_71.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_72_0 1 k1_d2_N109}
catch {add_faults -stuck 0 k1_d2_N109}
catch {add_atpg_constraints mc_72_1 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
catch {add_atpg_constraints mc_72_2 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
catch {add_atpg_constraints mc_72_3 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_72.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_73_0 1 k1_d2_U325/Z}
catch {add_faults -stuck 0 k1_d2_U325/Z}
catch {add_atpg_constraints mc_73_1 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
catch {add_atpg_constraints mc_73_2 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
catch {add_atpg_constraints mc_73_3 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_73.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_74_0 1 k1_d2_N110}
catch {add_faults -stuck 0 k1_d2_N110}
catch {add_atpg_constraints mc_74_1 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
catch {add_atpg_constraints mc_74_2 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
catch {add_atpg_constraints mc_74_3 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_74.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_75_0 1 k1_d2_N111}
catch {add_faults -stuck 0 k1_d2_N111}
catch {add_atpg_constraints mc_75_1 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
catch {add_atpg_constraints mc_75_2 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
catch {add_atpg_constraints mc_75_3 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_75.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_76_0 1 k1_d2_N112}
catch {add_faults -stuck 0 k1_d2_N112}
catch {add_atpg_constraints mc_76_1 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
catch {add_atpg_constraints mc_76_2 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
catch {add_atpg_constraints mc_76_3 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_76.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_77_0 1 k1_d2_N113}
catch {add_faults -stuck 0 k1_d2_N113}
catch {add_atpg_constraints mc_77_1 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
catch {add_atpg_constraints mc_77_2 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
catch {add_atpg_constraints mc_77_3 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_77.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_78_0 1 k1_d2_sub_46_I4_U2_15/Z}
catch {add_faults -stuck 0 k1_d2_sub_46_I4_U2_15/Z}
catch {add_atpg_constraints mc_78_1 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
catch {add_atpg_constraints mc_78_2 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
catch {add_atpg_constraints mc_78_3 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_78.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_79_0 1 k1_d2_add_49_I4_aco_U2/Z}
catch {add_faults -stuck 0 k1_d2_add_49_I4_aco_U2/Z}
catch {add_atpg_constraints mc_79_1 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
catch {add_atpg_constraints mc_79_2 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
catch {add_atpg_constraints mc_79_3 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_79.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_80_0 1 k1_d2_N118}
catch {add_faults -stuck 0 k1_d2_N118}
catch {add_atpg_constraints mc_80_1 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
catch {add_atpg_constraints mc_80_2 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
catch {add_atpg_constraints mc_80_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_80.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_81_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_81_1 1 k1_d2_N119}
catch {add_faults -stuck 0 k1_d2_N119}
catch {add_atpg_constraints mc_81_2 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
catch {add_atpg_constraints mc_81_3 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_81.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_82_0 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_82_1 1 k1_d2_U323/Z}
catch {add_faults -stuck 0 k1_d2_U323/Z}
catch {add_atpg_constraints mc_82_2 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
catch {add_atpg_constraints mc_82_3 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_82.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_83_0 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_83_1 1 k1_d2_N120}
catch {add_faults -stuck 0 k1_d2_N120}
catch {add_atpg_constraints mc_83_2 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
catch {add_atpg_constraints mc_83_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_83.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_84_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_84_1 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_84_2 1 k1_d2_N121}
catch {add_faults -stuck 0 k1_d2_N121}
catch {add_atpg_constraints mc_84_3 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_84.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_85_0 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_85_1 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_85_2 1 k1_d2_N122}
catch {add_faults -stuck 0 k1_d2_N122}
catch {add_atpg_constraints mc_85_3 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_85.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_86_0 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_86_1 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_86_2 1 k1_d2_N123}
catch {add_faults -stuck 0 k1_d2_N123}
catch {add_atpg_constraints mc_86_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_86.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_87_0 1 k1_d2_U332/ZN}
catch {add_faults -stuck 0 k1_d2_U332/ZN}
catch {add_atpg_constraints mc_87_1 1 k1_d2_N100}
catch {add_faults -stuck 0 k1_d2_N100}
catch {add_atpg_constraints mc_87_2 1 k1_d2_N103}
catch {add_faults -stuck 0 k1_d2_N103}
catch {add_atpg_constraints mc_87_3 1 k1_d2_N124}
catch {add_faults -stuck 0 k1_d2_N124}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_87.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_88_0 1 k1_d2_U331/Z}
catch {add_faults -stuck 0 k1_d2_U331/Z}
catch {add_atpg_constraints mc_88_1 1 k1_d2_N101}
catch {add_faults -stuck 0 k1_d2_N101}
catch {add_atpg_constraints mc_88_2 1 k1_d2_N104}
catch {add_faults -stuck 0 k1_d2_N104}
catch {add_atpg_constraints mc_88_3 1 k1_d2_N125}
catch {add_faults -stuck 0 k1_d2_N125}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_88.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
catch {add_atpg_constraints mc_89_0 1 k1_d2_U8/Z}
catch {add_faults -stuck 0 k1_d2_U8/Z}
catch {add_atpg_constraints mc_89_1 1 k1_d2_N102}
catch {add_faults -stuck 0 k1_d2_N102}
catch {add_atpg_constraints mc_89_2 1 k1_d2_N105}
catch {add_faults -stuck 0 k1_d2_N105}
catch {add_atpg_constraints mc_89_3 1 k1_d2_N126}
catch {add_faults -stuck 0 k1_d2_N126}
add_faults -all
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
set_atpg -merge off -decision random -fill random
run_atpg -auto
write_patterns clq_89.stil -format stil -replace
set_patterns -delete
remove_faults -all
remove_atpg_constraints -all
exit
