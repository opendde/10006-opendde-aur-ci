# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=srt
pkgname=lib32-srt
pkgver=1.4.4
pkgrel=1
pkgdesc="Secure Reliable Transport library (32-bit)"
url="https://www.srtalliance.org/"
arch=(x86_64)
license=(MPL2)
depends=(lib32-gcc-libs lib32-openssl srt)
makedepends=(cmake git ninja)
_commit=8b32f3734ff6af7cc7b0fef272591cb80a2d1aae # tags/v1.4.4
source=("git+https://github.com/Haivision/srt#commit=$_commit")
b2sums=('SKIP')


pkgver() {
    cd $_basename

    git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake -S srt -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=bin \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DCMAKE_INSTALL_INCLUDEDIR=include \
        -DCMAKE_BUILD_TYPE=None \
        -DENABLE_STATIC=ON \
        -DENABLE_TESTING=ON

    cmake --build build
}

check() {
    cd build

    ./uriparser-test
    ./utility-test
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    cd "$pkgdir"/usr

    rm -r bin include
}
