# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=guile-dsv
pkgver=0.4.0
pkgrel=1
pkgdesc="Delimiter-separated values (DSV) format parser for GNU Guile."
arch=('x86_64')
url="https://github.com/artyom-poptsov/guile-dsv"
license=('GPL')
depends=('guile' 'guile-lib')
options=('!strip')
source=("https://github.com/artyom-poptsov/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('87d3f3c51b0766806b57678cc417236adadc893e7a4d798e05f3a8084c9d7a78')

build() {
	cd "$pkgname-$pkgver"
	local sitedir=$(guile-config info sitedir)
	autoreconf -fi
	./configure \
		--prefix=/usr \
		--with-guilesitedir=$sitedir
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
