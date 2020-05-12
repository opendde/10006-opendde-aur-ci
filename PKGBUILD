# Maintainer: jsm <0x6a736d@gmail.com>
pkgname=btpd-git
pkgver=449.a3a10df
pkgrel=1
pkgdesc="BitTorrent Protocol Daemon"
arch=('i686' 'x86_64')
url="https://github.com/btpd/btpd"
license=('custom:btpd')
depends=(openssl)
makedepends=(git)
provides=(btpd)
conflicts=(btpd)
source=(git+https://github.com/btpd/btpd
        btpd.service
        btpd.install)
sha256sums=(SKIP
            fbf49bc1378025adfbd1910ae3aca19093965a404d52e0676956e6f75cfa0409
            181631c0f234edd637ee63979a407b015d789a4b5ef91eecc6b274cc56239a2b)
_gitname="btpd"
install="btpd.install"

pkgver() {
	cd "$srcdir/$_gitname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	./configure
	make
}

package() {
	local installopts="--mode 0644 -D"
	local sysddir="$pkgdir/usr/lib/systemd/system"
	local licdir="$pkgdir/usr/share/licenses/$pkgname"
	install $installopts "$srcdir/btpd.service" "$sysddir/btpd.service"
	install $installopts "$srcdir/$_gitname/LICENSE" "$licdir/LICENSE"
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
}
