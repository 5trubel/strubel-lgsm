#!/bin/bash
# LinuxGSM core_messages.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Defines on-screen messages such as [  OK  ] and how script logs look.

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

# nl: new line: message is following by a new line.
# eol: end of line: message is placed at the end of the current line.
fn_ansi_loader(){
	if [ "${ansi}" != "off" ]; then
		# echo colors
		default="\e[0m"
		black="\e[30m"
		red="\e[31m"
		lightred="\e[91m"
		green="\e[32m"
		lightgreen="\e[92m"
		yellow="\e[33m"
		lightyellow="\e[93m"
		blue="\e[34m"
		lightblue="\e[94m"
		magenta="\e[35m"
		lightmagenta="\e[95m"
		cyan="\e[36m"
		lightcyan="\e[96m"
		darkgrey="\e[90m"
		lightgrey="\e[37m"
		white="\e[97m"
	fi
	# carriage return & erase to end of line.
	creeol="\r\033[K"
}

fn_sleep_time(){
	if [ "${sleeptime}" != "0" ]||[ "${travistest}" != "1" ]; then
		if [ -z "${sleeptime}" ]; then
			sleeptime=0.5
		fi
		sleep "${sleeptime}"
	fi
}

# Log display
########################
## Feb 28 14:56:58 ut99-server: Monitor:
fn_script_log(){
	if [ -d "${lgsmlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: ${commandname}: ${1}" >> "${lgsmlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: ${1}" >> "${lgsmlog}"
		fi
	fi
}

## Feb 28 14:56:58 ut99-server: Monitor: PASS:
fn_script_log_pass(){
	if [ -d "${lgsmlogdir}" ]; then

		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: ${commandname}: PASS: ${1}" >> "${lgsmlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: PASS: ${1}" >> "${lgsmlog}"
		fi
	fi
	exitcode=0
}

## Feb 28 14:56:58 ut99-server: Monitor: FATAL:
fn_script_log_fatal(){
	if [ -d "${lgsmlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: ${commandname}: FATAL: ${1}" >> "${lgsmlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: FATAL: ${1}" >> "${lgsmlog}"
		fi
	fi
	exitcode=1
}

## Feb 28 14:56:58 ut99-server: Monitor: ERROR:
fn_script_log_error(){
	if [ -d "${lgsmlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: ${commandname}: ERROR: ${1}" >> "${lgsmlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: ERROR: ${1}" >> "${lgsmlog}"
		fi
	fi
	exitcode=2
}

## Feb 28 14:56:58 ut99-server: Monitor: WARN:
fn_script_log_warn(){
	if [ -d "${lgsmlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: ${commandname}: WARN: ${1}" >> "${lgsmlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: WARN: ${1}" >> "${lgsmlog}"
		fi
	fi
	exitcode=3
}

## Feb 28 14:56:58 ut99-server: Monitor: INFO:
fn_script_log_info(){
	if [ -d "${lgsmlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: ${commandname}: INFO: ${1}" >> "${lgsmlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: INFO: ${1}" >> "${lgsmlog}"
		fi
	fi
}

## Feb 28 14:56:58 ut99-server: Monitor: UPDATE:
fn_script_log_update(){
	if [ -d "${lgsmlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: ${commandname}: UPDATE: ${1}" >> "${lgsmlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S.%3N') ${selfname}: UPDATE: ${1}" >> "${lgsmlog}"
		fi
	fi
}

# On-Screen - Automated functions
##################################

# [ .... ]
fn_print_dots(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_dots_nl(){
	echo "deactivated"  > dev null 2>&1
}

# [  OK  ]
fn_print_ok(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_ok_nl(){
	echo "deactivated"  > dev null 2>&1
}

# [ FAIL ]
fn_print_fail(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_fail_nl(){
	echo "deactivated"  > dev null 2>&1
}

# [ ERROR ]
fn_print_error(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_error_nl(){
	echo "deactivated"  > dev null 2>&1
}

# [ WARN ]
fn_print_warn(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_warn_nl(){
	echo "deactivated"  > dev null 2>&1
}

# [ INFO ]
fn_print_info(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_info_nl(){
	echo "deactivated"  > dev null 2>&1
}

# [ START ]
fn_print_start(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_start_nl(){
	echo "deactivated"  > dev null 2>&1
}

# On-Screen - Interactive messages
##################################

# No More Room in Hell Debug
# =================================
fn_print_header(){
	echo "deactivated"  > dev null 2>&1
}

# Complete!
fn_print_complete(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_complete_nl(){
	echo "deactivated"  > dev null 2>&1
}

# Failure!
fn_print_failure(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_failure_nl(){
	echo "deactivated"  > dev null 2>&1
}

# Error!
fn_print_error2(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_error2_nl(){
	echo "deactivated"  > dev null 2>&1
}

# Warning!
fn_print_warning(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_warning_nl(){
	echo "deactivated"  > dev null 2>&1
}

# Information!
fn_print_information(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_information_nl(){
	echo "deactivated"  > dev null 2>&1
}

# Y/N Prompt
fn_prompt_yn(){
	echo "deactivated"  > dev null 2>&1
}

# Prompt for message
fn_prompt_message(){
	while true; do
		unset prompt
		local prompt="$1"
		read -e -p  "${prompt}" -r answer
		if fn_prompt_yn "Continue" Y; then
			break;
		fi
	done
	echo "${answer}"
}

# On-Screen End of Line
##################################

# YES
fn_print_yes_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_yes_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# NO
fn_print_no_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_no_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# OK
fn_print_ok_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_ok_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# FAIL
fn_print_fail_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_fail_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# ERROR
fn_print_error_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_error_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# WAIT
fn_print_wait_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_wait_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# WARN
fn_print_warn_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_warn_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# INFO
fn_print_info_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_info_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# QUERYING
fn_print_querying_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_querying_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# CHECKING
fn_print_checking_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_checking_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# DELAY
fn_print_delay_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_delay_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# CANCELED
fn_print_canceled_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_canceled_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# REMOVED
fn_print_removed_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_removed_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

# UPDATE
fn_print_update_eol(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_update_eol_nl(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_ascii_logo(){
	echo "deactivated"  > dev null 2>&1
}

fn_print_restart_warning(){
	fn_print_warn "${selfname} will be restarted"
	fn_script_log_warn "${selfname} will be restarted"
	totalseconds=3
	for seconds in {3..1}; do
		fn_print_warn "${selfname} will be restarted: ${totalseconds}"
		totalseconds=$((totalseconds - 1))
		sleep 1
		if [ "${seconds}" == "0" ]; then
			break
		fi
	done
	fn_print_warn_nl "${selfname} will be restarted"
}

# Functions below are used to ensure that logs and UI correctly reflect the command it is actually running.
# Useful when a command has to call upon another command causing the other command to overrite commandname variables

# Used to remember the command that ran first.
fn_firstcommand_set(){
	if [ -z "${firstcommandname}" ]; then
		firstcommandname="${commandname}"
		firstcommandaction="${commandaction}"
	fi
}

# Used to reset commandname variables to the command the script ran first.
fn_firstcommand_reset(){
	commandname="${firstcommandname}"
	commandaction="${firstcommandaction}"
}
