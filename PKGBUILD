# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=curaengine
pkgver=15.06.03
pkgrel=1
pkgdesc="CuraEngine is a powerful, fast and robust engine for processing 3D models into 3D printing instruction for Ultimaker and other GCode based 3D printers. It is part of the larger open source project called Cura."
url="https://github.com/Ultimaker/CuraEngine"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('cmake')
source=("https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('a7cd980dfed2aeeb28ca8610f541fb3d')

build() {
  cd CuraEngine-${pkgver}
  cmake ./ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd CuraEngine-${pkgver}
  make DESTDIR="${pkgdir}" install
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
