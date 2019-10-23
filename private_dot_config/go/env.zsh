if [[ -d "$GOPATH" ]]; then
  export PATH="$GOPATH/bin:$PATH"
elif [[ "$(command -v go)" ]]; then
  export GOPATH="$(go env GOPATH)"
fi

export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
