# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=fhex
pkgver=2.4
pkgrel=1
pkgdesc='Full-featured hex editor'
arch=(x86_64)
url=https://github.com/echo-devim/fhex
license=(GPL3)
depends=(capstone keystone qt5-charts)
makedepends=(qt5-base)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname.desktop)
sha512sums=('eb1529a598498fda4892f3a9fbbf6427270a852899417a4b0ea5a263a04306a1532a5ae1d65fb70dff2865efae6ae7c5d87cb8112b88dbc43a3a585d39ec3b8a'
            '5cf9313b0243033f1f308d9b1578d9557697f85a3910cbc5918ea9d1f6873ebab1ec25be556fa362016a8ac7386b55a5853d9cabc6fae368c02939e2a5105e83')

build() {
	cd $pkgname-$pkgver
	qmake .
	make
}

package() {
	cd $pkgname-$pkgver
	install -D $pkgname -t "$pkgdir"/usr/bin
	install -Dm 644 ../$pkgname.desktop -t "$pkgdir"/usr/share/applications
	install -Dm 644 icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
	install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
