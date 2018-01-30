# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.11.7
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64' 'i686')
url="https://github.com/mooltipass/${pkgname}"
license=('GPL3')

depends=('libusb'
         'mooltipass-udev'
         'qt5-base'
         'qt5-websockets'
         'hicolor-icon-theme')
makedepends=('make'
             'qt5-tools')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}-beta.tar.gz")
sha256sums=('81a7789513f13d9f53ca0189af9c28212150b6f56f7c1ea3c0e1def33c7789dd')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}-beta"

    sed -i "s/#define APP_VERSION \"git\"/#define APP_VERSION \"v${pkgver}-beta\"/" ./src/version.h
}

build() {
    cd "${pkgname}-${pkgver}-beta"

    mkdir build
    cd build/

    qmake-qt5 ../Moolticute.pro                     \
              PREFIX=/usr                           \
              QMAKE_CFLAGS_RELEASE="${CFLAGS}"      \
              QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"

    make
}

package() {
    cd "${pkgname}-${pkgver}-beta/build/"

    make INSTALL_ROOT="${pkgdir}/" install
}
