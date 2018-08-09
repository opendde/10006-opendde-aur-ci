# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=mingw-w64-portaudio
pkgver=190600_20161030
pkgrel=2
pkgdesc="A free, cross-platform, open source, audio I/O library. (mingw-w64)"
arch=('any')
url="http://www.portaudio.com"
license=("custom")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!libtool' '!strip' '!buildflags' '!makeflags' 'staticlibs')
source=("http://www.portaudio.com/archives/pa_stable_v${pkgver}.tgz"
        "fix-build.patch"
        "wdmks-wasapi-dsound.patch.tar.gz")
sha256sums=('f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513'
            '77e8438d482ad03baa5c23afbe293e8cbdb95287ff6a489515bde61231e78525'
            'e0d2c619323e81e2b9539bb6f061289f08f2a01b6c7edd6228f7e750b0421166')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/portaudio
  
  patch -p0 -i ${srcdir}/fix-build.patch
  patch -p0 -i ${srcdir}/wdmks-wasapi-dsound.patch

  autoconf
}

build() {
  export lt_cv_deplibs_check_method='pass_all'
  
  cd ${srcdir}/portaudio
  
  for _arch in ${_architectures}; do
    # static
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-configure \
      --enable-static \
      --disable-shared \
      --with-dxdir=/usr/${_arch} \
      --with-winapi=wmme,directx,wasapi,wdmks \
      ..
    make
    popd
    
    # shared
    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-configure \
      --disable-static \
      --enable-shared \
      --with-dxdir=/usr/${_arch} \
      --with-winapi=wmme,directx,wasapi,wdmks \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    # static
    cd "${srcdir}/portaudio/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    # shared
    cd "${srcdir}/portaudio/build-${_arch}-shared"
    make DESTDIR="${pkgdir}" install
    
    # move DLL to bin directory
    mkdir -p "$pkgdir"/usr/${_arch}/bin
    find "$pkgdir"/usr/${_arch}/lib -iname '*.dll' -exec mv --target-directory="$pkgdir"/usr/${_arch}/bin {} \;
    
    # strip executables and libraries
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
