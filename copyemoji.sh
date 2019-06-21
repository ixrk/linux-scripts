#!/bin/sh

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

if [ -f "$HOME/.local/share/emoji" ]
then
	EMOJI_SRC="$HOME/.local/share/emoji"
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
