#!/bin/bash
# LinuxGSM command_console.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Gives access to the server tmux console.

commandname="CONSOLE"
commandaction="Access console"
functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"
fn_firstcommand_set

check.sh
fn_print_header

if [ "${consoleverbose}" == "yes" ]; then
	echo -e "* Verbose output: ${lightgreen}yes${default}"
elif [ "${consoleverbose}" == "no" ]; then
	echo -e "* Verbose output: ${red}no${default}"
else
	echo -e "* Verbose output: ${red}unknown${default}"
fi

if [ "${consoleinteract}" == "yes" ]; then
	echo -e "* Interactive output: ${lightgreen}yes${default}"
elif [ "${consoleinteract}" == "no" ]; then
	echo -e "* Interactive output: ${red}no${default}"
else
	echo -e "* Interactive output: ${red}unknown${default}"
fi

fn_print_dots "Accessing console"
check_status.sh
if [ "${status}" != "0" ]; then
	fn_print_ok_nl "Accessing console"
	fn_script_log_pass "Console accessed"
	tmux attach-session -t "${sessionname}"
	fn_print_ok_nl "Closing console"
	fn_script_log_pass "Console closed"
else
	fn_print_error_nl "Server not running"
	exitbypass=1
	command_start.sh
	fn_firstcommand_reset
fi

core_exit.sh
