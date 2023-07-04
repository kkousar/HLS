vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xlconstant_v1_1_3
vlib questa_lib/msim/xil_defaultlib

vmap xlconstant_v1_1_3 questa_lib/msim/xlconstant_v1_1_3
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xlconstant_v1_1_3 -64 \
"../../../../mini_project_rtl_new.srcs/sim_1/bd/design_1/ipshared/0750/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \
"../../../bd/design_1/ipshared/4543/sources_1/new/pn_gen.v" \
"../../../bd/design_1/ip/design_1_pn_gen_0_1/sim/design_1_pn_gen_0_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

