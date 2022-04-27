#!/bin/sh
#            Show Geo Data of Connected Shoutcast Connections

# 20220128 - jamey hopkins
#
# $ ./sc_geo_data.sh | grep city
# city: London, region: England, country: GB, timezone: Europe/London,
# city: Phoenix, region: Arizona, country: US, timezone: America/Phoenix,
# city: Borken, region: North Rhine-Westphalia, country: DE, timezone: Europe/Berlin,
# city: Falkenstein, region: Saxony, country: DE, timezone: Europe/Berlin,
# city: Des Moines, region: Washington, country: US, timezone: America/Los_Angeles,
# city: Iztapalapa, region: Mexico City, country: MX, timezone: America/Mexico_City,

PORT=8000 # sc default port

SERVER=`netstat -nputw 2>/dev/null | grep $PORT | grep ESTABLISHED | awk '{ print $5 }' | cut -f1 -d: | grep -v 127.0.0.1  | sort -n | xargs echo `
for S in `echo $SERVER`; do
  echo $S
  curl -s https://ipinfo.io/$S | grep "city\|region\|country\|timezone" | xargs echo
  echo
done

