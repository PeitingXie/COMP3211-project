@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Fri Apr 08 23:07:42 +1000 2022
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim Single_cycle_core_TB_VHDL_behav -key {Behavioral:sim_1:Functional:Single_cycle_core_TB_VHDL} -tclbatch Single_cycle_core_TB_VHDL.tcl -view C:/Users/Katelyn/OneDrive - UNSW/22T1/COMP3211/Labs/Lab03/lab03/Single_cycle_core_TB_VHDL_lab02_behav.wcfg -view C:/Users/Katelyn/OneDrive - UNSW/22T1/COMP3211/Labs/Lab03/lab03/Single_cycle_core_TB_VHDL__pipeline_behav.wcfg -log simulate.log"
call xsim  Single_cycle_core_TB_VHDL_behav -key {Behavioral:sim_1:Functional:Single_cycle_core_TB_VHDL} -tclbatch Single_cycle_core_TB_VHDL.tcl -view C:/Users/Katelyn/OneDrive - UNSW/22T1/COMP3211/Labs/Lab03/lab03/Single_cycle_core_TB_VHDL_lab02_behav.wcfg -view C:/Users/Katelyn/OneDrive - UNSW/22T1/COMP3211/Labs/Lab03/lab03/Single_cycle_core_TB_VHDL__pipeline_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
