# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=vipster
pkgver=1.16b
pkgrel=1
pkgdesc="Molecule editor based on Qt, specialized on periodic structures"
arch=('x86_64')
url="https://sgsaenger.github.io/vipster"
license=('GPL3')
groups=()
depends=('qt5-base' 'python')
makedepends=('cmake' 'git')
source=("https://github.com/sgsaenger/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('57e26d37bf4660d7de8a6b69d59a272d')

build() {
    cd vipster-$pkgver
    git clone https://github.com/pybind/pybind11 --branch v2.2.4 external/pybind11
    mkdir build
    cd build

    cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D PYTHON=YES -D DESKTOP=YES -D TESTS=YES ..
    make all
}

check() {
    cd vipster-$pkgver/build

    ./test_lib
}

package() {
    cd vipster-$pkgver/build

    make DESTDIR=$pkgdir install
}
