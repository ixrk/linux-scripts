#!/bin/sh

ffmpeg -i "$2" -vf "select=gte(n\,$1)" -vframes 1 "$3"
