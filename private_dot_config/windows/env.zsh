export $(sudo dbus-launch)
export LIBGL_ALWAYS_INDIRECT=1

alias wslip="ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias wslhost="tail -1 /etc/resolv.conf | cut -d' ' -f2"

export WSLIP=$(wslip)
export WSLHOST=$(wslhost)
export DISPLAY="$WSLHOST:0"
