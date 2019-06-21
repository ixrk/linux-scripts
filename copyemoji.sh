#!/bin/sh

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

if [ -f "$XDG_DATA_HOME/emoji" ]
then
	EMOJI_SRC="$XDG_DATA_HOME"
elif [ -f "$SCRIPT_DIR/emoji" ]
then
	EMOJI_SRC="$SCRIPT_DIR/emoji"
elif [ -f /usr/share/linux-scripts/emoji ]
then
	EMOJI_SRC="/usr/share/linux-scripts/emoji"
else
	echo "could not access emoji list"
	exit 2
fi

SELECTED=$(cat "$EMOJI_SRC" | dmenu -i -l 15 -fn "Symbola-16") || exit 1
EMOJI=$(echo $SELECTED | awk '{print $1}')

echo $EMOJI | tr -d '\n' | xclip -selection clipboard &&
notify-send "Emoji copied to clipboard" "$SELECTED"
