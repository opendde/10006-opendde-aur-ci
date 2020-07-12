# Maintainer: HanFox <han@hanfox.co.uk>
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>
# Based on the 'aur/openttd-git PKGBUILD by McModder <mcmodder@mcmodder.ru>

pkgname=openttd-jgrpp
pkgver=0.35.0
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack."
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'tar' 'fluidsynth')
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-${pkgver}.tar.gz")
sha256sums=('c39f9c7e19eaec34c896265cb74604403a8f9a94e77c0eb714199e4b083cf44a')

_dirname=OpenTTD-patches-jgrpp

build() {
  cd ${_dirname}-${pkgver}
  
  mkdir -p build
  cd build
  
  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBINARY_NAME="${pkgname}" \
    -DCMAKE_INSTALL_DATADIR="share" \
    -DCMAKE_INSTALL_DOCDIR="share/doc/${pkgname}" \
    -DGLOBAL_DIR="/usr/share/${pkgname}" \
    -DPERSONAL_DIR=".${pkgname}" \
    ..

  make
}

package() {
  cd "${_dirname}-${pkgver}/build"
  
  #mkdir -p ${pkgdir}/usr/share/${pkgname}/{data,game}

  make install DESTDIR="$pkgdir"
  
  ## install icons
  for _res in 16 32 64 128 256; do
    install -Dm 644 "${srcdir}/${_dirname}-${pkgver}/media/openttd.${_res}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
  done
  
  ## from old makefiles (Makefile.bundle.in, config.lib)
  ## install template desktop file
  install -Dm 644 "${srcdir}/${_dirname}-${pkgver}/media/openttd.desktop.in" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  ## then replace template fields with real data
  sed -i "s@!!TTD!!@${pkgname}@g;s@!!MENU_GROUP!!@Game;@g;s@!!MENU_NAME!!@OpenTTD (JGR Patch Pack)@g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  ## and add multi-lang comments to dekstop file
  awk -f "${srcdir}/${_dirname}-${pkgver}/media/openttd.desktop.translation.awk" "${srcdir}/${_dirname}-${pkgver}/src/lang/"*.txt | LC_ALL=C sort | awk -f "${srcdir}/${_dirname}-${pkgver}/media/openttd.desktop.filter.awk" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
} 
