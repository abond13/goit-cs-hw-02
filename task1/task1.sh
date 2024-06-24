#!/bin/bash

sites=("https://google.com" "https://facebook.com" "https://twitter.com")
log="website_status.log"

>$log
for site in "${sites[@]}"
do
    if [[ "$(curl -s -L -o /dev/null -w '%{http_code}' $site)" == "200" ]]
    then
      echo "[$site](<$site>) is UP" >>$log
    else
      echo "[$site](<$site>) is DOWN" >>$log
    fi
done

cat $log