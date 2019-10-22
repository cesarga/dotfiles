# sup yarn
# https://yarnpkg.com

if (( $+commands[yarn] ))
then
  export PATH="$(yarn global bin):$PATH"
fi
