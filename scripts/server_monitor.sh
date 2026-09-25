#!/bin/bash

URL="http://localhost"
LOG_FILE="$HOME/linux-web-server/logs/server_monitor.log"

RESULT=$(curl -s -o /dev/null -w "%{http_code} %{time_total}" --max-time 10 "$URL")
CURL_STATUS=$?

HTTP_CODE=$(echo "$RESULT" | awk '{print $1}')
RESPONSE_TIME=$(echo "$RESULT" | awk '{print $2}')

if [ $CURL_STATUS -eq 0 ] && [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]
then
    echo "$(date '+%Y-%m-%d %H:%M:%S') | Status: UP | HTTP: $HTTP_CODE | Response: ${RESPONSE_TIME}s" | tee -a "$LOG_FILE"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') | Status: DOWN | HTTP: ${HTTP_CODE:-N/A} | Response: ${RESPONSE_TIME:-N/A}s" | tee -a "$LOG_FILE"
fi
