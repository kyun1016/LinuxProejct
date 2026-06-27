# export SELECT_VERSION_xrun=21.09.006_xcelium
# export SPYGLASS_HOME=/cad/synopsys/spyglass/S-2021.09-SP2-1/SPYGLASS_HOME
# export SPYGLASS_DC_PATH=/cad/synopsys/spyglass/S-2021.09-SP2-1
root_dir := $(shell pwd)


all: vcs

vcs:
		echo "==== directory list ===="
		ls ${root_dir}/02_Sim/01_func/.
		@read -p "Type Directory Name: " dir_name ;\
		rm -r ${root_dir}/02_Sim/01_func/$${dir_name}/01_log ;\
		mkdir ${root_dir}/02_Sim/01_func/$${dir_name} ;\
		mkdir ${root_dir}/02_Sim/01_func/$${dir_name}/01_log ;\
		mkdir ${root_dir}/02_Sim/01_func/$${dir_name}/02_cc ;\
		mkdir ${root_dir}/02_Sim/01_func/$${dir_name}/03_fsdb ;\
		cp ${root_dir}/01_Env/02_Source_Code/09_rc/novas.rc ${root_dir}/02_Sim/01_func/$${dir_name}/. ;\
		cd ${root_dir}/02_Sim/01_func/$${dir_name}/. ;\
		vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed \
		-sverilog -timescale=1ns/1ns -F ${root_dir}/01_Env/02_Source_Code/list_top.f -l ./01_log/fsim.log \
		-kdb -debug_access+all +v2k \
		-cm line+cond+fsm+tgl+branch \
		-o ./simv ;\
		./simv -reportstats -l ./01_log/vcs_sim.log \
		-cm line+cond+fsm+tgl+branch \
		-cm_hier ./02_cc/.
		
vd:
		echo "==== directory list ===="
		ls ${root_dir}/02_Sim/01_func/.
		@read -p "Type Directory Name: " dir_name ;\
		mkdir ${root_dir}/02_Sim/01_func/$${dir_name} ;\
		cd ${root_dir}/02_Sim/01_func/$${dir_name}/. ;\
		cp ${root_dir}/01_Env/02_Source_Code/09_rc/novas.rc ${root_dir}/02_Sim/01_func/$${dir_name}/. ;\
		verdi -dbdir ./simv.daidir -ssf ./03_fsdb/waveform.fsdb &
vdf:
		echo "==== directory list ===="
		ls ${root_dir}/02_Sim/01_func/.
		@read -p "Type Directory Name: " dir_name ;\
		mkdir ${root_dir}/02_Sim/01_func/$${dir_name} ;\
		cd ${root_dir}/02_Sim/01_func/$${dir_name}/. ;\
		cp ${root_dir}/01_Env/02_Source_Code/09_rc/novas.rc ${root_dir}/02_Sim/01_func/$${dir_name}/. ;\
		verdi -F ${root_dir}/01_Env/02_Source_Code/list_top.f &
cc:
		echo "==== directory list ===="
		ls ${root_dir}/02_Sim/01_func/.
		@read -p "Type Directory Name: " dir_name ;\
		cd ${root_dir}/02_Sim/01_func/$${dir_name}/. ;\
		cp ${root_dir}/01_Env/02_Source_Code/09_rc/novas.rc ${root_dir}/02_Sim/01_func/$${dir_name}/. ;\
		verdi -cov -covdir ./simv.vdb &

lint:
		echo "==== directory list ===="
		ls ${root_dir}/03_Lint/.
		@read -p "Type Directory Name: " dir_name ;\
		rm -r ${root_dir}/03_Lint/$${dir_name} ;\
		mkdir ${root_dir}/03_Lint/$${dir_name} ;\
		mkdir ${root_dir}/03_Lint/$${dir_name}/01_script ;\
		mkdir ${root_dir}/03_Lint/$${dir_name}/01_script/01_RTL ;\
		mkdir ${root_dir}/03_Lint/$${dir_name}/02_logs ;\
		mkdir ${root_dir}/03_Lint/$${dir_name}/03_rpts ;\
		cp ${root_dir}/01_Env/04_Lint/run.tcl ${root_dir}/03_Lint/$${dir_name}/01_script ;\
		cp ${root_dir}/01_Env/02_Source_Code/06_RTL_Code/*.v ${root_dir}/03_Lint/$${dir_name}/01_script/01_RTL/. ;\
		cd ${root_dir}/03_Lint/$${dir_name} ;\
		ls 01_script/01_RTL/*.v > ./01_script/01_RTL/list_rtl.f ;\
		spyglass & 	
