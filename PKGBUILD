# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libjpeg-turbo
pkgver=2.0.4
pkgrel=1
arch=('any')
pkgdesc="JPEG image codec with accelerated baseline compression and decompression (android)"
license=("custom")
url="http://libjpeg-turbo.virtualgl.org"
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake' 'yasm')
source=("http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-$pkgver.tar.gz")
sha256sums=('33dd8547efd5543639e890efbf2ef52d5a21df81faf41bb940657af916a23406')

build() {
    cd "${srcdir}"/libjpeg-turbo-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -DWITH_JPEG8=ON \
        .

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libjpeg-turbo-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
