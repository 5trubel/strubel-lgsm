#!/bin/bash
# LinuxGSM install_header.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Prints installation header.

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

clear
fn_print_ascii_logo
fn_sleep_time
echo -e "================================="
echo -e "${lightyellow}Linux${default}GSM_"
echo -e "Modified by Strubel; Made by Daniel Gibbs"
echo -e "================================="
fn_sleep_time
