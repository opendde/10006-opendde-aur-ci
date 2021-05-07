# Maintainer: Keinv Yue <yuezk001@gmail.com>

pkgname=globalprotect-openconnect
_gitname=GlobalProtect-openconnect
pkgver=1.2.8
pkgrel=1
pkgdesc="A GlobalProtect VPN client (GUI) for Linux based on Openconnect and built with Qt5, supports SAML auth mode."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/${_gitname}"
license=('GPL3')
depends=('openconnect>=8.0.0' qt5-base qt5-webengine qt5-websockets)
makedepends=()
source=(
    "${_gitname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "https://github.com/itay-grudev/SingleApplication/archive/v3.0.19.tar.gz"
    "https://github.com/SergiusTheBest/plog/archive/1.1.5.tar.gz"
)

sha256sums=(
    'b10a23f04681f14a71240272765882e56618bbf696b680e6aeebcdce7963aa24'
    '9405fd259288b2a862e91e5135bccee936f0438e1b32c13603277132309d15e0'
    '6c80b4701183d2415bec927e1f5ca9b1761b3b5c65d3e09fb29c743e016d5609'
);

prepare() {
    mv "$srcdir/SingleApplication-3.0.19" -T "$srcdir/${_gitname}-${pkgver}/singleapplication"
    mv "$srcdir/plog-1.1.5" -T "$srcdir/${_gitname}-${pkgver}/plog"
}

build() {
    cd "$srcdir/${_gitname}-${pkgver}"
    qmake CONFIG+=release "${srcdir}/${_gitname}-${pkgver}/GlobalProtect-openconnect.pro"
    make
}

package() {
    cd "$srcdir/${_gitname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir/" install
}
