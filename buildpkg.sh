#!/bin/sh

PKGDIR=~/dev/pkg
cd $PKGDIR || exit 1
rm -Rf "$@"
asp update "$@"
asp checkout "$@"

for pkg in "$@"
do
	mkdir -p "$pkg-src"
	SRCDEST="$(realpath "$pkg-src")"
	cd $PKGDIR/"$pkg"/trunk || exit 2
	makepkg -sCf --noconfirm PKGDEST="$(realpath ..)" SRCDEST="$SRCDEST"
done
