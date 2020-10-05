#eval $(/z/.wsl/weasel-pageant-1.4/weasel-pageant -q -b -r -a '/tmp/S.weasel-pageant')

#if [[ ! -f "$GNUPGHOME/S.gpg-agent" ]]; then
#  (exec socat UNIX-LISTEN:"$GNUPGHOME/S.gpg-agent,fork" EXEC:"C:/Users/cesar/go/bin/npiperelay.exe -ep -ei -s 'C:/Users/cesar/AppData/Roaming/gnupg/S.gpg-agent'",nofork &)
#fi

#if [[ ! -f "$GNUPGHOME/S.gpg-agent.ssh" ]]; then
#  (exec socat UNIX-LISTEN:"$GNUPGHOME/S.gpg-agent.ssh,fork" EXEC:"C:/Users/cesar/go/bin/npiperelay.exe -ep -ei -s 'C:/Users/cesar/AppData/Roaming/gnupg/S.gpg-agent.ssh'",nofork &)
#fi

if [[ "$(command -v socat)" ]]; then
  if [[ -e /tmp/wincrypt-hv.sock ]]; then
    rm -rf /tmp/wincrypt-hv.sock
  fi
  (socat UNIX-LISTEN:/tmp/wincrypt-hv.sock,fork,mode=777 SOCKET-CONNECT:40:0:x0000x33332222x02000000x00000000,forever,interval=5 &)
fi
