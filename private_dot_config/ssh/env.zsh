if [[ -s "${XDG_CONFIG_HOME}/ssh/config" ]]; then
    export SSH_CONFIG="-F ${XDG_CONFIG_HOME}/ssh/config"
fi

if [ -s "${XDG_CONFIG_HOME}/ssh/id_dsa" ]; then
    export SSH_ID="-i ${XDG_CONFIG_HOME}/ssh/id_dsa"
fi

alias ssh="ssh ${SSH_CONFIG} ${SSH_ID}"
alias ssh-copy-id="ssh-copy-id ${SSH_ID}"
