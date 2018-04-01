# Maintainer: ber532k <ber532k@gmx.de>
pkgname=bower-mail
pkgver=0.8.1
pkgrel=1
pkgdesc="A curses terminal client for the Notmuch email system"
arch=('any')
url="https://github.com/wangp/bower"
depends=('notmuch' 'ncurses' 'coreutils' 'file' 'mercury>=11.07')
makedepends=('gpgme')
optdepends=('msmtp: send messages' 'lynx: dump HTML emails' 'w3m: dump HTML emails')
conflicts=('bower')
license=('GPL3')
source=("https://github.com/wangp/bower/archive/$pkgver.tar.gz")
md5sums=('7efe17fa39dd9d8e1663e8ca8bdb93d1')

build() {
    patch "$srcdir/bower-$pkgver/src/Mercury.options" < ../arch.patch
	cd "$srcdir/bower-$pkgver"
	make PARALLEL=$MAKEFLAGS
}

package() {
    mkdir -p "$pkgdir/usr/bin"
	install -m 755 "$srcdir/bower-$pkgver/bower" "$pkgdir/usr/bin/"
}
