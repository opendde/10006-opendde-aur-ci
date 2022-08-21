# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
pkgname=libopenblt
pkgver=1.14.01
pkgrel=1
pkgdesc="The OpenBLT Host Library contains an API for communicating with a microcontroller running the OpenBLT bootloader"
arch=(x86_64)
url="https://www.feaser.com/openblt/doku.php?id=manual:libopenblt"
license=('GPL')
depends=('libusb>=1.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.zip::https://nav.dl.sourceforge.net/project/openblt/OpenBLT%20stable/version%20${pkgver}/openblt_v0${pkgver//.}.zip")
md5sums=('c222da15b773f41e130c5761ac87b461')

build() {
  cd "openblt_v0${pkgver//.}/Host/Source/LibOpenBLT/build"

  cmake ..
  make
}

package() {
  cd "openblt_v0${pkgver//.}/Host"

  install -D "libopenblt.so" "$pkgdir/usr/lib/libopenblt.so"
}
