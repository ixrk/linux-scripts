#!/bin/sh

IN_OPT1=-y
OUT_OPT1=-c:a copy -c:v libx264 -crf 17 -preset slow

ffmpeg $IN_OPT1 -i "$1" "$OUT_OPT1" "$2"
