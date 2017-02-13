#!/bin/bash

if [ "$#" -ne "2" ]; then
    echo "Usage: $0 index file_to_insert"
    exit 418
fi

HOST="http://localhost:9200"
INDEX=$1
FILE=$2

URL=$HOST/$INDEX/history
echo "curl -X POST -d @$FILE $URL"
curl -X POST -d @$FILE $URL
