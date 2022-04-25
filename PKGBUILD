# Maintainer: Yubin Peng <1931127624@qq.com>
pkgname=zeno
pkgver=git
pkgrel=1
pkgdesc="Open-source node system framework for simulation and others"
arch=('x86_64')
url='https://gitee.com/zenustech/zeno'
license=('MPL2')
depends=("qt5-base" "qt5-svg" "openvdb" "eigen" "cgal" "openblas" "lapack" "hdf5")
makedepends=("git" "cmake" "ninja")
optdepends=()
source=("${pkgname}-${pkgver}::git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${pkgname}-${pkgver}
}

build() {
    cd ${pkgname}-${pkgver}
    cmake --preset default -G Ninja -DCMAKE_INSTALL_PREFIX="${pkgdir}"
    cmake --build --preset default --parallel
}

package() {
    cd ${pkgname}-${pkgver}
    cmake --build --preset default --target install
}
