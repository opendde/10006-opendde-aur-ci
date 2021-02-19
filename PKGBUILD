# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-jasper
pkgver=2.0.25
pkgrel=1
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard (mingw-w64)"
arch=(any)
url='https://www.ece.uvic.ca/~mdadams/jasper/'
license=("custom:JasPer2.0")
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-libjpeg-turbo')
options=(staticlibs !strip !buildflags)
source=("https://github.com/mdadams/jasper/archive/version-${pkgver}.tar.gz"
        "jasper-1.900.1-fix-filename-buffer-overflow.patch"
        "001-mingw-cmake.patch"
        "004-jasper-exports.patch"
        "jasper-static-fix.patch")

sha256sums=('f5bc48e2884bcabd2aca1737baff4ca962ec665b6eb673966ced1f7adea07edb'
            'f51377e9b3e4faaa6b17b2d5fcf6f6d94fe2916a65dc9c78b5a99b891f5726dc'
            '2b261c9b40b973d0d11f7b2b6842b36aee45657cbd5e0780fa73cb184f570b65'
            'aef39fbaf65c0453a785eb563253f2bb66806ddbebcd836b8bd8dce67c7059eb'
            '3102b4175d714df84a63b8ebf3c0f346fc09a0a784a560917994f6074d6b1697')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/jasper-version-$pkgver"
  patch -p1 -i "${srcdir}"/jasper-1.900.1-fix-filename-buffer-overflow.patch
  patch -p1 -i "${srcdir}"/001-mingw-cmake.patch
  patch -p1 -i "${srcdir}"/004-jasper-exports.patch
  patch -p1 -i "${srcdir}"/jasper-static-fix.patch
}

build() {
  cd "$srcdir/jasper-version-$pkgver"
  local options=(
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_BUILD_TYPE=Release
    -DJAS_ENABLE_OPENGL=OFF
    -DJAS_ENABLE_LIBJPEG=ON
    -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF
    -DCMAKE_SKIP_RPATH=ON
    -DJAS_ENABLE_DOC=OFF
  )
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake ${options[@]} -DJAS_ENABLE_SHARED=OFF ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ${options[@]} -DJAS_ENABLE_SHARED=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/jasper-version-${pkgver}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/jasper-version-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    fi
  done
}

# vim: ts=2 sw=2 et:
