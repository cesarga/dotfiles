#!/bin/bash
# Bash helper library and tools by A.Schilling:
# https://gitlab-ci-token:hF_Lqs1gVzrpFD48Mye_@gitlab.com/alinex/bash-lib/blob/v1.4.0/README.md

# Automatically combined bash-lib including: core, colors, log

path() {
dirname $(readlink -f "${BASH_SOURCE[-1]:-$(pwd)/x}")
}
usesudo() {
[ $(id -u) -ne 0 ] && sudo -v 2>/dev/null && cmd="sudo" || cmd=""
echo $cmd
}
needsudo() {
[ $(id -u) -eq 0 ] && return 0
sudo -v 2>/dev/null || log_exit ALERT "For this call root rights are needed! Please use another user or allow sudo for user $(whoami)."
for cmd in "$@"; do
sudo -l $cmd >/dev/null || log_exit ALERT "User $(whoami) is not allowed to call 'sudo $cmd', but this is neccessary!"
done
}
[ "$TERM" = "unknown" ] && TERM=''
term=${TERM:-xterm-256color}
_color_text() {
if [ -z "$1" ] && [ ! -t 0 ]; then
cat </dev/stdin
tput -T$term sgr0;
elif [ -n "$1" ] && [ ! "$1" = "+" ]; then
echo -n "$@"
tput -T$term sgr0;
fi
}
black() { tput -T$term setaf 0; _color_text "$@"; }
red() { tput -T$term setaf 1; _color_text "$@"; }
green() { tput -T$term setaf 2; _color_text "$@"; }
yellow() { tput -T$term setaf 3; _color_text "$@"; }
blue() { tput -T$term setaf 4; _color_text "$@"; }
magenta() { tput -T$term setaf 5; _color_text "$@"; }
cyan() { tput -T$term setaf 6; _color_text "$@"; }
white() { tput -T$term setaf 7; _color_text "$@"; }
bg_black() { tput -T$term setab 0; _color_text "$@"; }
bg_red() { tput -T$term setab 1; _color_text "$@"; }
bg_green() { tput -T$term setab 2; _color_text "$@"; }
bg_yellow() { tput -T$term setab 3; _color_text "$@"; }
bg_blue() { tput -T$term setab 4; _color_text "$@"; }
bg_magenta() { tput -T$term setab 5; _color_text "$@"; }
bg_cyan() { tput -T$term setab 6; _color_text "$@"; }
bg_white() { tput -T$term setab 7; _color_text "$@"; }
bold() { tput -T$term bold; _color_text "$@"; }
underline() { tput -T$term smul; _color_text "$@"; }
inverse() { tput -T$term rev; _color_text "$@"; }
dim() { tput -T$term dim; _color_text "$@"; }
reset() { tput -T$term sgr0; }
decolor() {
if [ -z "$1" ] && [ ! -t 0 ]; then
sed 's/\x1B\[[0-9;]*[a-zA-Z]//g;s/\x1B\x28\x42//g' </dev/stdin
else
sed 's/\x1B\[[0-9;]*[a-zA-Z]//g;s/\x1B\x28\x42//g' <<< "$@"
fi
}
[ -n "${_log_level[DEBUG]}" ] && return 0
declare -ar _log_detect=(TRACE DEBUG INFO NOTICE WARN MARK WARNING HEADING ERR ERROR CRIT CRITICAL ALERT EMERG EMERGENCY)
declare -A _log_level
_log_level[TRACE]=5
_log_level[DEBUG]=10
_log_level[INFO]=20
_log_level[NOTICE]=25
_log_level[MARK]=25
_log_level[WARN]=30
_log_level[WARNING]=30
_log_level[HEADING]=35
_log_level[ERR]=40
_log_level[ERROR]=40
_log_level[CRIT]=50
_log_level[CRITICAL]=50
_log_level[ALERT]=60
_log_level[EMERG]=70
_log_level[EMERGENCY]=70
declare -r _log_level
declare -A _log_color
_log_color[TRACE]="$(dim +)"
_log_color[DEBUG]="$(dim +)"
_log_color[INFO]=""
_log_color[NOTICE]="$(green +)"
_log_color[MARK]="$(yellow +)$(inverse +)"
_log_color[WARN]="$(yellow +)"
_log_color[WARNING]="$(yellow +)"
_log_color[HEADING]="$(cyan +)$(inverse +)"
_log_color[ERR]="$(red +)"
_log_color[ERROR]="$(red +)"
_log_color[CRIT]="$(red +)$(bold +)"
_log_color[CRITICAL]="$(red +)$(bold +)"
_log_color[ALERT]="$(red +)$(bold +)$(inverse +)"
_log_color[EMERG]="$(bg_red +)$(bold +)$(white +)"
_log_color[EMERGENCY]="$(bg_red +)$(bold +)$(white +)"
declare -r _log_color
declare -A _syslog_severity
_syslog_severity[TRACE]=7
_syslog_severity[DEBUG]=7
_syslog_severity[INFO]=6
_syslog_severity[NOTICE]=5
_syslog_severity[MARK]=5
_syslog_severity[WARN]=4
_syslog_severity[WARNING]=4
_syslog_severity[HEADING]=4
_syslog_severity[ERR]=3
_syslog_severity[ERROR]=3
_syslog_severity[CRIT]=2
_syslog_severity[CRITICAL]=2
_syslog_severity[ALERT]=1
_syslog_severity[EMERG]=0
_syslog_severity[EMERGENCY]=0
declare -r _syslog_severity
declare -A _log_auto
_log_auto[TRACE]="\b(TRACE|VERBOSE)\b"
_log_auto[DEBUG]="\b(DEBUG|COPYRIGHT|WARRANTY)\b|^\s*(AT|AFTER) "
_log_auto[INFO]="\b(INFO|(START|CALL)(ING)?|TRANSMITTED)\b"
_log_auto[NOTICE]="\b(NOTICE|NOTE|ERFOLGREICH|SUCCEEDED|FINISHED|PASSING)\b"
_log_auto[MARK]="\b(MARK)\b|!!!"
_log_auto[WARN]="\b(WARN)\b|\bW:"
_log_auto[WARNING]="\b(WARNING|MISSING|UNKNOWN|PENDING)\b"
_log_auto[HEADING]="\b(HEADING)\b"
_log_auto[ERR]="\b(ERR)\b|\bE:"
_log_auto[ERROR]="\b(ERROR|FEHLERHAFT|FAILED|FAILING|COMMAND NOT FOUND|PERMISSION DENIED)\b"
_log_auto[CRIT]="\b(CRIT)\b"
_log_auto[CRITICAL]="\b(CRITICAL|FATAL)\b"
_log_auto[ALERT]="\b(ALERT|EXCEPTION)\b|EXCEPTION\b"
_log_auto[EMERG]="\b(EMERG)\b"
_log_auto[EMERGENCY]="\b(EMERGENCY)\b"
declare -r _log_auto
declare -A LOG_AUTO
declare -A _log_rotate_time
_log_rotate_time[DAILY]="+%Y-%m-%d"
_log_rotate_time[WEEKLY]="+%Y_week_%W"
_log_rotate_time[MONTHLY]="+%Y-%m"
declare -r _log_rotate_time
declare -u LOG_LEVEL_DEFAULT=${LOG_LEVEL_DEFAULT:-AUTO}
LOG_TAG=${LOG_TAG:-$(basename -- "$0")}
LOG_DATE_FORMAT=${LOG_DATE_FORMAT:-"+%Y-%m-%d %H:%M:%S"}
declare -u LOG_LEVEL=${LOG_LEVEL:-INFO}
declare -u LOG_CONSOLE
trap '7>&-' EXIT
log_init() {
if [ -z "$LOG_CONSOLE" ] && [ -z "$LOG_FILE" ] && [ -z "$SYSLOG_FACILITY" ]; then
LOG_CONSOLE='SIMPLE'
fi
if [ -n "$LOG_CONSOLE" ] &&[ "$LOG_CONSOLE" != "SIMPLE" ] && [ "$LOG_CONSOLE" != "FULL" ]; then
echo $(red "Console output to $LOG_CONSOLE undefined, only SIMPLE or FULL are allowed.") >&2
echo "Logging in SIMPLE format by default." >&2
LOG_CONSOLE='SIMPLE'
fi
if [ -n "$LOG_FILE" ] && [ -n "$SYSLOG_FACILITY" ]; then
echo $(red "You must specify a LOG_FILE path or SYSLOG_FACILITY name, but not both.") >&2
echo "Logging to console by default." >&2
unset LOG_FILE
unset SYSLOG_FACILITY
LOG_CONSOLE='SIMPLE'
fi
if [ -n "$LOG_FILE" ]; then
if [ ! -r "$LOG_FILE" ]; then
mkdir -p $(dirname $LOG_FILE) && touch "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
echo $(red "Could not create $LOG_FILE.") >&2
echo "Logging to console by default." >&2
unset LOG_FILE
LOG_CONSOLE='SIMPLE'
fi
fi
exec 7>> $LOG_FILE
fi
}
if [ -z "$LOG_FILE" ] && [ -n "$SYSLOG_FACILITY" ]; then
if [[ "$SYSLOG_FACILITY" != local[0-7] ]]; then
red "Only facilities local0 through local7 are supported for syslog." >&2
red "Logging to local0 by default." >&2
SYSLOG_FACILITY='local0'
fi
SYSLOG_FACILITY=$SYSLOG_FACILITY
fi
if [ -n "$LOG_ROTATE_TIME" ]; then
declare -u LOG_ROTATE_TIME
if [ -z "${_log_rotate_time[$LOG_ROTATE_TIME]}" ]; then
echo $(red "\"$LOG_ROTATE_TIME\" is not a valid LOG_ROTATE_TIME value at $LOG_TAG line ${BASH_LINENO[0]}. Defaulting to \"DAILY\".") >&2
LOG_ROTATE_TIME="DAILY"
fi
declare -r LOG_ROTATE_TIME
fi
declare -i LOG_ROTATE_SIZE
declare -r LOG_ROTATE_SIZE
declare -i LOG_ROTATE_NUM=${LOG_ROTATE_NUM:-9}
declare -r LOG_ROTATE_NUM
log () {
[ -n "$LOG_FILE" ] && LOG_FILE=$(readlink -m "$LOG_FILE")
if [ -z "${_log_level[$LOG_LEVEL]}" ]; then
echo $(red "\"$LOG_LEVEL\" is not a valid LOG_LEVEL at $LOG_TAG line ${BASH_LINENO[0]}. Defaulting to \"INFO\".") >&2
LOG_LEVEL="INFO"
fi
if [ -e "$LOG_FILE" ]; then
if [ -n "$LOG_ROTATE_TIME" ]; then
local file_date=$(date -d "$(stat -c %y $LOG_FILE)" ${_log_rotate_time[$LOG_ROTATE_TIME]})
local today=$(date ${_log_rotate_time[$LOG_ROTATE_TIME]})
if [ "$file_date" != "$today" ]; then
mv "$LOG_FILE" "$LOG_FILE.$file_date"
[ -n "$LOG_ROTATE_COMPRESS" ] && gzip -q --best "$LOG_FILE.$file_date"
fi
elif [ -n "$LOG_ROTATE_SIZE" ]; then
local file_size=$(du -b "$LOG_FILE" | tr -s '\t' ' ' | cut -d' ' -f1)
if [ $file_size -ge $LOG_ROTATE_SIZE ]; then
for i in `seq $((LOG_ROTATE_NUM-1)) -1 1`; do
[ -e "$LOG_FILE.$i" ] && mv "$LOG_FILE.$i" "$LOG_FILE.$((i+1))"
[ -e "$LOG_FILE.$i.gz" ] &&  mv "$LOG_FILE.$i.gz" "$LOG_FILE.$((i+1)).gz"
done
mv "$LOG_FILE" "$LOG_FILE.1"
[ -n "$LOG_ROTATE_COMPRESS" ] && gzip -q --best "$LOG_FILE.1"
fi
fi
fi
declare -u message_level=${1:-$LOG_LEVEL_DEFAULT}
if [ ! "${message_level:0:4}" = "AUTO" ] && [ -z "${_log_level[$message_level]}" ]; then
echo $(red "\"${message_level}\" is not a valid message log level at $LOG_TAG line ${BASH_LINENO[0]}. ") >&2
exit 1
fi
if [ "${message_level:0:4}" = "AUTO" ] && [ "${message_level:4:1}" = "_" ] && [ -z "${_log_level[${message_level:5:10}]}" ]; then
echo $(red "\"${message_level}\" is not a valid auto message log level at $LOG_TAG line ${BASH_LINENO[0]}. ") >&2
exit 1
fi
log_init
if [ -z "$2" ] && [ ! -t 0 ]; then
while read line; do
_log "$message_level" "$line" </dev/null
done </dev/stdin
else
echo "${@:2}" |
while read -r line; do
_log "$message_level" "$line" </dev/null
done
fi
exec 7>&-
}
_log() {
IFS=$'\n'
local message=$(decolor $2)
declare -u message_check=$message
message=$( sed 's/^\[[A-Z][A-Z]* *\] //' <<< "$message" )
local message_date
message_date=$(date "${LOG_DATE_FORMAT}")
declare -u message_level=${1:-AUTO}
if [ "${message_level:0:4}" = "AUTO" ]; then
min=${_log_level[TRACE]}
if [ "${message_level:4:1}" = "_" ]; then
min=${_log_level[${message_level:5:10}]}
message_level="${message_level:5:10}"
else
message_level="TRACE"
fi
for i in "${_log_detect[@]}"
do
if [[ "$message_check" =~ ${_log_auto[$i]} ]] && [ ${_log_level[$i]} -gt $min ] ; then
message_level=$i
fi
if [ -n "${LOG_AUTO[$i]}" ]; then
LOG_AUTO[$i]=$( echo ${LOG_AUTO[$i]} | perl -pe 's/(\\[bsSdDwW])|([a-z])/\1\U\2\E/g')
if [[ "$message_check" =~ ${LOG_AUTO[$i]} ]] && [ ${_log_level[$i]} -gt $min ] ; then
message_level=$i
fi
fi
done
fi
local max_log_level=${_log_level[$LOG_LEVEL]}
if [ ${_log_level[$message_level]} -ge $max_log_level ]; then
fn=${FUNCNAME[2]}
[ "${fn:0:4}" = "log_" ] && fn=${FUNCNAME[3]}
if [ -n "$SYSLOG_FACILITY" ]; then
for line in $message; do
logger -i -t "$LOG_TAG:$fn" -p "${SYSLOG_FACILITY}.${_syslog_severity[$message_level]}" "$message_level: $line"
done
else
for line in $message; do
[ "$message_level" = "HEADING" ] && printf -v line "%-80s" $line
printf -v output "${_log_color[$message_level]}%s %s[%s] %s: %s$(reset)" "$message_date" "$LOG_TAG:$fn" "$$" "$message_level" "$line"
[ -n "$LOG_FILE" ] && echo "$output" >&7
if [ -n "$LOG_CONSOLE" ]; then
if [ "$LOG_CONSOLE" = "SIMPLE" ]; then
printf -v output "$(black +)[%-9s]$(reset) %s" "$message_level" "${_log_color[$message_level]}$line$(reset)"
fi
echo "$output" >&2
fi
done
fi
fi
}
log_exit() {
if [ "$#" -lt 2 ]; then
log ALERT "parameter missing. Usage: log_exit <level> <message> [<code>]"
exit 1
fi
log "$1" "$2"
local code="${3:-1}"
exit "$code"
}
log_cmd() {
[ "$#" -lt 1 ] && log_exit ALERT "parameter missing. Usage: log_cmd <cmd> [<args>...]"
LOG_CMD_LEVEL=${LOG_CMD_LEVEL:-AUTO}
local cmd="$1"
local call=$(printf "%q " "$@")
[ -n "$LOG_CMD_QUIET" ] || log $LOG_CMD_LEVEL "calling: $call"
exec 5>&1
set -o pipefail
$call 1> >(tee >(log ) ) 2> >(log AUTO_WARN >&2 )
code=$?
exec 5>&-
sleep 1
if [ $code -eq 0 ]; then
[ -n "$LOG_CMD_QUIET" ] || log $LOG_CMD_LEVEL "$cmd call succeeded"
else
log ERROR "$cmd exited with return code $code"
fi
return $code
}
