# Pipe my public key to my clipboard.
alias pubkey="more {$XDG_CONFIG_HOME}/ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias ssh="ssh ${SSH_CONFIG} ${SSH_ID}"
alias ssh-copy-id="ssh-copy-id ${SSH_ID}"
