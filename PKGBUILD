# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zps
pkgver=1.2.3
pkgrel=1
pkgdesc="A small utility for listing and cleaning up zombie processes"
arch=('x86_64')
url="https://github.com/orhun/zps"
license=('GPL3')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('bf7e9e0bced3f53df55d0413e40bad73b334df45866668949f31d2cb4c2576b32c838252898eaee54e9bc74d74a142f5693909b65a00347c71861042306a7983')
validpgpkeys=('39E678DF63BE20EA5A175156B928720AEC532117') # orhun <orhunparmaksiz@gmail.com>

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build && cd build/
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
