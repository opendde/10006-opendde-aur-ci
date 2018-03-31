# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=xlayoutdisplay
pkgver=1.0.2
pkgrel=0
pkgdesc="Detects and arranges linux display outputs, using XRandR for detection and xrandr for arrangement."
arch=('x86_64')
url="https://github.com/alex-courtis/xlayoutdisplay"
license=('Apache')
depends=('xorg-xrandr' 'xorg-xrdb' 'libxcursor' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
source=("https://github.com/alex-courtis/xlayoutdisplay/archive/v$pkgver.tar.gz")
sha256sums=('150d410d30281e753b4342fa8f26f34cbfdfa070241388403004ddb988c1cc42')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make xlayoutdisplay
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
