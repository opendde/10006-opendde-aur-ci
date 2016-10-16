# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libisds
pkgver=0.10.6
pkgrel=1
pkgdesc="Client library for accessing SOAP services of ISDS (Data Box Information System)"
arch=('i686' 'x86_64')
url="http://xpisar.wz.cz/libisds/"
license=('LGPL')
depends=('libxml2' 'expat')
source=(http://xpisar.wz.cz/$pkgname/dist/$pkgname-$pkgver.tar.xz{,.asc})
validpgpkeys=('4B528393E6A3B0DFB2EF3A6412C9C5C767C6FAA2') # Petr Pisar
sha256sums=('49ca70acef5dd5d092a03643f4d2f96ff8250b135eb55558a5f62fa1fd3f8a8a'
            'SKIP')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
