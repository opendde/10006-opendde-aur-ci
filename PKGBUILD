# Maintainer: Matthew Sexton <wsdmatty@gmail.com>
pkgname=spotify-tray-git
pkgver=1.2.0.r0.gdb2f164
pkgrel=1
pkgdesc="Tray icon for the Spotify Linux client application"
arch=('x86_64')
url="https://github.com/tsmetana/spotify-tray"
license=('GPL3')
depends=('spotify' 'gtk3')
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('spotify-tray::git+https://github.com/tsmetana/spotify-tray.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}
