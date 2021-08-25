# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.5.0
pkgrel=1
pkgdesc="MIDI file player based on Drumstick"
arch=('x86_64')
url="https://sourceforge.net/projects/dmidiplayer/"
license=('GPL3')
depends=('drumstick' 'qt5-base' 'uchardet')
makedepends=('cmake' 'qt5-tools' 'pandoc')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('eb54e3a95627223b58cff0c328240315f10eae20d56147dcaa412906182232aeb3067f630c5e722d94b7c7e1bbeff182468b647a676c16fb918134f90337c323')

prepare() {
	mkdir -p "$pkgname-$pkgver"/build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      ..
	make
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir" make install

	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
