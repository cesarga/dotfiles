if [[ ! -S "$GNUPGHOME/S.gpg-agent.ssh" ]]; then
  (exec socat UNIX-LISTEN:"$GNUPGHOME/S.gpg-agent.ssh,fork" EXEC:"npiperelay.exe -ep -ei -s 'C:/Users/Cesar/AppData/Roaming/gnupg/S.gpg-agent.ssh'",nofork &)
fi

eval $("$HOME/libs/weasel-pageant/weasel-pageant" -rb -a '/tmp/S.weasel-pageant' -H '/z/.wsl/weasel-pageant-1.4/helper.exe') 2>&1 >/dev/null
