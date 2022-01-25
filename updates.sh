#!/bin/bash
#re-archive the scripts and update the checksums, etc.
tar -czvf skywire-deb-scripts.tar.gz skywire-deb-scripts
tar -czvf skywire-scripts.tar.gz skywire-scripts
updpkgsums cc.deb.PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
#git add -f cc.deb.PKGBUILD PKGBUILD .SRCINFO skywire-scripts.tar.gz skywire-deb-scripts.tar.gz
