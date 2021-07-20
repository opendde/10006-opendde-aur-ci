
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid
pkgver=1.7.2
pkgrel=3
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
depends=('libretls')
conflicts=('gmid-git' 'gmid-bin')
source=("https://git.omarpolo.com/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('7627118d587d7678baf4e576187b1a3d058bf7816c4e3a91f790d3ed05976b8a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	MANDIR='usr/share/man/' ./configure PREFIX='usr/'
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make regress
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
