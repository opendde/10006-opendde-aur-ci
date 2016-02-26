# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgname=sterm-git
pkgver=r23.3e7f511
pkgrel=1
pkgdesc="A simple terminal emulator based on the VTE library"
arch=(x86_64)
url="https://github.com/flocke/sterm"
license=('MIT')
depends=('glib2' 'gtk3' 'pango' 'vte3')
makedepends=('git' 'cmake' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=("sterm::git+https://github.com/flocke/sterm.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-git}"

  cmake \
    -DWITH_TESTS=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    .

	make
}

check() {
	cd "${srcdir}/${pkgname%-git}"

	make test
}

package() {
	cd "${srcdir}/${pkgname%-git}"

	make DESTDIR="${pkgdir}/" install
}

