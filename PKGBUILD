# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libbiosig
pkgver=1.9.0
pkgrel=1
pkgdesc="Provides reading and writing routines for different biosignal data formats"
arch=('i686' 'x86_64')
url="http://biosig.sourceforge.net/"
license=('GPL')
groups=()
depends=('zlib' 'suitesparse')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=
changelog=
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig4c%2B%2B-1.9.0a.src.tar.gz)
noextract=()
sha1sums=('4b7e7480a21b5b27157ab93b327c6629a5220a03')

build() {
  cd "$srcdir/biosig4c++-1.9.0a"
  ./configure
  make libbiosig
}

package() {
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/lib"
  cp "$srcdir/biosig4c++-1.9.0a/biosig.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig4c++-1.9.0a/gdftime.h" "$pkgdir/usr/include/"
  cp "$srcdir/biosig4c++-1.9.0a/libbiosig.a" "$pkgdir/usr/lib/"
  cp "$srcdir/biosig4c++-1.9.0a/libbiosig.so.2" "$pkgdir/usr/lib/"
  ln -s "$srcdir/biosig4c++-1.9.0a/libbiosig.so.2" "$pkgdir/usr/lib/libbiosig.so"
}
