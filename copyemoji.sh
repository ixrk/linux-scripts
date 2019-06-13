#!/bin/sh

SELECTED=$(cat emoji | dmenu)
EMOJI=$(echo $SELECTED | awk '{print $1}')

echo $EMOJI | xclip -selection clipboard &&
notify-send "Emoji copied to clipboard" "$SELECTED"
