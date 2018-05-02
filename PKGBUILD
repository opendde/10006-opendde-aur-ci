# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-disappear3
pkgver=1.0
pkgrel=1
pkgdesc="KWin effect that animates the disappearing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-disappear3"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules kdelibs)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e381d0812644ecbb682536f68c6abda188428c3584ba9ba30c17dfbfb7a63175')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
