# Maintainer: Eric Bélanger <eric@archlinux.org>
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>

pkgname=sbsms
pkgver=2.0.2
pkgrel=3
pkgdesc="Library for time stretching and pitch scaling of audio"
arch=('x86_64')
url="http://sbsms.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
options=('!staticlibs')
source=(http://downloads.sourceforge.net/project/sbsms/$pkgname/$pkgver/lib$pkgname-$pkgver.tar.gz)
sha512sums=('8aaab3e191f3e10e559683ab4ebdcb8d951cf0e776390234f25675a98640d60d20aed872061ba72fdc3bd7827b7d46bc27225fe947cdd7fa4312f75cbdd78e6c')

build() {
  cd lib$pkgname-$pkgver
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd lib$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
