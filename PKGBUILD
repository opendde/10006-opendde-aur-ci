# Maintainer: Keinv Yue <yuezk001@gmail.com>

pkgname=globalprotect-openconnect
pkgver=1.3.4
pkgrel=1
pkgdesc="A GlobalProtect VPN client (GUI) for Linux based on Openconnect and built with Qt5, supports SAML auth mode."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')
depends=('openconnect>=8.0.0' qt5-base qt5-webengine qt5-websockets)
makedepends=(cmake)
provides=('gpclient' 'gpservice')

source=("${pkgname}.tar.gz")
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname-*/
    cat VERSION VERSION_SUFFIX
}

build() {
    cd $srcdir/$pkgname-*/
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS_RELEASE=-s
    make -j$(nproc) -C build
}

package() {
    cd $srcdir/$pkgdir-*/
    make DESTDIR="$pkgdir/" install -C build
}
