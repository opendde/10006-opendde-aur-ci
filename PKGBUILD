# Maintainer: Meade And Emily <thedarkula2049@gmail.com>
pkgname=brewstillery
pkgver=5.2.0
pkgrel=1
pkgdesc="BrewStillery is a brewer's, vintner's, and distiller's calculator. It has a multitude of great functions, such as calculating ABV, determining carbonation, and total sparge water needed."
url="https://monkeylog.in"
arch=('i686' 'x86_64')
license=('AGPL3')
depends=('ttf-roboto')
makedepends=('git' 'cargo')
provides=('brewstillery')
conflicts=('brewstillery')
source=("https://github.com/MonkeyLog/BrewStillery/archive/$pkgver.tar.gz")
md5sums=('74c75731ece0d86579a1ccb9c6e30f6d')

build() {
	cd $srcdir/BrewStillery-$pkgver
	cargo build --release
}

package() {
	cd $srcdir/BrewStillery-$pkgver/target/release
	install -Dm755 BrewStillery "$pkgdir/usr/bin/BrewStillery"
	cd $srcdir/BrewStillery-$pkgver/Desktop
	install -Dm755 BrewStillery.desktop "$pkgdir/usr/share/applications/BrewStillery.desktop"
	cd $srcdir/BrewStillery-$pkgver/media
	install -Dm755 BrewStilleryIcon.png "$pkgdir/usr/share/BrewStillery/BrewStilleryIcon.png"
	install -Dm755 BrewStilleryLogo.png "$pkgdir/usr/share/BrewStillery/BrewStilleryLogo.png"
	cd $srcdir/BrewStillery-$pkgver/media/glassware
	install -dm755 "$pkgdir/usr/share/BrewStillery/glassware/"
	install -Dm755 *.png "$pkgdir/usr/share/BrewStillery/glassware/"
	cd $srcdir/BrewStillery-$pkgver/media/buttons
	install -dm755 "$pkgdir/usr/share/BrewStillery/buttons/"
	install -Dm755 *.png "$pkgdir/usr/share/BrewStillery/buttons/"
}