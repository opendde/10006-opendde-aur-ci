# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=racon
pkgver=1.4.13
pkgrel=1
pkgdesc="Ultrafast consensus module for raw de novo genome assembly"
arch=('i686' 'x86_64')
url="https://github.com/lbcb-sci/racon"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('racon')
conflicts=('racon')
source=("git+https://github.com/lbcb-sci/racon.git#tag=$pkgver")
sha256sums=('SKIP')


prepare() {
  cd "racon"

  git submodule update --init --recursive

  # workaround for compile error
  cd "vendor/spoa"
  git checkout "tags/3.2.0"
}

build() {
  cd "racon"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    "../"
  make
}

package() {
  cd "racon"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/racon"
}
