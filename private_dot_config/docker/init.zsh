# if [[ ! -S /var/run/docker.sock ]]; then
#    (exec socat UNIX-LISTEN:/var/run/docker.sock,fork,group=docker,umask=007 EXEC:"npiperelay.exe -ep -s //./pipe/docker_engine",nofork &)
# fi
