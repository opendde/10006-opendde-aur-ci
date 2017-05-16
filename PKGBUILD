# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=laz-perf-git
pkgver=20170516
pkgrel=1
pkgdesc="Alternative LAZ implementation for C++ and JavaScript"
arch=('any')
url="https://github.com/hobu/laz-perf"
license=(LGPL)
makedepends=(cmake git)
source=('git://github.com/hobu/laz-perf.git')
sha512sums=('SKIP')

build() {
  mkdir -p laz-perf/build
  cd laz-perf/build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd laz-perf/build

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
