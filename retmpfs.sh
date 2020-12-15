#!/bin/sh

sudo mount -o noatime,remount,size="$1" /tmp
