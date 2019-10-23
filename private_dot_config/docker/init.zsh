# if [[ ! -S /var/run/docker.sock ]]; then
#    (exec socat UNIX-LISTEN:/var/run/docker.sock,fork,group=docker,umask=007 EXEC:"npiperelay.exe -ep -s //./pipe/docker_engine",nofork &)
# fi

if [[ ! $(sudo service docker status | grep 'is running') ]]; then
  sudo service docker start
fi
