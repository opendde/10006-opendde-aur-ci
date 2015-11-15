# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-teamviewer
pkgver=1.2.2.0
pkgrel=1
_builderver=1.2.2.0
pkgdesc="A protocol plugin for Remmina to launch a TeamViewer connection."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina' 'teamviewer')
makedepends=('pkg-config' 'cmake')
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bce686835b951dc49263dd760ea3a216618e5d5b1f6652da94edf4ba95081434'
            '8ad395f12ab95ee9f4b1789f95f1ecce56092882d167e7413debb2838837b521')

prepare() {
  msg2 'To build for Remmina >= 1.2 set -DREMMINA_VER_1_1=OFF'
}

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname}-${pkgver}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DREMMINA_VER_1_1=ON .
  make
}

package() {
  cd "${srcdir}/build/"
  make DESTDIR="${pkgdir}" install
}
