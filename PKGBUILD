# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=slibtool-git
pkgver=0.5.25+19.gd4bae56688da60febbf3
pkgrel=1
pkgdesc="Skinny libtool implementation, written in C"
url='http://git.midipix.org/cgit.cgi/slibtool'
license=('MIT')
arch=('x86_64' 'i686')
source=('git://midipix.org/slibtool')
sha256sums=('SKIP')
provides=("slibtool=${pkgver%+*}")
conflicts=('slibtool')

pkgver() {
	cd "$srcdir"/slibtool
	git describe --long | sed 's/^v//; s/-/+/; s/-/\./'
}

build() {
	cd "$srcdir"/slibtool
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/slibtool
	make DESTDIR="$pkgdir" install
}
