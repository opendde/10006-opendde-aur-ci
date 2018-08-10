# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=rnm
pkgver=4.0.3
pkgrel=1
pkgdesc="Bulk rename utility"
arch=('i686' 'x86_64')
url="https://github.com/neurobin/rnm"
license=('GPL3')
depends=(gmp pcre2)
makedepends=(jpcre2)
source=( "https://github.com/neurobin/$pkgname/archive/$pkgver.tar.gz" )
md5sums=('8fe1c8ba72b7c184766b85f912f0ac88')
validpgpkeys=('3331 6137 5B22 27AC F7AA  6351 A4A2 CA5B 6BDA A871')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
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
