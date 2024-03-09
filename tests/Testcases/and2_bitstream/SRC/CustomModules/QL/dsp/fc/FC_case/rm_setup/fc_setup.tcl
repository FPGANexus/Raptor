##########################################################################################
# Version: T-2022.03
# Copyright (C) 2014-2022 Synopsys, Inc. All rights reserved.
##########################################################################################

########################################################################################## 
## Special features
##########################################################################################
## For controlling the compile step (used by compile.tcl)
set UNIFIED_FLOW                        true ;# Enable unified flow (compile_fusion)


## For controlling the set_qor_strategy command options
set SET_QOR_STRATEGY_METRIC		"timing" ;# timing|leakage_power|total_power; default is timing;
					;# Specify one metric for the set_qor_strategy -metric option and the settings will be configured to optimize the specified target metric.
set SET_QOR_STRATEGY_MODE		"balanced" ;# balanced|extreme_power|early_design; default is balanced;
					;# Specify one mode for set_qor_strategy -mode option and the settings will be configured for the target mode
set ENABLE_REDUCED_EFFORT		false ;# false|true; RM default false; set it to true to enable the -reduced_effort option for the set_qor_strategy command;
					;# reduces efforts used by the set_qor_strategy command
set ENABLE_HIGH_EFFORT_TIMING           false ;# false|true; Enables high effort timing optimization during compile_fusion with the compile.high_effort_timing app_option with set_qor_strategy -stage synthesis -metric $SET_QOR_STRATEGY_METRIC -high_effort_timing 


set HPC_CORE                    	"" ;# HPC core name; Example : A55, A76; enables set_hpc_options in the flow


set RESET_CHECK_STAGE_SETTINGS		false ;# false|true|all; RM default false; set it to true to enable the -reset_app_options option for the check_stage_settings command;
					;# compares current app option settings against set_technology, set_qor_strategy, set_stage, and select tool default settings which can impact runtime or ppa
					;# when set to all, the reset_app_options command will be applied to the incoming design database in the init_design.tcl script 
set NON_DEFAULT_CHECK_STAGE_SETTINGS    false ;# false|true; RM default false; set it to true to enable the -all_non_default option for the check_stage_settings command;
                                        ;# reports all non-default app options other than megaswitch settings


## For High effort congestion
set ENABLE_HIGH_EFFORT_CONGESTION 	false ;# false|true; RM default false; set it to true to enable high effort congestion flow.  
					;# When true, the -high_effort_congestion switch will be enabled with set_stage -step {synthesis|compile_Place|placement}  

## For Multibit Banking
set ENABLE_MULTIBIT                     false ;# false | true; RM default false but will be set to true if SET_QOR_STRATEGY_METRIC is set to total_power. 
                                        ;# In SET_QOR_STRATEGY_METRIC timing or leakage_power, multibit banking is not automatically used. Set  
                                        ;# ENABLE_MULTIBIT to true to enable multibit banking and debanking regardless of the SET_QOR_STRATEGY_METRIC. 


## For DPS
set ENABLE_DPS				false ;# false|true; RM default false; set it to true for set_stage command to enable dynamic power shaping (DPS)
					;# Optimizes peak current and bulk dynamic voltage drop (DVD) by clock scheduling. Reduces DVD across the design. Takes effect during final_opto phase.
					;# Affects timing network latencies to make pre-CTS steps see the impact, and clock balance points to direct tool to implement the offsets in CTS. 
					;# Pls run redhawk fusion after clock_opt/route_opt stage to verify dynamic voltage drop improvements
## For IRDP
set ENABLE_IRDP				false ;# false|true; RM default false; set it to true to enable IR-aware placement (IRDP) in clock_opt_opto.tcl
set TCL_IRDP_CONFIG_FILE		"" ;# (Required for ENABLE_IRDP) Specify a Tcl script for IRDP configuration
					;# Example for IRDP with streamline RedHawk config :	examples/TCL_IRDP_CONFIG_FILE.rh.tcl  
					;# Example for IRDP with streamline RHSC config :	examples/TCL_IRDP_CONFIG_FILE.rhsc.tcl
## For IRD-CCD
set ENABLE_IRDCCD			false ;# false|true; RM default false; set it to true to enable IR-aware CCD (IRD-CCD) in route_opt.tcl
set TCL_IRDCCD_CONFIG_FILE		"" ;# (Required for ENABLE_IRDCCD) Specify a Tcl script for IRD-CCD configuration
					;# Example for IRD-CCD with RH config: 			examples/TCL_IRDCCD_CONFIG_FILE.rh.tcl
					;# Example for IRD-CCD with RHSC config : 		examples/TCL_IRDCCD_CONFIG_FILE.rhsc.tcl

## For Indesign PrimePower
set INDESIGN_PRIMEPOWER_STAGES	 	"AFTER_CLOCK_OPT_OPTO AFTER_ROUTE_OPT" ;# list of stage names where Indesign PrimePower flow should be run; valid list values: AFTER_LOGIC_OPTO AFTER_INITIAL_OPTO AFTER_FINAL_OPTO AFTER_PLACE_OPT AFTER_CLOCK_OPT_OPTO AFTER_ROUTE_OPT
set TCL_PRIMEPOWER_CONFIG_FILE		"" ;# (Required to enable InDesign PrimePower flow) Specify a Tcl script for Indesign PrimePower configuration
					;# Example for Indesign PrimePower config :		examples/TCL_PRIMEPOWER_CONFIG_FILE.indesign_options.tcl 
                                        ;# The config file will be used to run Indesign PrimePower after compile/place_opt/clock_opt_opto
					;# Using the FSDB, PrimePower will create an updated gate level SAIF that will be annotated back into the design after compile/place_opt/clock_opt_opto
set KEEP_INDESIGN_SAIF_FILE		"false" ;# false|true; RM default false; set it to true to keep the saif file generated during  Indesign PrimePower flow. By default saif file will be overwritten 

## For CTS & MSCTS
set CTS_STYLE                           "standard" ;# standard|MSCTS; RM default standard; specify MSCTS to enable regular multisource clock tree synthesis flow; 
set TCL_REGULAR_MSCTS_FILE		"./examples/mscts.regular.tcl" ;# Specify a Tcl script for regular multisource clock tree synthesis setup and creation,
					;# which will be sourced after initial placement if CTS_STYLE is set to MSCTS in place_opt.tcl
					;# (Required if CTS_STYLE is MSCTS); RM provided script: examples/mscts.regular.tcl 


## For shielding
set ENABLE_CREATE_SHIELDS		false ;# false|true; RM default false; enable shielding (create_shields) in the flow
					;# it is done at the beginning of clock_opt_opto, end of route_auto, end of route_opt, and end of endpoint_opt steps 
set CREATE_SHIELDS_GROUND_NET		"" ;# specify a net name for -with_ground; by default shielding wires are tied to the ground net. If design has multiple ground nets, use this option to specify the desired net


set ROUTE_OPT_STARRC_CONFIG_FILE 	"" ;# Specify the configuration file for StarRC in-design extraction for route_auto.tcl and route_opt.tcl;
					;# (Required for enabling StarRC in-design extraction); refer to examples/ROUTE_OPT_STARRC_CONFIG_FILE.example.txt for sample content and syntax

