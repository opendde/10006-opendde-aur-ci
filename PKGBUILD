# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
# Past maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Tilmann Becker <tilmann.becker@freenet.de>

pkgname=scrounge-ntfs
pkgver=0.9
pkgrel=5
pkgdesc="Data recovery program for NTFS file systems"
arch=('i686' 'x86_64')
url="http://thewalter.net/stef/software/scrounge/"
license=('BSD')
groups=()
depends=()
makedepends=('autoconf' 'automake')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://thewalter.net/stef/software/scrounge/${pkgname}-${pkgver}.tar.gz)
noextract=()
sha512sums=('7d8ba55a8e95b83d0eee5a0f540d22ec572d9724f32d64aec9f3e817b32fcc5d4502979ccd61b1d98adbd559c361d69dc2a288d02de7945855ce51c36c452b07')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
