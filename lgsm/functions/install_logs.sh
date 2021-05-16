#!/bin/bash
# LinuxGSM install_logs.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Creates log directories.

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

if [ "${checklogs}" != "1" ]; then

fi
fn_sleep_time
# Create LinuxGSM logs.

mkdir -p "${logdir}"
if [ $? != 0 ]; then
	fn_print_fail_eol_nl
	core_exit.sh
else
	fn_print_ok_eol_nl
fi

mkdir -p "${lgsmlogdir}"
if [ $? != 0 ]; then
	fn_print_fail_eol_nl
	core_exit.sh
else
	fn_print_ok_eol_nl
fi

touch "${lgsmlog}"
if [ $? != 0 ]; then
	fn_print_fail_eol_nl
	core_exit.sh
else
	fn_print_ok_eol_nl
fi
# Create Console logs.
if [ "${consolelogdir}" ]; then

	mkdir -p "${consolelogdir}"
	if [ $? != 0 ]; then
		fn_print_fail_eol_nl
		core_exit.sh
	else
		fn_print_ok_eol_nl
	fi

	if ! touch "${consolelog}"; then
		fn_print_fail_eol_nl
		core_exit.sh
	else
		fn_print_ok_eol_nl
	fi
fi

# Create Game logs.
if [ "${gamelogdir}" ]&&[ ! -d "${gamelogdir}" ]; then

	if ! mkdir -p "${gamelogdir}"; then
		fn_print_fail_eol_nl
		core_exit.sh
	else
		fn_print_ok_eol_nl
	fi
fi

# Symlink to gamelogdir
# unless gamelogdir is within logdir.
# e.g serverfiles/log is not within log/: symlink created
# log/server is in log/: symlink not created
if [ "${gamelogdir}" ]; then
	if [ "${gamelogdir:0:${#logdir}}" != "${logdir}" ]; then

		if ! ln -nfs "${gamelogdir}" "${logdir}/server"; then
			fn_print_fail_eol_nl
			core_exit.sh
		else
			fn_print_ok_eol_nl
		fi
	fi
fi

# If server uses SteamCMD create a symbolic link to the Steam logs.
if [ -d "${rootdir}/Steam/logs" ]; then
	if [ ! -L "${logdir}/steamcmd" ]; then

		if ! ln -nfs "${rootdir}/Steam/logs" "${logdir}/steamcmd"; then
			fn_print_fail_eol_nl
			core_exit.sh
		else
			fn_print_ok_eol_nl
		fi
	fi
fi
fn_script_log_info "Logs installed"
