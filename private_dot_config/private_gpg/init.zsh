#if [[ ! -S "$GNUPGHOME/S.gpg-agent" ]]; then
#  (exec socat UNIX-LISTEN:"$GNUPGHOME/S.gpg-agent,fork" EXEC:"C:/Users/cesar/go/bin/npiperelay.exe -ep -ei -s 'C:/Users/cesar/AppData/Roaming/gnupg/S.gpg-agent'",nofork &)
#fi
