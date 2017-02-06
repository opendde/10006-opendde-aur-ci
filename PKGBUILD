# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=libp7
pkgver=3.0
pkgrel=0
pkgdesc="Casio Communication Protocol 7.00 implementation"
arch=('i686' 'x86_64')
url="https://p7.planet-casio.com"
license=('LGPL3')
groups=()
depends=('libusb>=1.0')
makedepends=('asciidoc>=8.6.9')
optdepends=()
provides=('libp7')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://p7.planet-casio.com/pub/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('66ea73a4ff29fa502422a465ce28888d')

build() {
  cd "$pkgname-$pkgver"
  ./configure --udev && make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
