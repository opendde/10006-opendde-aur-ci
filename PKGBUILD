# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.0.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('Apache')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('fbd10a73a539029ecabf6900d4032043')
sha1sums=('d884429c96f5a478e7fe19b48ae8ac8cbc0091b5')
sha512sums=('96baf08b85e6768298f7deb0c0f93ab774cda2c10412c12b2f3901433f4c227363ac090bf7149368fbccb2495d4de47774063a56836bf1517cb759da0b7fb176')

package() {
	cd "$pkgname-$pkgver"

	cargo build --release --locked
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
