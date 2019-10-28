 if [[ ! -S "$GNUPGHOME/S.gpg-agent" ]]; then
  (exec socat UNIX-LISTEN:"$GNUPGHOME/S.gpg-agent,fork" EXEC:"npiperelay.exe -ep -ei -s 'C:/Users/Cesar/AppData/Roaming/gnupg/S.gpg-agent'",nofork &)
 fi
