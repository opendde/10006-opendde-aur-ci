#!/bin/bash
#re-archive the scripts and update the checksums, etc.
#NOTE THAT THIS EXPECTS THE SCRIPTS HAVE BEEN EDITED LOCALLY
#git pull and tar -xf skywire-scripts.tar.gz before commiting and pushing
tar -hczvf skywire-scripts.tar.gz skywire-scripts
#reset the pkgver to autogenerated
_version=$(git ls-remote --tags --refs --sort="version:refname" https://github.com/skycoin/skywire.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
#Uncomment to use release candidates during pre-release testing
#_vrc=$(git ls-remote --tags --refs --sort="version:refname" https://github.com/skycoin/skywire.git | tail -n1 | grep -- -rc)
#if [[ $_vrc != "" ]]; then
#	_vrc="-${_vrc##*-}"
#fi
echo ${_version}
echo ${_vrc}
echo "updating checksums and version for PKGBUILD"
sed -i "s/^pkgver=.*/pkgver='${_version}'/" PKGBUILD && sed -i "s/^_rc=.*/_rc='${_vrc}'/" PKGBUILD && updpkgsums
echo "updating checksums and version for cc.deb.PKGBUILD"
[[ -f cc.deb.PKGBUILD ]] && sed -i "s/^pkgver=.*/pkgver='${_version}'/" cc.deb.PKGBUILD && sed -i "s/^_rc=.*/_rc='${_vrc}'/" cc.deb.PKGBUILD && updpkgsums cc.deb.PKGBUILD && _ccdebPKGBUILD="cc.deb.PKGBUILD"
echo "updating checksums and version for deb.PKGBUILD"
[[ -f deb.PKGBUILD ]] && sed -i "s/^pkgver=.*/pkgver='${_version}'/" deb.PKGBUILD && sed -i "s/^_rc=.*/_rc='${_vrc}'/" deb.PKGBUILD  && updpkgsums deb.PKGBUILD && _debPKGBUILD="deb.PKGBUILD"
echo "updating checksums and version for dev.PKGBUILD"
[[ -f dev.PKGBUILD ]] && sed -i "s/^pkgver=.*/pkgver='autogenerated'/" dev.PKGBUILD && updpkgsums dev.PKGBUILD && _devPKGBUILD="dev.PKGBUILD"
echo "updating checksums and version for git.PKGBUILD"
[[ -f git.PKGBUILD ]] && sed -i "s/^pkgver=.*/pkgver='autogenerated'/" git.PKGBUILD && updpkgsums git.PKGBUILD && _gitPKGBUILD="git.PKGBUILD"
echo "creating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
sha256sum skywire-scripts.tar.gz
echo "don't forget to increment pkgrel if you edited the PKGBUILD"
echo
echo "git add -f ${_debPKGBUILD} ${_ccdebPKGBUILD} ${_devPKGBUILD} ${_gitPKGBUILD} PKGBUILD .SRCINFO skywire-scripts.tar.gz updates.sh test.sh"
echo 'git commit -m " "'
