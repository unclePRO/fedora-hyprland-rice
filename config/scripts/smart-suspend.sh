#!/bin/bash

# Check if the system is on AC power
# The folder name (e.g., AC or ACAD) might vary slightly in /sys/class/power_supply/
if grep -q 1 /sys/class/power_supply/AC*/online; then
    echo "Plugged in. Skipping suspend."
    exit 0
else
    echo "On battery. Suspending..."
    systemctl suspend
fi
