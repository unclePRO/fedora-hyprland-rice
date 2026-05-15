#!/bin/bash

# Look for the exact background process running your specific hotspot
if pgrep -f "create_ap.*unclehypr" > /dev/null; then
    # If it's running, kill it
    sudo create_ap --stop wlp1s0
    notify-send "Hotspot" "unclehypr Disabled" -i network-wireless
else
    # If it's not running, start it
    sudo create_ap wlp1s0 wlp1s0 unclehypr 12344321 --daemon
    notify-send "Hotspot" "unclehypr Enabled" -i network-wireless
fi
