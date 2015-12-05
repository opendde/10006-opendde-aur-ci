# Maintainer: Oliver Giles <web ohwg net>
pkgname=scappit
pkgver=0.1
pkgrel=1
pkgdesc="Simple screen capture and annotation"
arch=('i686' 'x86_64')
url="http://scappit.ohwg.net"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-x11extras')
makedepends=('cmake')
options=('strip')
source=("https://github.com/ohwgiles/$pkgname/archive/v${pkgver}.zip")
md5sums=('ecb851ca619ad22de822e19f1bd0715d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make -j4
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

