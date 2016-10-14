# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=systemd-guest-user
pkgver=11.f6ff740
pkgrel=1
url='https://github.com/kalterfive/systemd-guest-user'
pkgdesc='A simple implementation of guest user'
arch=(any)
license=(GPL3)
depends=(systemd)
source=("${pkgname}::git://github.com/kalterfive/$pkgname")
md5sums=(SKIP)

function pkgver() {

	cd "$pkgname"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

function package() {

	cd "$pkgname"
	install -vd "$pkgdir/usr/lib" "$pkgdir/usr/share/licenses/$pkgname"
	cp -vr */ "$pkgdir/usr/lib"
	cp -v LICENSE.md "$pkgdir/usr/share/licenses/$pkgname"
}
