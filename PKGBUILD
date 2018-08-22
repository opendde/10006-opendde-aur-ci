# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=libomemo
pkgver=0.6.2
pkgrel=1
pkgdesc="Implements OMEMO in C"
arch=('i686' 'x86_64')
url='https://github.com/gkdr/libomemo'
license=('MIT')
depends=('mxml' 'libgcrypt' 'glib2' 'sqlite')
makedepends=()
source=("https://github.com/gkdr/libomemo/archive/v${pkgver}.tar.gz")
md5sums=('57a838ae647a94e409c01b9ee9869945')

build() {
    cd "${srcdir}/libomemo-${pkgver}"
    make
}

package() {
    cd "${srcdir}/libomemo-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib"
    install build/*.a "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/include"
    install src/*.h "${pkgdir}/usr/include"
}
