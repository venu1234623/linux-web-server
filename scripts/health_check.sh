#!/bin/bash

echo "======================================"
echo "       LINUX SERVER HEALTH CHECK"
echo "======================================"

echo
echo "1. Apache Service Status"
if sudo service apache2 status > /dev/null 2>&1; then
    echo "Status: RUNNING"
else
    echo "Status: NOT RUNNING"
fi

echo
echo "2. HTTP Availability"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 http://localhost)

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "Status: UP"
    echo "HTTP Code: $HTTP_CODE"
else
    echo "Status: DOWN"
    echo "HTTP Code: ${HTTP_CODE:-N/A}"
fi

echo
echo "3. Port 80"
if sudo ss -tulpn | grep -q ":80"; then
    echo "Status: LISTENING"
else
    echo "Status: NOT LISTENING"
fi

echo
echo "4. System Resources"

CPU_LOAD=$(awk '{print $1}' /proc/loadavg)
MEMORY=$(free | awk '/Mem:/ {printf "%.1f", $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "CPU Load: $CPU_LOAD"
echo "Memory Usage: ${MEMORY}%"
echo "Disk Usage: ${DISK}%"

echo
echo "5. Recent Apache Errors"

ERROR_COUNT=$(sudo grep -i "\[.*:error\]" /var/log/apache2/error.log | tail -10 | wc -l)

if [ "$ERROR_COUNT" -eq 0 ]; then
    echo "No recent Apache errors found."
else
    echo "Recent Apache errors: $ERROR_COUNT"
    sudo grep -i "\[.*:error\]" /var/log/apache2/error.log | tail -5
fi

echo
echo "======================================"
echo "Health check completed: $(date)"
echo "======================================"
