# Maintainer: nandub <dev+arch@nandub.info>
pkgname=primesieve
pkgver=5.5.0
pkgrel=1
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://primesieve.org/"
license=("BSD")
depends=(gcc-libs)
source=(http://dl.bintray.com/kimwalisch/primesieve/$pkgname-$pkgver.tar.gz)
sha1sums=('76b15755c38002d9f60161159cd7c5feb37931e1')
arch=('i686' 'x86_64')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
}
