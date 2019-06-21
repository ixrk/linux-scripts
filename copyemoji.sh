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

SELECTED=$(dmenu -i -l 15 -fn "Symbola-16" < $EMOJI_SRC) || exit 1

echo "$SELECTED" | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard &&
notify-send "Emoji copied to clipboard" "$SELECTED"
