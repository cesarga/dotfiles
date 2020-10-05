if [[ -s "${XDG_CONFIG_HOME}/ssh/config" ]]; then
    export SSH_CONFIG="-F ${XDG_CONFIG_HOME}/ssh/config"
fi

if [ -s "${XDG_CONFIG_HOME}/ssh/id_dsa" ]; then
    export SSH_ID="-i ${XDG_CONFIG_HOME}/ssh/id_dsa"
fi

export SSH_AUTH_SOCK=/tmp/wincrypt-hv.sock
