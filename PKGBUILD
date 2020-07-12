# Maintainer: robertfoster

pkgname=ostinato
pkgver=1.1
pkgrel=2
url="http://ostinato.org/"
pkgdesc="Cross-platform network packet/traffic generator and analyzer"
arch=('i686' 'x86_64')
depends=('protobuf' 'qt5-base' 'libpcap')
optdepends=('wireshark-cli' 'gzip' 'diffutils' 'awk')
license=(GPL)
source=("https://github.com/pstavirs/ostinato/archive/v$pkgver.tar.gz" 
        "$pkgname.desktop"
	"$pkgname.png")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	QT_SELECT=qt5 qmake PREFIX=/usr -config release
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT=$pkgdir install
	install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

md5sums=('3cd0cce3e368c64eb531a6eba2cdee1f'
         '87e4dbdde1a16e6db537b2d01ed0a798'
         '5ddf0b07a4a088630ed6655869f8d2aa')
