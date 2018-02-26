# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=screengrab
pkgname=$_pkgname-git
pkgver=1.97.1.g0a779c4
pkgrel=1
pkgdesc="Crossplatform tool for grabbing screenshots of your desktop."
arch=("i686" "x86_64")
url="http://screengrab.doomer.org/"
license=("GPL2")
depends=("qt5-base" "qt5-x11extras" "kwindowsystem" "libqtxdg" "libx11" "libxcb")
makedepends=("git" "cmake" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/QtDesktop/$_pkgname")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib
	make
}

package() {
	cd build
	make install DESTDIR="$pkgdir"
}
