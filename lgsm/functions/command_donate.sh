#!/bin/bash
# LinuxGSM command_donate.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Shows ways to donate.

commandname="DONATE"
commandaction="Donate"
functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"
fn_firstcommand_set

fn_print_ascii_logo
echo "/shrug"

core_exit.sh
