# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("vapoursynth-plugin-${_plug}-git")
pkgver=vA.5a.0.gebe2ad2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
license=('LGPL')
depends=('vapoursynth'
         'liblsmash.so'
         'libavcodec.so'
         'libavformat.so'
         'libavutil.so'
         'libswresample.so'
         'libswscale.so'
          )
makedepends=('git'
             'meson'
             'vapoursynth'
             'l-smash'
             'ffmpeg'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/AmusementClub/L-SMASH-Works.git#branch=ffmpeg-4.5")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/include"
}

build() {
  cd build
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  arch-meson "../${_plug}/VapourSynth" \
    --buildtype=release

  ninja

}

package_vapoursynth-plugin-lsmashsource-git() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${_plug}/AviSynth/README" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
