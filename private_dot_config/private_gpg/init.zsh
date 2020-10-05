socat UNIX-LISTEN:/tmp/wincrypt-hv.sock,fork,mode=777 SOCKET-CONNECT:40:0:x0000x33332222x02000000x00000000,forever,interval=5 &
export SSH_AUTH_SOCK=/tmp/wincrypt-hv.sock
