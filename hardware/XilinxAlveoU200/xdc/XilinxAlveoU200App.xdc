##############################################################################
## This file is part of 'axi-pcie-core'.
## It is subject to the license terms in the LICENSE.txt file found in the
## top-level directory of this distribution and at:
##    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html.
## No part of 'axi-pcie-core', including this file,
## may be copied, modified, propagated, or distributed except according to
## the terms contained in the LICENSE.txt file.
##############################################################################

###########
# QSFP[0] #
###########

set_property PACKAGE_PIN K11 [get_ports { qsfp0RefClkP[0] }] ;# 161.1328125 MHz
set_property PACKAGE_PIN K10 [get_ports { qsfp0RefClkN[0] }] ;# 161.1328125 MHz
set_property PACKAGE_PIN M11 [get_ports { qsfp0RefClkP[1] }] ;# 156.25 MHz
set_property PACKAGE_PIN M10 [get_ports { qsfp0RefClkN[1] }] ;# 156.25 MHz

set_property PACKAGE_PIN N9 [get_ports { qsfp0TxP[0] }]
set_property PACKAGE_PIN N8 [get_ports { qsfp0TxN[0] }]
set_property PACKAGE_PIN N4 [get_ports { qsfp0RxP[0] }]
set_property PACKAGE_PIN N3 [get_ports { qsfp0RxN[0] }]

set_property PACKAGE_PIN M7 [get_ports { qsfp0TxP[1] }]
set_property PACKAGE_PIN M6 [get_ports { qsfp0TxN[1] }]
set_property PACKAGE_PIN M2 [get_ports { qsfp0RxP[1] }]
set_property PACKAGE_PIN M1 [get_ports { qsfp0RxN[1] }]

set_property PACKAGE_PIN L9 [get_ports { qsfp0TxP[2] }]
set_property PACKAGE_PIN L8 [get_ports { qsfp0TxN[2] }]
set_property PACKAGE_PIN L4 [get_ports { qsfp0RxP[2] }]
set_property PACKAGE_PIN L3 [get_ports { qsfp0RxN[2] }]

set_property PACKAGE_PIN K7 [get_ports { qsfp0TxP[3] }]
set_property PACKAGE_PIN K6 [get_ports { qsfp0TxN[3] }]
set_property PACKAGE_PIN K2 [get_ports { qsfp0RxP[3] }]
set_property PACKAGE_PIN K1 [get_ports { qsfp0RxN[3] }]

###########
# QSFP[1] #
###########

set_property PACKAGE_PIN P11 [get_ports { qsfp1RefClkP[0] }] ;# 161.1328125 MHz
set_property PACKAGE_PIN P10 [get_ports { qsfp1RefClkN[0] }] ;# 161.1328125 MHz
set_property PACKAGE_PIN T11 [get_ports { qsfp1RefClkP[1] }] ;# 156.25 MHz
set_property PACKAGE_PIN T10 [get_ports { qsfp1RefClkN[1] }] ;# 156.25 MHz

set_property PACKAGE_PIN U9 [get_ports { qsfp1TxP[0] }]
set_property PACKAGE_PIN U8 [get_ports { qsfp1TxN[0] }]
set_property PACKAGE_PIN U4 [get_ports { qsfp1RxP[0] }]
set_property PACKAGE_PIN U3 [get_ports { qsfp1RxN[0] }]

set_property PACKAGE_PIN T7 [get_ports { qsfp1TxP[1] }]
set_property PACKAGE_PIN T6 [get_ports { qsfp1TxN[1] }]
set_property PACKAGE_PIN T2 [get_ports { qsfp1RxP[1] }]
set_property PACKAGE_PIN T1 [get_ports { qsfp1RxN[1] }]

set_property PACKAGE_PIN R9 [get_ports { qsfp1TxP[2] }]
set_property PACKAGE_PIN R8 [get_ports { qsfp1TxN[2] }]
set_property PACKAGE_PIN R4 [get_ports { qsfp1RxP[2] }]
set_property PACKAGE_PIN R3 [get_ports { qsfp1RxN[2] }]

set_property PACKAGE_PIN P7 [get_ports { qsfp1TxP[3] }]
set_property PACKAGE_PIN P6 [get_ports { qsfp1TxN[3] }]
set_property PACKAGE_PIN P2 [get_ports { qsfp1RxP[3] }]
set_property PACKAGE_PIN P1 [get_ports { qsfp1RxN[3] }]

##########
# Clocks #
##########

create_clock -period 6.206 -name qsfp0RefClkP0 [get_ports {qsfp0RefClkP[0]}]
create_clock -period 6.400 -name qsfp0RefClkP1 [get_ports {qsfp0RefClkP[1]}]

create_clock -period 6.206 -name qsfp1RefClkP0 [get_ports {qsfp1RefClkP[0]}]
create_clock -period 6.400 -name qsfp1RefClkP1 [get_ports {qsfp1RefClkP[1]}]

set_clock_groups -asynchronous -group [get_clocks {dmaClk}] -group [get_clocks -include_generated_clocks {qsfp0RefClkP0}]
set_clock_groups -asynchronous -group [get_clocks {dmaClk}] -group [get_clocks -include_generated_clocks {qsfp0RefClkP1}]
set_clock_groups -asynchronous -group [get_clocks {dmaClk}] -group [get_clocks -include_generated_clocks {qsfp1RefClkP0}]
set_clock_groups -asynchronous -group [get_clocks {dmaClk}] -group [get_clocks -include_generated_clocks {qsfp1RefClkP1}]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks {userClkP}] -group [get_clocks -include_generated_clocks {qsfp0RefClkP0}]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks {userClkP}] -group [get_clocks -include_generated_clocks {qsfp0RefClkP1}]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks {userClkP}] -group [get_clocks -include_generated_clocks {qsfp1RefClkP0}]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks {userClkP}] -group [get_clocks -include_generated_clocks {qsfp1RefClkP1}]

set_clock_groups -asynchronous \
   -group [get_clocks -include_generated_clocks {qsfp0RefClkP0}] \
   -group [get_clocks -include_generated_clocks {qsfp0RefClkP1}] \
   -group [get_clocks -include_generated_clocks {qsfp1RefClkP0}] \
   -group [get_clocks -include_generated_clocks {qsfp1RefClkP1}]


set_property -dict {PACKAGE_PIN AY38 IOSTANDARD DIFF_POD12_DCI } [get_ports ddrClkN[0] ]; # Bank 42 VCCO - VCC1V2 Net "SYSCLK0_300_N" - IO_L13N_T2L_N1_GC_QBC_42
set_property -dict {PACKAGE_PIN AY37 IOSTANDARD DIFF_POD12_DCI } [get_ports ddrClkP[0]]; # Bank 42 VCCO - VCC1V2 Net "SYSCLK0_300_P" - IO_L13P_T2L_N0_GC_QBC_42

create_clock -period 3.332 -name ddrClk0 [get_ports ddrClkP[0]]
