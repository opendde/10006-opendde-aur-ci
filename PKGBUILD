pkgname=mingw-w64-mesa
pkgver=21.1.1
pkgrel=2
pkgdesc="An open-source implementation of the OpenGL specification (mingw-w64)"
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
makedepends=('mingw-w64-meson' 'mingw-w64-cmake' 'python-mako')
depends=('mingw-w64-llvm' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-dlfcn' 'mingw-w64-regex')
options=('staticlibs' '!strip' '!buildflags')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC'  # Dylan Baker <dylan@pnwbakers.com>
              '57551DE15B968F6341C248F68D8E31AFC32428A6') # Eric Engestrom <eric@engestrom.ch>
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig})
sha256sums=('eec25ea379054e8911bc5de816aeb50f581b5b708414725003d2f00386b38dd2'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/mesa-${pkgver}
}

build() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch} -Db_lto=false -Dgallium-drivers=swrast,zink -Dvulkan-drivers=swrast
    ninja -C build-${_arch} ${MAKEFLAGS}
  done
}

package() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    install -d "$pkgdir"/usr/${_arch}/bin
    install -m755 build-${_arch}/src/gallium/targets/libgl-gdi/opengl32.dll "$pkgdir"/usr/${_arch}/bin
    install -m755 build-${_arch}/src/gallium/targets/lavapipe/vulkan_lvp.dll "$pkgdir"/usr/${_arch}/bin
    install -m644 build-${_arch}/src/gallium/targets/lavapipe/lvp_icd.*.json "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
