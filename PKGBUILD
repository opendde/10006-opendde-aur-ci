# Maintainer: Chris Werner Rau <aur@cwrau.io>
# Maintainer: flaviofearn <flavioislima@gmail.com>

pkgname=heroic-games-launcher-bin
_pkgver=v2.4.3
pkgver=${_pkgver#v}
pkgrel=2
pkgdesc="HGL, a Native alternative Linux Launcher for Epic Games"
arch=('x86_64')
url="https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher"
license=('GPL3')
conflicts=(${pkgname%-*}-{appimage,electron})
depends=('fuse2' 'gawk')
_filename=heroic-${pkgver}.pacman
source=("$url/releases/download/${_pkgver}/${_filename}")
noextract=("${_filename}")
md5sums=('3e23778732763d2d4c202eeba56f9624')
options=(!strip)

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}

# vim:set ts=2 sw=2 et: syntax=sh
