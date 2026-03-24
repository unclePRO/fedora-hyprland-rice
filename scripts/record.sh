#!/bin/bash
DIR=~/Videos/ScreenRecords
mkdir -p "$DIR"
PIDFILE=/tmp/record.pid
FILE="$DIR/record-$(date +%Y%m%d-%H%M%S).mp4"

if [ -f "$PIDFILE" ]; then
    # Stop recording
    kill $(cat "$PIDFILE") && rm "$PIDFILE"
    notify-send "Recording stopped" "$FILE"
else
    # Start recording (area)
    wf-recorder -a -g "$(slurp)" -f "$FILE" &
    echo $! > "$PIDFILE"
    notify-send "Recording started" "Press ScrollLock to stop"
fi
