@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Sat Nov 16 21:57:39 +0530 2019
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 8b844008e34c4d1e92466d9299d9cb35 --incr --debug typical --relax --mt 2 -L blk_mem_gen_v8_4_3 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot final_test_behav xil_defaultlib.final_test xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto 8b844008e34c4d1e92466d9299d9cb35 --incr --debug typical --relax --mt 2 -L blk_mem_gen_v8_4_3 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot final_test_behav xil_defaultlib.final_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
