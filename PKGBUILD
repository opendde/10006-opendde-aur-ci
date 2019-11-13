# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=libnetstack
pkgver=0.6.0
pkgrel=1
pkgdesc="Networking stack cache atop netlink"
url="https://nick-black.com/dankwiki/index.php/Libnetstack"
license=('Apache')
arch=('x86_64')
depends=('ncurses')
makedepends=('gtest' 'cmake' 'libnl')
source=("https://github.com/dankamongmen/libnetstack/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$pkgname-$pkgver/build"
  make test
}

sha256sums=('9aa36e8e3587cc163c0cf7330570520191264e3547ec7131e13bb54a0fd33b4a')
