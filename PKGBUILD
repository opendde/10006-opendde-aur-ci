# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: Emil Vanherp <emil dot vanherp at hotmail dot com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Xavier D. <magicrhesus at ouranos dot be>
# Contributor: Valere Monseur <valere dot monseur at ymail dot com>

pkgname=eid-mw
pkgver=4.1.21
pkgrel=1

pkgdesc="eID Middleware is the middleware for the Belgian electronic identity card"
arch=('i686' 'x86_64')
url=http://eid.belgium.be/
license=('LGPL3')

depends=('pcsclite' 'gtk2')
optdepends=(
    'firefox: extension for Belgian eid'
    'acsccid: ACS CCID smart card readers'
    'ccid: A generic USB Chip/Smart Card Interface Devices driver'
    'pcsc-tools: PC/SC smartcard tools')

source=(
    "https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.tar.gz"{,.asc}
)
sha512sums=(
    adcf6678754d366492c66e91cfefe6b950ca5aa601c55bb146998a9265aec90b3832e1514cbf905a5b13a1e3d27a28338ba36e7cab4ef62e506f1ae5e9bab9da
9dd1184f111a88f4ce7e7c48a95d677c6bf1c70b1d9f3ca7b909c89f881affe1f931685cc39aa543fd3efd750abadb67e6645c5236cfcd31beb825259f8bb85d
)

validpgpkeys=(
    D95426E309C0492990D8E8E2824A5E0010A04D46 # Belgian eID Automatic Signing Key (continuous builds)
)

build() {
	cd "$pkgname-$pkgver-v$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver-v$pkgver"
	make install DESTDIR="$pkgdir"
}
