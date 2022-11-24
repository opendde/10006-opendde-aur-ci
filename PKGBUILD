# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.10.1
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('3d6501c2f2067e8af980764a899adc3b')
sha1sums=('e5f78ef45a9ecef1fe8fab167ccddcdb7587ad64')
sha512sums=('efe329fa7c41afb01205b6eeddffb92741d7aac265e718cc16c1a47f85378e8b039fdeea0c557fa592d1ac958e071ed46e287d0a46ed6a36edf5144dcb7e93b2')

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
