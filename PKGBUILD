# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.4.1
pkgrel=1
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ea9f4e5094b40b0c909e723f12506af4e0d97cc9ef80dc3967af548aa881ca63')
install=way-displays-1_4.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

