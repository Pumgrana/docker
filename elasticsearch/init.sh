#!/bin/bash

INDICES=$(curl "http://localhost:9200/_cat/indices?v" 2> /dev/null)
if [ "$INDICES" == "health status index pri rep docs.count docs.deleted store.size pri.store.size " ]; then
    echo "[Init] Initializing db..."
    curl -X PUT -H 'Content-Type: application/json' -d @/schema.json "http://localhost:9200/historical"
    echo -e "\n[Init] Done"
fi
