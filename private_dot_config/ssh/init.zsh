if [[ $(command -v '/c/weasel-pageant-helper.exe' ) ]]; then
  eval $("$HOME/libs/weasel-pageant/weasel-pageant" -b -r -a '/tmp/S.weasel-pageant' -H '/c/weasel-pageant-helper.exe') 2>&1 >/dev/null
fi
