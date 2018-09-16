# Contributor: napa3um <napa3um@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-sqlite
_amalgamationver=3250000
pkgver=3.25.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=(any)
groups=(mingw-w64)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure mingw-w64-pdcurses mingw-w64-readline)
options=(!buildflags !strip staticlibs)
license=('custom:Public Domain')
url="http://www.sqlite.org/"
source=("http://www.sqlite.org/2018/sqlite-autoconf-$_amalgamationver.tar.gz")
sha256sums=('de1a93dfc1ea23d93ee85440fe4347d0b9cd936f25c29645ee0ee170d1307f71')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS="-DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_DISABLE_DIRSYNC=1 -DSQLITE_ENABLE_FTS3=3 -DSQLITE_ENABLE_RTREE=1" \
    config_TARGET_EXEEXT=.exe \
    ${_arch}-configure \
      --enable-threadsafe
    make
    popd
  done
}

package() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/${_arch}/share"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    popd
  done
}

