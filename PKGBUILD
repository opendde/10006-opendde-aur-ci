# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-xswitch
pkgver=0.1.3
pkgrel=1
pkgdesc='xswitch: an Interception Tools tool to redirect stdin to a muxer if a X window matches'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/xswitch'
depends=('interception-tools' 'glibc' 'libx11' 'libxmu')
makedepends=('boost' 'cmake' 'gcc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/plugins/xswitch/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('ff834a2085ba4921ef1d4bc98a501f7e1ce41f7a7c24fe654c002129040bc19f')

build() {
    cd ${srcdir}/xswitch-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/xswitch-v${pkgver}-*/build

    make DESTDIR="$pkgdir/" install
}
