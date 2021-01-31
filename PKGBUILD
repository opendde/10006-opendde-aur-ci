# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=occt-webgl-viewer
pkgver=7.5.0
_ftver=2.10.4  # freetype version to use here
_pkgver=V${pkgver//./_}
pkgrel=1
pkgdesc="Open CASCADE Technology WebGL 3D Viewer for rendering 3d models on a website"
arch=(x86_64)
url="https://www.opencascade.org"
license=(LGPL custom)
depends=()
makedepends=(
tk
gl2ps
ffmpeg
freeimage
emscripten
cmake
ninja
)
options=(!buildflags)
source=(
"opencascade-${pkgver}.tgz::https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/${_pkgver};sf=tgz"
"freetype-${_ftver}.tar.xz::https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${_ftver}.tar.xz" 
)
      
sha256sums=('c8df7d23051b86064f61299a5f7af30004c115bdb479df471711bab0c7166654'
            '86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784')

prepare() {
  cd "occt-${_pkgver}"
}

build() {
  source /etc/profile.d/emscripten.sh
  
  msg2 "building freetype for the web"
  pushd freetype-${_ftver}
  emconfigure ./configure
  emcmake cmake -Wno-dev \
    -G Ninja \
    -B ft_build \
    -S .
  DESTDIR="${srcdir}/freetype-${_ftver}/install" emmake cmake --build ft_build -- install
  popd  

  msg2 "building occt for the web"
  pushd occt-${_pkgver}
  emcmake cmake -Wno-dev \
    -D BUILD_MODULE_Draw=NO \
    -D BUILD_LIBRARY_TYPE=Static \
    -D BUILD_DOC_Overview=NO \
    -D 3RDPARTY_FREETYPE_LIBRARY="${srcdir}/freetype-${_ftver}/install/usr/local/lib/libfreetype.a" \
    -D 3RDPARTY_FREETYPE_LIBRARY_DIR="${srcdir}/freetype-${_ftver}/install/usr/local/lib" \
    -D 3RDPARTY_FREETYPE_INCLUDE_DIR_ft2build="${srcdir}/freetype-${_ftver}/install/usr/local/include/freetype2" \
    -D 3RDPARTY_FREETYPE_INCLUDE_DIR_freetype2="${srcdir}/freetype-${_ftver}/install/usr/local/include/freetype2" \
    -G Ninja \
    -B occt_build \
    -S .
  emmake cmake --build occt_build
  pushd occt_build
  emmake make DESTDIR="${srcdir}/occt-${_pkgver}/install" install
  popd
  popd

  msg2 "building WebGL viewer example"
  pushd occt-${_pkgver}/samples/webgl
  emcmake cmake -Wno-dev \
    -G Ninja \
    -B web_build \
    -S .
  emmake cmake --build web_build
}

package() {
  source /etc/profile.d/emscripten.sh
  cd occt-${_pkgver}/samples/webgl
  DESTDIR="${pkgdir}/opt/${pkgname}" emmake cmake --build web_build -- install

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE_LGPL_21.txt
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" OCCT_LGPL_EXCEPTION.txt
}

# vim:set ts=2 sw=2 et:
