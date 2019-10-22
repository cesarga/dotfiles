# WSL1 only
#if [[ "$(command -v socat)" ]] && [[ "$(command -v npiperelay.exe)" ]] && [[ ! -e /var/run/docker.sock ]]; then
#  (sudo socat UNIX-LISTEN:/var/run/docker.sock,fork,group=docker,umask=007 EXEC:"npiperelay.exe -ep -s //./pipe/docker_engine",nofork &)
#fi


