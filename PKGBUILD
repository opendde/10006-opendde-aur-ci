# Maintainer: Amber <amber@mail.cyborgtrees.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=freeablo
pkgver=0.4
pkgrel=2
pkgdesc="Modern, FLOSS reimplementation of the Diablo 1 game engine"
arch=(x86_64)
url="https://freeablo.org/"
license=(GPL3)
depends=(sdl2_image sdl2_mixer zlib enet bzip2 libgl qt5-base)
makedepends=(cmake)
install=freeablo.install
source=("https://github.com/wheybags/freeablo/archive/refs/tags/v${pkgver}.tar.gz"
		"freeablo.patch"
        "https://github.com/wheybags/freeablo/pull/504/commits/ae952ca143aa0313b2f9018dc33f7f07047fad0a.patch")
sha256sums=('322a06bebf6c522ebac1195f48962abd330050f447ea3a9ee977cd2d60b1258f'
            'bbff90626c0dbe278b2c39553ee307a66e3a1c5645454046c687b45f0d8ef78f'
            'a8b6601d684a0ed6697a3eedb50889645c5557911b7a137767eef830944cb469')


prepare() {
  cd "${srcdir}"
  patch -s -p0 < freeablo.patch
  mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../ae952ca143aa0313b2f9018dc33f7f07047fad0a.patch #fixes a libpng vuln
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake .. -Wno-dev \
    -DVIDEO_OPENGLES:BOOL=OFF \
    -DVIDEO_RPI:BOOL=OFF \
    -DVIDEO_VIVANTE:BOOL=OFF \
    -DVIDEO_WAYLAND:BOOL=OFF \
    -DVIDEO_WAYLAND_QT_TOUCH:BOOL=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install
  install -Dm644 ../readme.md "${pkgdir}/usr/share/doc/freeablo/readme.md"

  install -D "${srcdir}/${pkgname}-${pkgver}/resources/launcher/play.png" "${pkgdir}/usr/share/pixmaps/freeablo.png"
  cd "${pkgdir}/usr"
  pwd
  mkdir -p "share/${pkgname}"
  mv resources "share/${pkgname}/"
  }
