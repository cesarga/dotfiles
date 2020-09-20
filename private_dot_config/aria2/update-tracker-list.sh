#!/bin/bash

ARIA2_CONF_FILE="${XDG_CONFIG_HOME}/aria2/aria2.conf"
ARIA2_TRACKER_LIST="$(curl -s 'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt' |  sed ':a;N;$!ba;s/\n\n/,/g')"
ARIA2_TRACKER_LINE="bt-tracker=\"$ARIA2_TRACKER_LIST\""

if [[ -z "$(grep 'bt-tracker=' "${ARIA2_CONF_FILE}")" ]]; then
  sed -i "s#bt\-tracker=.*#$ARIA2_TRACKER_LINE#g" "${ARIA2_CONF_FILE}"
else
  echo "$ARIA2_TRACKER_LINE" >> "${ARIA2_CONF_FILE}"
fi
