#!/bin/bash
cd /opt/postal/app
status=$(/opt/postal/app/bin/postal status)
if [ "$#" -lt 1 ]; then
  #Postal server start time
  started=$(echo "${status}" | grep 'Started' | xargs | cut -d ' ' -f 2,3 | cut -d 'm' -f 2)
  echo "$started"
  exit
fi
#Process status
process=$(echo "$status" | grep "$1" | xargs | cut -d ' ' -f 4 | cut -d 'm' -f 2)
echo "$process"
