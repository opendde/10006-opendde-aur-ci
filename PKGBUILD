# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libwebp
pkgver=1.1.0
pkgrel=2
pkgdesc="WebP library and conversion tools (android)"
arch=('any')
url="https://developers.google.com/speed/webp/"
license=("BSD")
depends=("android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-libtiff"
         "android-${_android_arch}-giflib")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure' 'dh-autoreconf')
source=("https://github.com/webmproject/libwebp/archive/v${pkgver}.tar.gz")
sha256sums=('424faab60a14cb92c2a062733b6977b4cc1e875a6398887c5911b3a1a6c56c51')

prepare() {
    cd "$srcdir/libwebp-${pkgver}"
    source android-env ${_android_arch}

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "$srcdir/libwebp-${pkgver}"
    source android-env ${_android_arch}
    unset LDFLAGS

    android-${_android_arch}-configure \
        --enable-swap-16bit-csp \
        --enable-experimental \
        --enable-libwebp{mux,demux,decoder,extras}

    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libwebp-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
