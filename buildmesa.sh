#!/bin/sh

PKGDIR="$HOME/devel/pkg"
cd "$PKGDIR" || exit

asp update mesa lib32-mesa

[ ! -d mesa ] && asp checkout mesa
cd "$PKGDIR/mesa/repos/extra-x86_64" || exit
git pull
makepkg -sic --noconfirm

[ ! -d lib32-mesa ] && asp checkout lib32-mesa
cd "$PKGDIR/lib32-mesa/repos/multilib-x86_64" || exit
git pull
makepkg -sic --noconfirm

