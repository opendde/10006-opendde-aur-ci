# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.1.0
_build=b13
_buildtag=20180502
_randomstring=77a142ac9989
_prefix=/opt/UnityBeta
_unitydownloads="http://beta.unity3d.com/download/${_randomstring}"
#_keepsources=yes

pkgname=unity-editor-beta-doc
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
pkgdesc="Unity User Manual and Scripting API Reference."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('gtk2' 'libsoup' 'libarchive')
source=("${_unitydownloads}/UnitySetup-${_version}${_build}")
sha1sums=('db01d63684c7bf114d9b5df6d0c23f81894dd2d5')
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
  extract-component Documentation

  if [ -z "${_keepsources}" ]; then
    rm "${startdir}/Documentation.pkg"
  fi
}

