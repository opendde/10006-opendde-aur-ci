# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-sundials
pkgver=5.0.0
pkgrel=1
pkgdesc="Suite of nonlinear differential/algebraic equation solvers (mingw-w64)"
arch=('any')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://computation.llnl.gov/projects/sundials/download/sundials-${pkgver}.tar.gz")
sha256sums=('345141ec01c641d0bdfb3476c478b7e74fd6a7192a478a27cafe75d9da2d7dd3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/sundials-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DEXAMPLES_ENABLE_C=OFF \
      -DLAPACK_ENABLE=ON \
      -DSUNDIALS_INDEX_TYPE=int32_t \
      -DSUNDIALS_F77_FUNC_CASE="LOWER" -DSUNDIALS_F77_FUNC_UNDERSCORES="ONE" \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/sundials-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    install -d "${pkgdir}"/usr/${_arch}/bin/
    mv "${pkgdir}"/usr/${_arch}/lib/*.dll "${pkgdir}"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

