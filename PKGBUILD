# Maintainer: Erick Gallesio <eg at unice dot fr>
# Contributor: Jorge Silva <j0rj@posteo.net>

pkgname=stklos
pkgver=1.60
pkgrel=2
pkgdesc="Free R5RS/R7RS Scheme system."
arch=('i686' 'x86_64')
url="http://www.stklos.net"
license=('GPL')
depends=('readline' 'gmp' 'pcre' 'libffi' 'gc')
source=("http://www.stklos.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('f5f692b3e7d5654cd0eb262be9185530')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-threads=pthreads
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
