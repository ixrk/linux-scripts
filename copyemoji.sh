#!/bin/sh

SELECTED=$(cat emoji | dmenu -i -l 15 -fn "Symbola-16") || exit 1
EMOJI=$(echo $SELECTED | awk '{print $1}')

echo $EMOJI | tr -d '\n' | xclip -selection clipboard &&
notify-send "Emoji copied to clipboard" "$SELECTED"
