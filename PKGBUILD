# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-speexdsp
pkgver=1.2.0
pkgrel=2
pkgdesc="DSP library derived from Speex (android)"
arch=(any)
url="http://www.speexdsp.org"
license=("BSD")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.xiph.org/releases/speex/speexdsp-$pkgver.tar.gz")
md5sums=('b722df341576dc185d897131321008fc')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/speexdsp-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-neon

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/speexdsp-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install

    for f in $(find "$pkgdir/${ANDROID_PREFIX_LIB}" -type l -name "lib*.so"); do
        mv -vf "$(realpath "$f")" "$f"
    done

    rm -vf "$pkgdir"/${ANDROID_PREFIX_LIB}/lib*.so.*
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
