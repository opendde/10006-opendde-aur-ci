# Maintainer: Guillaume Dolle  <dev at gdolle.com>
pkgname=micromamba
pkgver=0.12.2
pkgrel=2
pkgdesc="C++ tiny version of mamba, the fast conda package installer"
arch=('i686' 'x86_64')
url="https://github.com/mamba-org/mamba"
license=('MIT')
depends=('libarchive' 'cmake' 'curl' 'libsolv' 'cli11' 'pybind11' 'nlohmann-json' 'python-pip' 'yaml-cpp' 'reproc' 'cpp-ghc-filesystem')
makedepends=('gtest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/mamba-org/mamba/archive/refs/tags/${pkgver}.tar.gz)
md5sums=('197ed18ac1a40edfb0fe25e23aeef1cd')
provides=('micromamba')
conflict=('micromamba-bin')
_pkgname2=${pkgname/micro/}

prepare(){
  cd ${_pkgname2}-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DBUILD_SHARED=ON \
        -DBUILD_STATIC=ON \
        -DBUILD_EXE=ON \
        -DENABLE_TESTS=ON \
        -B build
}

build() {
  cd ${_pkgname2/micro/}-${pkgver}
  cmake --build build
}

check() {
  cd ${_pkgname2}-${pkgver}/build
  ctest
}

package() {
  cd ${_pkgname2}-${pkgver}
  cmake --install build
}
