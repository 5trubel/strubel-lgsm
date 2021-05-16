#!/bin/bash
# LinuxGSM install_stats.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Enabled LinuxGSM Stats.

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

echo "stats=\"off\"" >> "${configdirserver}/common.cfg"
