#!/bin/bash

LOG_FILE="/var/log/apache2/access.log"

echo "===== Apache Log Analysis ====="
echo "Analysis Time: $(date)"
echo

TOTAL_REQUESTS=$(sudo wc -l < "$LOG_FILE")
SUCCESS_REQUESTS=$(sudo awk '$9 >= 200 && $9 < 300 {count++} END {print count+0}' "$LOG_FILE")
REDIRECTS=$(sudo awk '$9 >= 300 && $9 < 400 {count++} END {print count+0}' "$LOG_FILE")
CLIENT_ERRORS=$(sudo awk '$9 >= 400 && $9 < 500 {count++} END {print count+0}' "$LOG_FILE")
SERVER_ERRORS=$(sudo awk '$9 >= 500 && $9 < 600 {count++} END {print count+0}' "$LOG_FILE")

echo "Total Requests : $TOTAL_REQUESTS"
echo "Successful     : $SUCCESS_REQUESTS"
echo "Redirects      : $REDIRECTS"
echo "Client Errors  : $CLIENT_ERRORS"
echo "Server Errors  : $SERVER_ERRORS"
echo

echo "===== HTTP Status Codes ====="
sudo awk '$9 ~ /^[0-9]+$/ {print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr

echo
echo "===== Recent Errors ====="
sudo awk '$9 >= 400 {print}' "$LOG_FILE" | tail -5

echo
echo "===== Recent Requests ====="
sudo tail -5 "$LOG_FILE"
