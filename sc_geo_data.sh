#!/bin/sh
#            Show Geo Data of Connected Shoutcast Connections

# 20220128 - jamey hopkins
# 20220603 jah - merge source info to single line of output.  get rid of spacing between lines.

PORT=8000 # sc default port

SERVER=`netstat -nputw 2>/dev/null | grep $PORT | grep ESTABLISHED | awk '{ print $5 }' | cut -f1 -d: | grep -v 127.0.0.1  | sort -n | xargs echo `
for S in `echo $SERVER`; do
  echo -n "$S\t"
  curl -s https://ipinfo.io/$S | grep "city\|region\|country\|timezone" | xargs echo
done

