# -*- mode: sh; -*-
# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Maintainer: Jeff Mickey <jeff@archlinux.org>
pkgname=shepherd
pkgver=0.6.1
pkgrel=1
pkgdesc="Service manager that looks after the herd."
arch=('x86_64')
url="https://www.gnu.org/software/shepherd/"
license=('GPL3')
depends=('guile')
makedepends=('gcc' 'make' 'gawk' 'sed')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('256847dedeee7409181c1c5a667c6dd09900ed69')

build() {
	cd "$pkgname-$pkgver"
	# We do not set sbindir here so it's easier to delete in the package step.
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# get rid of halt / reboot and the var dir
	rm -r $pkgdir/usr/var
	rm -r $pkgdir/usr/sbin
	rm -r $pkgdir/usr/share/man/man8
}
