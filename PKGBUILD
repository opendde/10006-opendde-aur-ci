# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=image-roll
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple and fast GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d56a71eeecde6c821c9321d7f39ebf07ef871c637abcdeafe07f333d1f6e55cd')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dvm 755 target/release/image-roll -t "$pkgdir/usr/bin/"
	install -Dvm 644 src/resources/com.github.weclaw1.ImageRoll.desktop -t "$pkgdir/usr/share/applications/"
	install -Dvm 644 src/resources/com.github.weclaw1.ImageRoll.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dvm 644 src/resources/com.github.weclaw1.ImageRoll.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
