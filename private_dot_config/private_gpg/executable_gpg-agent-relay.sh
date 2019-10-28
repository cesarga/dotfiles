#!/usr/bin/env bash
# Launches socat+npiperelay to relay the gpg-agent socket file for use in WSL
# See https://justyn.io/blog/using-a-yubikey-for-gpg-in-windows-10-wsl-windows-subsystem-for-linux/ for details

USERNAME=Cesar
# I use the same username for wsl and windows, but feel free to modify the paths below if that isn't the case
WIN_GNUPGHOME="C:/Users/${USERNAME}/AppData/Roaming/gnupg"
#NPIPERELAY="/c/Users/${USERNAME}/bin/npiperelay.exe"
NPIPERELAY="npiperelay.exe"
PIDFILE="${GNUPGHOME}/.gpg-agent-relay.pid"
OLDPID=$(cat "${PIDFILE}")

# Launch socat+npiperelay for the regular gpg-agent
if [ ! -z "${OLDPID}" ]; then
    ps -p "${OLDPID}" >/dev/null && \
    echo "gpg-agent-relay.sh already running with process id $(cat ${PIDFILE})" && \
    exit 0
fi

rm -f "${GNUPGHOME}/S.gpg-agent*"
echo $$ > ${PIDFILE}

# Relay the regular gpg-agent socket for gpg operations
(exec socat UNIX-LISTEN:"$GNUPHOME/S.gpg-agent,fork" EXEC:"npiperelay.exe -ep -ei -s 'C:/Users/Cesar/AppData/Roaming/gnupg/S.gpg-agent'",nofork &)

# Relay the gpg ssh-agent
#socat UNIX-LISTEN:"${GNUPGHOME}/S.gpg-agent.ssh,fork" EXEC:"${NPIPERELAY} -ep -ei -s -a '${WIN_GNUPGHOME}/S.gpg-agent.ssh'",nofork &
SSHPID=$!

wait ${AGENTPID}
wait ${SSHPID}
