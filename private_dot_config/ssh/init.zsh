#eval $(/z/.wsl/weasel-pageant-1.4/weasel-pageant -q -b -r -a '/tmp/S.weasel-pageant')

#if [[ ! -f "$GNUPGHOME/S.gpg-agent" ]]; then
#  (exec socat UNIX-LISTEN:"$GNUPGHOME/S.gpg-agent,fork" EXEC:"C:/Users/cesar/go/bin/npiperelay.exe -ep -ei -s 'C:/Users/cesar/AppData/Roaming/gnupg/S.gpg-agent'",nofork &)
#fi

#if [[ ! -f "$GNUPGHOME/S.gpg-agent.ssh" ]]; then
#  (exec socat UNIX-LISTEN:"$GNUPGHOME/S.gpg-agent.ssh,fork" EXEC:"C:/Users/cesar/go/bin/npiperelay.exe -ep -ei -s 'C:/Users/cesar/AppData/Roaming/gnupg/S.gpg-agent.ssh'",nofork &)
#fi
