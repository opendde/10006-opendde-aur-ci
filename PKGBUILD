# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=roswell
pkgver="0.0.3.50"
pkgrel=1
pkgdesc="Lisp installer and launcher"
url="https://github.com/snmsts/roswell"
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl')
optdepends=()
source=("https://github.com/snmsts/roswell/archive/v$pkgver.tar.gz")
md5sums=('2b61fdb585afc026b93744521a19de16')

build() {
	cd "$pkgname-$pkgver"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D COPYING "$pkgdir/usr/share/licenses/roswell/LICENSE"
}
