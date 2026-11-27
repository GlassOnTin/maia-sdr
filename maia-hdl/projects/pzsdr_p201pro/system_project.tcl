
source ../../adi-hdl/scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

adi_project_create pzsdr_p201pro 0 {} "xc7z020clg400-2"

adi_project_files pzsdr_p201pro [list \
  "../pluto/system_top.v" \
  "system_constr.xdc" \
  "$ad_hdl_dir/library/common/ad_iobuf.v"]

# use improved implementation strategy for best timing results
set_property strategy Performance_ExplorePostRoutePhysOpt [get_runs impl_1]

set_property is_enabled false [get_files  *system_sys_ps7_0.xdc]
adi_project_run pzsdr_p201pro
source $ad_hdl_dir/library/axi_ad9361/axi_ad9361_delay.tcl
