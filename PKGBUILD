# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-space2meta
pkgver=0.1.1
pkgrel=2
pkgdesc='space2meta: turn space into meta when chorded to another key (on release)'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/space2meta'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
source=("https://gitlab.com/interception/linux/plugins/space2meta/-/archive/v${pkgver}/space2meta-v${pkgver}.tar.gz")
sha256sums=('1cbf7957c5f6e271d54ffec77e1760ffc77410c5b0830c6628362b23f1885429')

build() {
    cd ${srcdir}/space2meta-v${pkgver}
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/space2meta-v${pkgver}/build

    make DESTDIR="$pkgdir/" install
}
