if [[ $(command -v '/c/weasel-pageant-helper.exe' ) ]]; then
  eval $("$HOME/libs/weasel-pageant/weasel-pageant" -b -r -a '/tmp/S.weasel-pageant' -H '/z/.wsl/weasel-pageant-1.4/helper.exe') 2>&1 >/dev/null
fi
