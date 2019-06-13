#!/bin/sh

PKGDIR=~/dev/pkg
cd $PKGDIR || exit 1
rm -Rf $*
asp update $*
asp checkout $*

for pkg in $*
do
    cd $PKGDIR/"$pkg"/trunk || exit 2
    makepkg -sCf --noconfirm PKGDEST="$(realpath ..)"
done
