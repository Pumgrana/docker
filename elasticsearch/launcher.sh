#!/bin/bash

if [ ! -f /init.sh ]; then exit; fi

## "Waiting for ElasticSearch to respond..."
RESPONCE=1
while [ "$RESPONCE" -ne 0 ]; do
    curl "http://localhost:9200" >> /dev/null 2>&1
    RESPONCE="$?"
    sleep 1
done

## Then run init
/init.sh
