# Maintainer: PixlOne <pixlone@pm.me>

pkgname=logiops
_pkgname="logiops"
_gitpkgname="logiops"
pkgver=0.2.1
pkgrel=1
pkgdesc="An unofficial driver for Logitech HID++>2.0 mice and keyboard"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/PixlOne/$_gitpkgname"
license=('GPL3')
depends=('libevdev' 'systemd-libs' 'libconfig' 'libudev.so')
makedepends=('cmake')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("https://github.com/PixlOne/$_gitpkgname/archive/v$pkgver.tar.gz")
sha256sums=('45b8cf03c48752e3391dd149d2b86422ac020032210cc30409b01ea7f8eea54c')

build() {
    cd "$_gitpkgname-$pkgver"
    mkdir -p build
    cd build
    rm -rf *
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$_gitpkgname-$pkgver/build"
    make install DESTDIR="$pkgdir"
}
