#/bin/sh

transmission-remote -a "$@" && notify-send "Torrent added"
