# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.2.3
_build=f1
_buildtag=20180814
_randomstring=fba045906327
_prefix=/opt/Unity
_unitydownloads="http://beta.unity3d.com/download/${_randomstring}"
#_keepsources=yes

pkgname=unity-editor-facebook
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('gtk2' 'libsoup' 'libarchive')
source=("${_unitydownloads}/UnitySetup-${_version}${_build}")
sha1sums=('c4a11b282908d0938914d16a448ec4982a5ce34e')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

unity-setup() {
  ./UnitySetup-${_version}${_build} \
    --download-location="${startdir}" \
    --install-location="${pkgdir}${_prefix}" \
    --unattended $@
}

extract-component() {
  msg2 "Extracting $1..."
  yes | unity-setup --components=$1 > "/tmp/$1.log"
}

prepare() {
  chmod +x "${srcdir}/UnitySetup-${_version}${_build}"
}

package() {
  mkdir -p "${pkgdir}${_prefix}"
  extract-component Facebook-Games

  if [ -z "${_keepsources}" ]; then
    rm "${startdir}/UnitySetup-Facebook-Games-Support-for-Editor-${_version}${_build}.pkg"
  fi
}

