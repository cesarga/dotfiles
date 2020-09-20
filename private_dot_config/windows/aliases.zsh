#
# Drives
#

winmount() {
  local MNT_DRIVE;
  local MNT_DIR;

  MNT_DRIVE="$(echo "$1" | awk '{print toupper($0)}'):"
  MNT_DIR="/$(echo "$1" | awk '{print tolower($0)}')"

  sudo umount "$MNT_DIR" >/dev/null 2>&1
  sudo mount -t drvfs "$MNT_DRIVE" "$MNT_DIR"
}


#
# IDEs
#

phpstorm() {
  local PHPSTORM;
  PHPSTORM=$(find '/c/Users/cesar/AppData/Local/JetBrains/Toolbox/apps/PhpStorm/ch-0' -type f -name phpstorm64.exe | tail -1)

  $PHPSTORM "$(wslpath -w "$@")"
}

alias code='phpstorm'


#
# Explorers
#

opus() {
  local OPUS
  local TARGET
  OPUS='/c/Program Files/GPSoftware/Directory Opus/dopus.exe'

  if [[ "$*" == '.' ]]; then
    TARGET="$(pwd)"
  else
    TARGET="$*"
  fi

  "$OPUS" /cmd Go "$(wslpath -w "$TARGET")"
}

alias open='opus'
