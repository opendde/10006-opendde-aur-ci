# Maintainer: Linux Gamers <linuxgamers@protonmail.com>
_pkgname=yuzu-mainline
pkgname="${_pkgname}-bin"
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
_pkgver=327
pkgver="0.${_pkgver}"
pkgrel=1
pkgdesc="Yuzu emulator 'mainline' branch binaries for Arch Linux"
arch=('any')
url="https://github.com/linux-gamers/arch-yuzu-mainline"
license=('GNU General Public License v2.0')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11' 'libfdk-aac' 'fmt' 'libzip')
optdepends=('qt5-wayland: for Wayland support')
source=("${url}/archive/0-${_pkgver}.tar.gz")
sha512sums=('ad78be4d556a895e836dd876c89d58a5170dacdb7d80f96e2f97efd3765d90df874bd083214fd275012fcefc9aced28398e4fa9dfbd6ca40fb239076dff0d82e')

package() {
  cd "${srcdir}/arch-${_pkgname}-0-${_pkgver}"
  
  mkdir -p $pkgdir/usr/bin
  mv yuzu $pkgdir/usr/bin/
  mv yuzu-cmd $pkgdir/usr/bin/ 

  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
  mv yuzu.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/
 
  mkdir -p $pkgdir/usr/share/applications
  mv yuzu.desktop $pkgdir/usr/share/applications/
}