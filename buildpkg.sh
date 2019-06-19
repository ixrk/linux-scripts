#!/bin/sh

PKGDIR=~/dev/pkg
cd $PKGDIR || exit 1
rm -Rf "$@"
asp update "$@"
asp checkout "$@"

for pkg in "$@"
do
	cd $PKGDIR || exit 1
	mkdir -pv "$pkg-src"
	SRCDEST="$(realpath "$pkg-src")"
	cd "$pkg"/trunk || exit 2
	makepkg -sCf --noconfirm PKGDEST="$(realpath ..)" SRCDEST="$SRCDEST"
done
