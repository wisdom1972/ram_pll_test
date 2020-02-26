
# Efinity Interface Designer SDC
# Version: 2019.3.272.3.4
# Date: 2020-02-26 08:28

# Copyright (C) 2017 - 2019 Efinix Inc. All rights reserved.

# Device: T20F256
# Project: ram_pll
# Timing Model: C4 (final)

# PLL Constraints
#################
create_clock -period 26.67 clk

# GPIO Constraints
####################
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led_o[0]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led_o[0]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led_o[1]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led_o[1]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led_o[2]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led_o[2]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led_o[3]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led_o[3]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led_o[4]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led_o[4]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led_o[5]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led_o[5]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led_o[6]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led_o[6]}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {led_o[7]}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {led_o[7]}]
