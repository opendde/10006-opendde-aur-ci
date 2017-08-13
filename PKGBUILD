# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=remapframes
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.0.4.g8669000
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='https://forum.doom9.org/showthread.php?t=174727'
license=('BSD')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/Vapoursynth-RemapFrames.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  mkdir -p build

  cd "${_plug}"

  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
    -i Common.h
}

build() {
  cd build
  meson \
    "../${_plug}" \
    --prefix=/usr \
    --buildtype=release

  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${pkgname}/README.rst"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
