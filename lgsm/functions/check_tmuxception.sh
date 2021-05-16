#!/bin/bash
# LinuxGSM check_config.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Checks if run from tmux or screen.

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

fn_check_is_in_tmux(){
  if [ "${TMUX}" ]; then
		fn_print_fail_nl "tmuxception error: Sorry Cobb you cannot start a tmux session inside of a tmux session."
		fn_script_log_fatal "Tmuxception error: Attempted to start a tmux session inside of a tmux session."
		fn_print_information_nl "LinuxGSM creates a tmux session when starting the server."

		core_exit.sh
	fi
}

fn_check_is_in_screen(){
	if [ "${STY}" ]; then
		fn_print_fail_nl "tmuxception error: Sorry Cobb you cannot start a tmux session inside of a screen session."
		fn_script_log_fatal "Tmuxception error: Attempted to start a tmux session inside of a screen session."
		fn_print_information_nl "LinuxGSM creates a tmux session when starting the server."

		core_exit.sh
	fi
}

fn_check_is_in_tmux
fn_check_is_in_screen
