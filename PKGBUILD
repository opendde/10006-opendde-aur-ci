# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Sander Boom <sanderboom@gmail.com>
# Contributor: realitygaps <realitygaps at yahoo dot com>

pkgname=sublime-text-dev
pkgver=4.4124
pkgrel=1
pkgdesc="Sophisticated text editor for code, html and prose - dev build"
arch=('x86_64' 'aarch64')
url="https://www.sublimetext.com/dev"
license=('custom')
depends=('libpng' 'gtk3')
optdepends=('gksu: sudo-save support')
conflicts=('sublime-text')
provides=('sublime-text')
install=${pkgname}.install

source=('sublime_text.desktop')
source_x86_64=("https://download.sublimetext.com/sublime_text_build_${pkgver:2}_x64.tar.xz")
source_aarch64=("https://download.sublimetext.com/sublime_text_build_${pkgver:2}_arm64.tar.xz")

sha256sums=('e991aac5207655dadf69c6f74c194c80009fb9767d7710337f586908969aa9cf')
sha256sums_x86_64=('09bcef0968a5de98e9d27ca48e602153f0c4dfc319b6da0edeada82526ccd4bb')
sha256sums_aarch64=('ac7aa1fc922c04eb2b1fa54dfecc4fe51b41574b00cc44dc72683659c74a8c22')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "sublime_text" "${pkgdir}/opt/sublime_text"

  for res in 128x128 16x16 256x256 32x32 48x48; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    ln -s "/opt/sublime_text/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text.png"
  done

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "sublime_text.desktop" "${pkgdir}/usr/share/applications/sublime_text.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/sublime_text/sublime_text" "${pkgdir}/usr/bin/subl"
}
