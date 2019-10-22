# Mount Windows drive to root subdirectory
winmount() {
  local MNT_DRIVE="$(echo "$1" | awk '{print toupper($0)}'):"
  local MNT_DIR="/$(echo "$1" | awk '{print tolower($0)}')"

  if [[ -d "$MNT_DIR" ]]; then
      sudo umount "$MNT_DIR"
  else
    mkdir -p "$MNT_DIR"
  fi

  sudo mount -t drvfs "$MNT_DRIVE" "$MNT_DIR"
}

# Open with IDE
[[ "$(whence -w phpstorm)" = "phpstorm: function" ]] && unset -f phpstorm
phpstorm() {
  local PROGRAM_PATH="$(wslpath -u 'C:\Users\cesar\AppData\Local\JetBrains\Toolbox\apps\PhpStorm\ch-0\192.5728.108\bin\phpstorm64.exe')"
  "$PROGRAM_PATH" "$(wslpath -w "$@")"
}
alias code='phpstorm'

# Open in DOpus
[[ "$(whence -w opus)" = "opus: function" ]] && unset -f opus
opus() {
  local PROGRAM_PATH="$(wslpath -u 'C:\Program Files\GPSoftware\Directory Opus\dopus.exe')"
  local TARGET

  if [[ "$@" == '.' ]]; then
    TARGET="$(pwd)"
  else
    TARGET="$@"
  fi

  "$PROGRAM_PATH" /cmd Go "$(wslpath -w "$TARGET")"
}
alias open='opus'
