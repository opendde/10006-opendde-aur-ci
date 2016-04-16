# Maintainer: Emil Vanherp <emil DOT vanherp @ hot mail DOT com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Xavier D. <magicrhesus@ouranos.be>
# Contributor: Valere Monseur <valere.monseur@ymail.com>

pkgname=eid-mw
pkgver=4.1.12
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
source=("https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.tar.gz"{,.asc})
md5sums=('2678efdac0ebcf0c008b8850269720fb'
         'SKIP')
validpgpkeys=('D95426E309C0492990D8E8E2824A5E0010A04D46')
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
