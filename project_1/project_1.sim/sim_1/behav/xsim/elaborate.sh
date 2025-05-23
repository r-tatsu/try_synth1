#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sun May 04 21:36:59 JST 2025
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto 6166f7ae19bc4dc2ae779f6c35859dd2 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L unisims_ver -L secureip --snapshot counter_behav xil_defaultlib.counter xil_defaultlib.glbl -log elaborate.log"
xelab -wto 6166f7ae19bc4dc2ae779f6c35859dd2 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L unisims_ver -L secureip --snapshot counter_behav xil_defaultlib.counter xil_defaultlib.glbl -log elaborate.log

