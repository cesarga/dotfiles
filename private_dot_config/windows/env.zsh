#export $(sudo dbus-launch)
#export LIBGL_ALWAYS_INDIRECT=1

export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export DISPLAY="$WSL_HOST:0"
