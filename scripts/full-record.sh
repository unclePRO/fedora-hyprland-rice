#!/bin/bash
DIR=~/Videos/ScreenRecords
mkdir -p "$DIR"
PIDFILE=/tmp/full-record.pid
FILE="$DIR/full-$(date +%Y%m%d-%H%M%S).mp4"

if [ -f "$PIDFILE" ]; then
    kill $(cat "$PIDFILE") && rm "$PIDFILE"
    notify-send "Full screen recording stopped"
else
    wf-recorder -a -f "$FILE" &
    echo $! > "$PIDFILE"
    notify-send "Full screen recording started"
fi
