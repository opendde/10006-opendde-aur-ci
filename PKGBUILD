# Maintainer: monosans <hsyqixco at protonmail dot com>

pkgname=dwm-monosans-git
pkgver=6.2.r1701.d0bdbb8
pkgrel=1
pkgdesc='A dynamic window manager for X'
url=https://github.com/monosans/dwm
arch=(i686 x86_64)
license=(MIT)
depends=(freetype2 libx11 libxinerama libxft)
makedepends=(git)
source=(git://github.com/monosans/dwm
        config.mk)
sha256sums=('SKIP'
            '37e0b861183ab8d5595a0cc7fb5a98be19a681f1517b15a0cc48daeed009b1b9')
provides=(dwm)
conflicts=(dwm)

pkgver() {
	cd dwm
	_pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
	echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cp config.mk dwm/
}

build() {
	cd dwm
	make
}

package() {
	cd dwm
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
