#if [[ $(command -v '/z/.wsl/weasel-pageant-1.4/helper.exe' ) ]]; then
#  eval $("$HOME/libs/weasel-pageant/weasel-pageant" -rb -a '/tmp/S.weasel-pageant' -H '/z/.wsl/weasel-pageant-1.4/helper.exe') 2>&1 >/dev/null
#fi

eval $("$HOME/libs/weasel-pageant/weasel-pageant" -rb -a '/tmp/S.weasel-pageant' -H '/z/.wsl/weasel-pageant-1.4/helper.exe') 2>&1 >/dev/null
#eval $(/z/.wsl/weasel-pageant-1.4/weasel-pageant -b -r -a '/tmp/S.weasel-pageant') 2>&1 >/dev/null
