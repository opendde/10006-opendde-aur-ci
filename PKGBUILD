# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist
pkgver=0.2.6
pkgrel=1
pkgdesc='A library that can be used to add the RIST protocol to applications'
arch=('x86_64')
url='https://code.videolan.org/rist/librist/'
license=('BSD')
depends=('cjson' 'mbedtls')
makedepends=('meson' 'cmake' 'cmocka' 'lz4')
source=("https://code.videolan.org/rist/librist/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
        '010-librist-disable-multicast-tests.patch')
sha256sums=('7b8ea1afd479f48d27f59f349f0ac6ce8a4f8afd80f6a1da610bbcad83ccbfee'
            'a9dc0c1a3690fea576252e687123ec2d7dfaec7c1a8b0e02c8518bdcb8e9b954')

prepare() {
    patch -d "${pkgname}-v${pkgver}" -Np1 -i "${srcdir}/010-librist-disable-multicast-tests.patch"
}

build() {
    arch-meson build "${pkgname}-v${pkgver}"
    ninja -v -C build
}

check() {
    ninja -v -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -v -C build install
    install -D -m644 "${pkgname}-v${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
