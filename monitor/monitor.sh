#!/usr/bin/env bash

options="enable monitor\nset monitor brightness\ndisable monitor"

selected_option=$(printf "$options" | fzf)

if [ -z "$selected_option" ]; then
    exit 0
fi

selected_monitor=$(xrandr | grep  " connected" | awk '{print $1}' | fzf)

if [ -z "$selected_monitor" ]; then
    exit 0
fi


if [ "$selected_option" = "enable monitor"   ]; then
    xrandr --output $selected_monitor --auto
    exit 0
fi

if [ "$selected_option" = "set monitor brightness"   ]; then
    read -p "Enter brightness value: " brightness_value
    xrandr --output $selected_monitor --brightness $brightness_value
    exit 0
fi

if [ "$selected_option" = "disable monitor"   ]; then
    xrandr --output $selected_monitor --off
    exit 0
fi
