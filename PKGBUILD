# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-exec
pkgver=1.2.2.0
pkgrel=2
_builderver=1.2.2.0
pkgdesc="A protocol plugin for Remmina to execute an external process."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina')
makedepends=('pkg-config' 'cmake')
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bce686835b951dc49263dd760ea3a216618e5d5b1f6652da94edf4ba95081434'
            'ff004bbe70c24f8ce292ff35f39f25e745d1a75ba71f69142af68ada002ec530')

prepare() {
  msg2 'To build for Remmina < 1.2 set -DREMMINA_VER_1_1=ON'
}

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname}-${pkgver}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DREMMINA_VER_1_1=OFF .
  make
}

package() {
  cd "${srcdir}/build/"
  make DESTDIR="${pkgdir}" install
}
