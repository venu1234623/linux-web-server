#!/bin/bash

LOG_FILE="/var/log/apache2/error.log"

echo "===== Apache Error Log Analysis ====="
echo "Analysis Time: $(date)"
echo

ERRORS=$(sudo grep -i "\[.*:error\]" "$LOG_FILE" | wc -l)
WARNINGS=$(sudo grep -i "\[.*:warn\]" "$LOG_FILE" | wc -l)
NOTICES=$(sudo grep -i "\[.*:notice\]" "$LOG_FILE" | wc -l)

echo "Errors   : $ERRORS"
echo "Warnings : $WARNINGS"
echo "Notices  : $NOTICES"

echo
echo "===== Recent Errors ====="

RECENT_ERRORS=$(sudo grep -i "\[.*:error\]" "$LOG_FILE" | tail -5)

if [ -n "$RECENT_ERRORS" ]; then
    echo "$RECENT_ERRORS"
else
    echo "No Apache errors found."
fi

echo
echo "===== Recent Warnings ====="

RECENT_WARNINGS=$(sudo grep -i "\[.*:warn\]" "$LOG_FILE" | tail -5)

if [ -n "$RECENT_WARNINGS" ]; then
    echo "$RECENT_WARNINGS"
else
    echo "No Apache warnings found."
fi
