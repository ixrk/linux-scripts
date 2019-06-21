#!/bin/sh

IN_OPT1="-y"
OUT_OPT1="-c:v libvpx-vp9 -b:v 0 -crf 22 -pass 1 -an -f matroska" 

IN_OPT2="-y"
OUT_OPT2="-c:v libvpx-vp9 -b:v 0 -crf 22 -pass 2 -c:a copy -f matroska"

ffmpeg $IN_OPT1 -i "$1" "$OUT_OPT1" "/dev/null"
ffmpeg $IN_OPT2 -i "$1" "$OUT_OPT2" "$2"
