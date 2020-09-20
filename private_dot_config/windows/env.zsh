#export $(sudo dbus-launch)
#export LIBGL_ALWAYS_INDIRECT=1

alias wslip="ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias wslhost="tail -1 /etc/resolv.conf | cut -d' ' -f2"

WSLIP=$(wslip)
export WSLIP
WSLHOST=$(wslhost)
export WSLHOST
DISPLAY="$WSLHOST:0"
export DISPLAY
