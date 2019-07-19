# Maintainer: Kyle Guarco <kyleguarco55@gmail.com>

_pkgname=berry
pkgname=berry-git
pkgbase=berry
pkgver=git+e519be4
pkgrel=1
pkgdesc="A healthy, bite-sized window manager written over the XLib Library"
url="https://github.com/JLErvin/berry"
arch=('x86_64')
license=('MIT')
makedepends=('gcc')
depends=('libx11')
source=(
	"git://github.com/JLErvin/berry.git#branch=master"
	berry.desktop
)
sha256sums=('SKIP' 'SKIP')

build() {
	cd ${_pkgname}/
	make
}

package() {
	# Install berry.desktop
	mkdir -p "${pkgdir}/usr/share/xsessions/"
	install -D -m644 berry.desktop "${pkgdir}/usr/share/xsessions/"

	cd ${_pkgname}/
	make DESTDIR="$pkgdir/" PREFIX="/usr/local" install
	
	cd man/
	make DESTDIR="$pkgdir/" install

	cd ../example
	mkdir -p "${pkgdir}/etc/xdg/berry"
	install -D -m644 * "${pkgdir}/etc/xdg/berry/"
}
										
