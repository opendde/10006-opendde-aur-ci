# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: farid <farid at archlinuc-br.org>
# Contributor: Archie <Mymaud@gmail.com>

# pkgbase='gmic'
pkgname='gmic-no-opencv'
_basename="${pkgname%%-*}"
pkgver=3.1.2
pkgrel=3
pkgdesc="GREYC's Magic Image Converter: image processing framework"
arch=('x86_64')
url='https://gmic.eu/'
license=('custom:CeCILL')
depends=(
  'fftw'
  'graphicsmagick'
)
makedepends=(
  'cmake'
  'eigen'
  'openexr'
  'qt5-base'
  'qt5-tools'
)
# makedepends+=(gimp opencv) # dropped
optdepends=('qt5-base: for the Qt UI')
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}" 'cimg')
_tarname="${_basename}_${pkgver}"
_tardirname="${_tarname/_/-}"
source=("${url}files/source/${_tarname}.tar.gz"
        'CMakeLists.txt'
        'FindCImg.cmake'
        'FindGMicStdlib.cmake')
sha256sums=('d5070c559c75161a225d74a99c19faf2485a3983139290f998cc6359bb318ba4'
            '089c4ad204a1ed43c9425e3f39e5a3a8bab3d6e8c4fb5a6dfc69e0fca15abd15'
            '5ad1b499cb0a9e3d9fff6a851346d6f356dfc592442183d6330726a29ee25384'
            '83e4635a6fd101511381bc865255f4de88834da51911ce3eb45ddac2558cabcc')

prepare() {
  mv 'CMakeLists.txt' "${_tardirname}"
  mkdir -p "${_tardirname}/cmake"
  mv 'FindCImg.cmake' 'FindGMicStdlib.cmake' "${_tardirname}/cmake"

  cmake -B 'build' -S "${_tardirname}" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_DYNAMIC_LINKING='ON' \
    -DBUILD_LIB_STATIC='OFF' \
    -DENABLE_OPENCV='OFF'

  LDFLAGS="$LDFLAGS -L../build"
  cmake -B 'build-qt' -S "${_tardirname}/gmic-qt" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_DYNAMIC_LINKING='ON' \
    -DGMIC_PATH="${srcdir}/${_tardirname}/src" \
    -DGMIC_QT_HOST='none'
}

build() {
  cmake --build 'build'
  cmake --build 'build-qt'
}

package() {
  DESTDIR="${pkgdir}" cmake --install 'build'
  install -Dm 644 "${_tardirname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  DESTDIR="${pkgdir}" cmake --install 'build-qt'

  install -Dm 644 "${_tardirname}/resources/gmic_cluts.gmz" -t "${pkgdir}/usr/share/${_basename}"
}

