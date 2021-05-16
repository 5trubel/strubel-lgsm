#!/bin/bash
# LinuxGSM check_steamcmd.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Checks if SteamCMD is installed correctly.

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

# init steamcmd functions
core_steamcmd.sh
echo "_------------STEAMCMD CLEAR"
fn_check_steamcmd_clear
echo "_------------STEAMCMD"
fn_check_steamcmd
if [ ${shortname} == "ark" ]; then
	fn_check_steamcmd_ark
fi
echo "_------------STEAMCMD DIR"
fn_check_steamcmd_dir
echo "_------------STEAMCMD DIR LEGACY"
fn_check_steamcmd_dir_legacy
echo "_------------STEAMCMD USER"
fn_check_steamcmd_user
echo "_------------STEAMCMD EXEC"
fn_check_steamcmd_exec
