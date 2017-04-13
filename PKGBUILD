# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-libbluray
pkgver=1.0.0
pkgrel=1
pkgdesc='Library to access Blu-Ray disks for video playback (mingw-w64)'
arch=('any')
url='http://www.videolan.org/developers/libbluray.html'
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-fontconfig' 'mingw-w64-freetype2' 'mingw-w64-libxml2')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
#makedepends=('apache-ant' 'git' 'mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
#optdepends=('java-environment: BD-J library')
source=("ftp://ftp.videolan.org/pub/videolan/libbluray/${pkgver}/libbluray-${pkgver}.tar.bz2")
sha256sums=('f7e3add335c7bbef45824fcd2249a9bf293868598c13f8479352c44ec95374cc')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libbluray-${pkgver}/build-${_arch} && cd ${srcdir}/libbluray-${pkgver}/build-${_arch}

    ${_arch}-configure \
      --disable-examples \
      --disable-bdjava
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libbluray-${pkgver}/build-${_arch}

    make DESTDIR="$pkgdir" install
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
