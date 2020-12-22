# Maintainer: OriginCode <origincoder@yahoo.com>

pkgname=fcitx5-anthy-git
pkgver=5.0.1.r3.gbf307c3
pkgrel=3
pkgdesc="Anthy input method for fcitx5"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-anthy"
license=('GPL')
depends=('fcitx5-git' 'anthy' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'extra-cmake-modules')
conflicts=('fcitx-anthy' 'fcitx5-anthy')
provides=('fcitx5-anthy')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd fcitx5-anthy
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd fcitx5-anthy

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=/usr/lib .
	make
}

package() {
	cd fcitx5-anthy
	make DESTDIR="$pkgdir" install
}
