# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=abseil-cpp
pkgver=20210324.0
pkgrel=1
pkgdesc="Abseil Common Libraries (C++)"
# check occasionally arch support status
# https://github.com/abseil/abseil-cpp/blob/master/absl/random/internal/platform.h#L54
arch=('x86_64' 'i686' 'arm' 'aarch64' 'ppc')
url="https://abseil.io/"
_url="https://github.com/abseil/abseil-cpp"
license=('Apache')
makedepends=('cmake')
source=("$_url/archive/$pkgver.tar.gz")
sha256sums=('dd7db6815204c2a62a2160e32c55e97113b0a0178b2f090d6bab5ce36111db4b')

prepare() {
    cd "$pkgname-$pkgver"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_STANDARD=17 \
        -DABSL_USE_GOOGLETEST_HEAD=OFF \
        -DABSL_RUN_TESTS=OFF \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}

build() {
    cd "$pkgname-$pkgver/build"
    make
}

# time test failes
#check() {
#    cd "$pkgname-$pkgver"
#    cmake --build build -- test ARGS="$MAKEFLAGS"
#}

package() {
    cd "$pkgname-$pkgver"
    cmake --build build -- DESTDIR="$pkgdir" install
}
