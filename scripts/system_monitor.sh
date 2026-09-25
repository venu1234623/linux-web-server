#!/bin/bash

LOG_FILE="$HOME/linux-web-server/logs/system_monitor.log"

CPU_LOAD=$(awk '{print $1}' /proc/loadavg)
MEMORY=$(free | awk '/Mem:/ {printf "%.1f", $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

STATUS="OK"

if (( $(echo "$MEMORY > 80" | bc -l) )); then
    STATUS="WARNING: High Memory Usage"
fi

if [ "$DISK" -gt 80 ]; then
    STATUS="WARNING: High Disk Usage"
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') | Status: $STATUS | CPU Load: $CPU_LOAD | Memory Usage: ${MEMORY}% | Disk Usage: ${DISK}%" | tee -a "$LOG_FILE"
