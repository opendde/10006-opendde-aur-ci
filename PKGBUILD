# Maintainer: Grzegorz Alibożek <grzegorz.alibozek@gmail.com>
_gitname="weather-widget-2"
pkgname=plasma5-applets-weather-widget-2
pkgver=2.3.4.1
pkgrel=2
pkgdesc="An updated version of the plasma-applet-weather-widget by Kotelnik"
arch=('x86_64')
url="https://github.com/blackadderkate/$_gitname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'qt5-xmlpatterns')
makedepends=('extra-cmake-modules')
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz
        fix_cmake_warning.patch)
sha256sums=('23c43b78bf9e1cc170384a7c67d078be141736b91d1c7c34b4855ef7a08dbcb1'
            '396c716e206245bb0de2c881a6d50764ae35f98581f67543ea51f2ca49659f9b')

prepare() {
    patch -Np1 -d ./${_gitname}-${pkgver} -i ../fix_cmake_warning.patch
}

build() {
    cmake -B ./build -S ./${_gitname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
