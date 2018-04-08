# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2017.4.0
_build=f1
_buildtag=20180501
_randomstring=0ec691fce5c2
_prefix=/opt/Unity
_unitydownloads="http://beta.unity3d.com/download/${_randomstring}"
#_keepdownloads=yes

pkgname=unity-editor-standardassets
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
pkgdesc="Unity Standard Assets for easily getting started building projects in Unity."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('gtk2' 'libsoup' 'libarchive')
source=("${_unitydownloads}/UnitySetup-${_version}${_build}")
sha1sums=('b379e6df5d9d5f02047d37c3399a2b1bb5168dda')
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
  extract-component StandardAssets

  if [ -z "${_keepdownloads}" ]; then
    rm "${startdir}/StandardAssets.pkg"
  fi
}

