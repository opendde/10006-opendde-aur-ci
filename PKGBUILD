pkgname=mingw-w64-coin-or-bonmin
pkgver=1.8.7
pkgrel=1
pkgdesc="Experimental open-source C++ code for solving general MINLP problems (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Bonmin"
license=('EPL')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-coin-or-cbc' 'mingw-w64-coin-or-ipopt' 'mingw-w64-coin-or-bcp')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("https://www.coin-or.org/download/source/Bonmin/Bonmin-$pkgver.tgz")
sha256sums=('3e5bcb57f2a7995ce4fd9c76c033050e487ea375ecf0e277dabc22159c8cfb31')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/Bonmin-$pkgver"
  # see mingw-w64-coin-or-pkg-config
  sed -i "s|export PKG_CONFIG_PATH|export PKG_CONFIG_PATH_CUSTOM|g" Bonmin/configure
  sed -i "s| PKG_CONFIG_PATH=| PKG_CONFIG_PATH_CUSTOM=|g" Bonmin/configure
}

build() {
  cd "$srcdir/Bonmin-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    CXXFLAGS="-DCOIN_HAS_ASL -DCOIN_HAS_MUMPS" ${_arch}-configure \
       --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
       --with-osi-incdir="/usr/${_arch}/include/coin/" \
       --with-clp-lib="$(${_arch}-pkg-config --libs clp)" \
       --with-clp-incdir="/usr/${_arch}/include/coin/" \
       --with-cgl-lib="$(${_arch}-pkg-config --libs cgl)" \
       --with-cgl-incdir="/usr/${_arch}/include/coin/" \
       --with-vol-lib="$(${_arch}-pkg-config --libs vol)" \
       --with-vol-incdir="/usr/${_arch}/include/coin/" \
       --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
       --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
       --with-bcp-lib="$(${_arch}-pkg-config --libs bcp)" \
       --with-bcp-incdir="/usr/${_arch}/include/coin/" \
       --with-cbc-lib="$(${_arch}-pkg-config --libs cbc)" \
       --with-cbc-incdir="/usr/${_arch}/include/coin/" \
       --with-ipopt-lib="$(${_arch}-pkg-config --libs ipopt)" \
       --with-ipopt-incdir="/usr/${_arch}/include/coin/" \
       lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Bonmin-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    #rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

