#!/usr/bin/env bash

exists () {
  [[ -e "$*" ]]
}

#noexists () {
#  ! exists "$@"
#}

exists-file () {
  [[ -f "$*" ]]
}

#noexists-file () {
#  ! exists-file "$*"
#}

exists-dir () {
  [[ -d "$*" ]]
}

#noexists-dir () {
#  ! exists-dir "$*"
#}

exists-socket () {
  [[ -S "$*" ]]
}

#noexists-socket () {
#  ! exists-socket "$*"
#}

exists-exec () {
  [[ $(command -v "$*") ]]
}

#noexists-exec () {
#  ! exists-exec "$*"
#}
