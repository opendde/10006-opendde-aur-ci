# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Anonymo <meowdib at gmail dot com>

pkgname=clarity-icon-theme
pkgver=0.4.7
pkgrel=1
pkgdesc="Vector icons in 9 colourthemes for GTK"
arch=('any')
makedepends=('imagemagick' 'librsvg')
url="https://www.gnome-look.org/p/1012535"
license=('CCPL:by-sa')
options=(!strip !zipman)
source=(https://dl.opendesktop.org/api/files/download/id/1502786869/${pkgname}_${pkgver}.tar.gz)
md5sums=('2d889963e20263a6fcfdc82ad0de4129')

##############################################################
#Put the themes you want to build in _buildtheme array below.#
#By default all themes will be built.                        #
#                                                            #
#Available themes:                                           #
# violaceus      - violet/pink gradient                      #
# lux_violaceus   -  glossy variant                          #
# canus          - grey gradient                             #
# dark_canus     - dark grey gradient                        #
# caeruleus      - blue gradient                             #
# lux_caeruleus   -  glossy variant                          #
# viridis        - green gradient                            #
# luteus         - orange gradient                           #
# albus          - white solid                               #
##############################################################

_buildtheme=(violaceus lux_violaceus canus dark_canus caeruleus lux_caeruleus viridis luteus albus)

build() {
 for _theme in ${_buildtheme[*]}; do
  cd ${srcdir}/Clarity
  make ${_theme}
  make arch
  install -d themes/${_theme}
  cp -r {scalable,16x16,index.theme} themes/${_theme}
  sed -i s/Name=Clarity/Name=Clarity-${_theme}/ themes/${_theme}/index.theme
 done
}

package() {
 for _theme in ${_buildtheme[*]}; do
  install -d "${pkgdir}/usr/share/icons/clarity-${_theme}"
  cp -r ${srcdir}/Clarity/themes/${_theme}/{scalable,16x16,index.theme} \
   "${pkgdir}/usr/share/icons/clarity-${_theme}"

  cd "${pkgdir}/usr/share/icons/clarity-${_theme}"
  ln -s applications-science.svg scalable/categories/applications-education.svg
  ln -s applications-science.png 16x16/categories/applications-education.png
 done
}
