#!/bin/sh
#            Show Geo Data of Connected Shoutcast Connections

# 20220128 - jamey hopkins

PORT=8000 # sc default port

SERVER=`netstat -nputw 2>/dev/null | grep $PORT | grep ESTABLISHED | awk '{ print $5 }' | cut -f1 -d: | grep -v 127.0.0.1  | sort -n | xargs echo `
for S in `echo $SERVER`; do
  echo $S
  curl -s https://ipinfo.io/$S | grep "city\|region\|country\|timezone" | xargs echo
  echo
done

