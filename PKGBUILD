# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Xavier D. <magicrhesus@ouranos.be>
# Contributor: Valere Monseur <valere.monseur@ymail.com>

pkgname=eid-mw
pkgver=4.1.4
pkgrel=1

pkgdesc="The eID middleware for the Belgian eID"
url=http://eid.belgium.be/
arch=('i686' 'x86_64')
license=('LGPL3')

depends=('pcsclite' 'gtk2')
optdepends=('firefox: extension for Belgian eid'
	    'acsccid: ACS CCID smart card readers'
	    'ccid: A generic USB Chip/Smart Card Interface Devices driver'
	    'pcsc-tools: PC/SC smartcard tools')
source=("https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.tar.gz")
sha256sums=('2996960ea92504c7cee1953ccf4520ba78979c7771645e2b2c1207f94be0a308')

# SSL cert expired on July 29th; temporalily use --insecure
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --insecure')

build() {
	cd "$pkgname-$pkgver-v$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver-v$pkgver"
	make install DESTDIR="$pkgdir"
}
     
# vim:set ts=2 sw=2 et:
