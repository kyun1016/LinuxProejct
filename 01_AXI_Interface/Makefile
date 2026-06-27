# export SELECT_VERSION_xrun=21.09.006_xcelium
# export SPYGLASS_HOME=/cad/synopsys/spyglass/S-2021.09-SP2-1/SPYGLASS_HOME
# export SPYGLASS_DC_PATH=/cad/synopsys/spyglass/S-2021.09-SP2-1
.SHELLFLAGS := -ec
PROJECT_NAME 	:= 01_AXI_Interface
ROOT_DIR 		:= $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/..)
PRJ_DIR 		:= ${ROOT_DIR}/${PROJECT_NAME}/zz_reference
PRJ_AXI_DIR 				:= ${PRJ_DIR}/axi
PRJ_COMMON_CELLS_DIR 		:= ${PRJ_DIR}/common_cells
PRJ_COMMON_VERIFICATION_DIR := ${PRJ_DIR}/common_verification
PRJ_TECH_CELLS_GENERIC_DIR 	:= ${PRJ_DIR}/tech_cells_generic

export PRJ_DIR
export PRJ_AXI_DIR
export PRJ_COMMON_CELLS_DIR
export PRJ_COMMON_VERIFICATION_DIR
export PRJ_TECH_CELLS_GENERIC_DIR

OUT_DIR 		:= ${ROOT_DIR}/../PROJECT_OUT/${PROJECT_NAME}
OUT_SIM_DIR     := ${OUT_DIR}/sim

all: vdf

# vcs:
# 	echo "==== directory list ===="
# 	ls ${OUT_DIR}/02_Sim/01_func/.
# 	@read -p "Type Directory Name: " dir_name ;\
# 	rm -rf ${OUT_DIR}/02_Sim/01_func/$${dir_name}/01_log ;\
# 	mkdir -p ${OUT_DIR}/02_Sim/01_func/$${dir_name} ;\
# 	mkdir -p ${OUT_DIR}/02_Sim/01_func/$${dir_name}/01_log ;\
# 	mkdir -p ${OUT_DIR}/02_Sim/01_func/$${dir_name}/02_cc ;\
# 	mkdir -p ${OUT_DIR}/02_Sim/01_func/$${dir_name}/03_fsdb ;\
# 	cd ${OUT_DIR}/02_Sim/01_func/$${dir_name}/. ;\
# 	vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed \
# 	-sverilog -timescale=1ns/1ns -F ${PRJ_DIR}/01_Env/02_Source_Code/list_top.f -l ./01_log/fsim.log \
# 	-kdb -debug_access+all +v2k \
# 	-cm line+cond+fsm+tgl+branch \
# 	-o ./simv ;\
# 	./simv -reportstats -l ./01_log/vcs_sim.log \
# 	-cm line+cond+fsm+tgl+branch \
# 	-cm_hier ./02_cc/.
	
vd:
	mkdir -p ${OUT_SIM_DIR} ;\
	cd ${OUT_SIM_DIR} ;\
	verdi -dbdir ${OUT_SIM_DIR}/simv.daidir -ssf ${OUT_SIM_DIR}/fsdb/waveform.fsdb &

vdf:
	mkdir -p ${OUT_SIM_DIR} ;\
	cd ${OUT_SIM_DIR} ;\
	verdi -sv -f ${PRJ_AXI_DIR}/list.f &

# cc:
# 	echo "==== directory list ===="
# 	ls ${PRJ_DIR}/02_Sim/01_func/.
# 	@read -p "Type Directory Name: " dir_name ;\
# 	cd ${PRJ_DIR}/02_Sim/01_func/$${dir_name}/. ;\
# 	cp ${PRJ_DIR}/01_Env/02_Source_Code/09_rc/novas.rc ${PRJ_DIR}/02_Sim/01_func/$${dir_name}/. ;\
# 	verdi -cov -covdir ./simv.vdb &

# lint:
# 	echo "==== directory list ===="
# 	ls ${PRJ_DIR}/03_Lint/.
# 	@read -p "Type Directory Name: " dir_name ;\
# 	rm -rf ${PRJ_DIR}/03_Lint/$${dir_name} ;\
# 	mkdir -p ${PRJ_DIR}/03_Lint/$${dir_name} ;\
# 	mkdir -p ${PRJ_DIR}/03_Lint/$${dir_name}/01_script ;\
# 	mkdir -p ${PRJ_DIR}/03_Lint/$${dir_name}/01_script/01_RTL ;\
# 	mkdir -p ${PRJ_DIR}/03_Lint/$${dir_name}/02_logs ;\
# 	mkdir -p ${PRJ_DIR}/03_Lint/$${dir_name}/03_rpts ;\
# 	cp ${PRJ_DIR}/01_Env/04_Lint/run.tcl ${PRJ_DIR}/03_Lint/$${dir_name}/01_script ;\
# 	cp ${PRJ_DIR}/01_Env/02_Source_Code/06_RTL_Code/*.v ${PRJ_DIR}/03_Lint/$${dir_name}/01_script/01_RTL/. ;\
# 	cd ${PRJ_DIR}/03_Lint/$${dir_name} ;\
# 	ls 01_script/01_RTL/*.v > ./01_script/01_RTL/list_rtl.f ;\
# 	spyglass & 	
