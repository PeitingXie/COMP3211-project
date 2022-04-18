@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Mon Apr 18 17:48:34 +1000 2022
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim Testbench_behav -key {Behavioral:sim_1:Functional:Testbench} -tclbatch Testbench.tcl -view D:/UNSW/2022 term1/COMP3211/COMP3211-project/pipelined_processor_updated/pipelined_processor_updated.srcs/sim_1/imports/pipelined_processor/Single_cycle_core_TB_VHDL__pipeline_behav.wcfg -log simulate.log"
call xsim  Testbench_behav -key {Behavioral:sim_1:Functional:Testbench} -tclbatch Testbench.tcl -view D:/UNSW/2022 term1/COMP3211/COMP3211-project/pipelined_processor_updated/pipelined_processor_updated.srcs/sim_1/imports/pipelined_processor/Single_cycle_core_TB_VHDL__pipeline_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
