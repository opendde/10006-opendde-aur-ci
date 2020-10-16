# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=LoopTools
pkgname=looptools
pkgver=2.15
pkgrel=4
pkgdesc="package for evaluation of scalar and tensor one-loop integrals"
url="http://www.feynarts.de/looptools"
arch=('x86_64')
license=('GPL3')
depends=('gcc-fortran')
options=('staticlibs')
source=("http://www.feynarts.de/looptools/${_pkgname}-${pkgver}.tar.gz")
md5sums=('12fed44164ea4e3d74f33a836ee0e5d3')

prepare() {
  cd "${_pkgname}-${pkgver}"

  ./configure --prefix=/usr CC=/usr/bin/gcc CXX=/usr/bin/g++
  sed -i 's/LIBDIR = $(PREFIX)\/lib$(LIBDIRSUFFIX)/LIBDIR = $(PREFIX)\/lib/' makefile
  flags=( "FFLAGS" "CFLAGS" "CXXFLAGS" )
  for f in "${flags[@]}"; do
    sed -i "s/$f =/$f = -fPIC/" makefile
  done
}

build() {
  cd "${_pkgname}-${pkgver}"

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make PREFIX="$pkgdir/usr" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
