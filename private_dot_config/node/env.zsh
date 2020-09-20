if (( $+commands[yarn] ))
then
  PATH="$(yarn global bin):$PATH"
  export PATH
fi
