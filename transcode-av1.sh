#!/bin/sh

IN_OPT1="-y"
OUT_OPT1="-c:a copy -strict experimental -c:v libaom-av1 -b:v 0 -crf 30"
ffmpeg $IN_OPT1 -i "$1" "$OUT_OPT1" "$2"
