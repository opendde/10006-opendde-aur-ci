
pkgname=mingw-w64-optpp
pkgver=2.4
pkgrel=3
pkgdesc='An Object-Oriented Nonlinear Optimization Library (mingw-w64)'
url='https://software.sandia.gov/opt++/'
arch=('any')
license=('LGPL2.1')
depends=('mingw-w64-blas')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("${url}/downloads/optpp-${pkgver}.tar.gz")
sha256sums=('b452cdf8aa770088e26b49e07b5cf13ae5972832c032abcad07a56baa2a588ef')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/optpp-${pkgver}"
  sed -i "26i@top_builddir@_lib_libnewmat_la_LDFLAGS = -no-undefined" newmat11/Makefile.am
  sed -i "22i@top_builddir@_lib_libopt_la_LIBADD += @top_builddir@/lib/libnewmat.la" src/Makefile.am
  sed -i "22i@top_builddir@_lib_libopt_la_LIBADD += \$(BLAS_LIBS)" src/Makefile.am
  sed -i "24i@top_builddir@_lib_libopt_la_LDFLAGS = -no-undefined" src/Makefile.am
  autoreconf -vfi
}

build() {
  cd "${srcdir}/optpp-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --includedir=/usr/${_arch}/include/opt++
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/optpp-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
