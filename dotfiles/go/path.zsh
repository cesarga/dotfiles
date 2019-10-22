if [ -d "$GOPATH" ]; then
  export PATH="$GOPATH/bin:$PATH"
elif [[ "$(command -v go)" ]]; then
  export PATH="$(go env GOPATH)/bin:$PATH"
  export GOPATH="$(go env GOPATH)"
fi
