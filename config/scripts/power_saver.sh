#!/bin/bash

STATE_FILE="/tmp/hypr_power_save"

enable_power_save() {
    # Strip away all graphical load
    hyprctl keyword animations:enabled 0
    hyprctl keyword decoration:rounding 0
    hyprctl keyword decoration:blur:enabled 0
    hyprctl keyword decoration:drop_shadow 0

    touch $STATE_FILE
    notify-send "⚡ Power Saver ON" "Animations and blur disabled." -u normal
}

disable_power_save() {
    # Reloading the config perfectly restores your custom rounding and blur values
    hyprctl reload

    rm -f $STATE_FILE
    notify-send "🔥 Power Saver OFF" "Performance mode restored." -u normal
}

# Toggle logic
if [ -f "$STATE_FILE" ]; then
    disable_power_save
else
    enable_power_save
fi
