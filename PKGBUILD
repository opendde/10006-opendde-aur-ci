# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=openorienteering
_pkgname=mapper
pkgname=${_orgname}-${_pkgname}
pkgver=0.6.2
pkgrel=3
pkgdesc="Orienteering mapmaking program"
arch=('i686' 'x86_64')
url="http://openorienteering.github.io/apps/mapper/"
license=('GPL3')
depends=('qt5-base>=5.5.1' 'polyclipping>=6.1.3a' 'proj>=4.9.2')
makedepends=('cmake>=2.8.12' 'qt5-tools>=5.5.1')
provides=("${pkgname}=${pkgver}")
install=${pkgname}.install
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('be8e7506c808d8279a4ef4073dea46f65f2c5458ad9284e8d45ec41701cb0a49')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  rm -rf ${srcdir}/${_pkgname}-${pkgver}/build
  mkdir -p ${srcdir}/${_pkgname}-${pkgver}/build
  cd ${srcdir}/${_pkgname}-${pkgver}/build

  cmake ..                      \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMapper_BUILD_QT=0         \
    -DMapper_BUILD_CLIPPER=0    \
    -DMapper_BUILD_PROJ=0       \
    -Wno-dev
  make -j4
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir}/ install
  rm -fr ${pkgdir}/DEBIAN
}
