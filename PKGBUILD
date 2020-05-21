# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ring-kde
pkgver=3.1.0
pkgrel=2
pkgdesc='The KDE client for the Ring communication framework'
url='http://www.ring.cx/'
license=(GPL2)
arch=(x86_64)
depends=(kirigami2 knotifyconfig kdeclarative ring-daemon)
makedepends=(extra-cmake-modules kdoctools akonadi-contacts boost libringqt-git)
source=("https://github.com/KDE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a821beefbd7ee8ffc9cc5ff44fbf0d057442af75deb90d15aa690b95965775e7')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
