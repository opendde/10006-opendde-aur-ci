# Maintainer: Aaron Esau <contact@aaronesau.com>
pkgname="heaptrace-git"
pkgver="2.2.8"
pkgrel="1"
license=("BSD")
arch=("x86_64")
md5sums=("SKIP")
url="https://github.com/Arinerron/heaptrace"
pkgdesc="helps visualize heap operations for pwn and debugging"
source=("${pkgname}-${pkgver}::git+https://github.com/Arinerron/heaptrace.git#branch=main")
makedepends=("gcc")

build() {
    # build
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

check() {
    # post_build. TODO: run test
    cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
    install -D "${srcdir}/${pkgname}-${pkgver}/heaptrace" "${pkgdir}/usr/bin/heaptrace" --mode=755 --owner="root" --group="root"
}
