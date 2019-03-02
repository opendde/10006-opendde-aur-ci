# Maintainer: twa022 <twa022 at gmail dot com>
# Maintainer: erik dubois <erik.dubois@gmail.com>
pkgname=sardi-ghost-flexible-mint-y-icons-git
_pkgname=sardi-ghost-flexible-mint-y-icons
pkgver=361.3df4ca52
pkgrel=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set with Sardi-Ghost-Flexible as main icon set"
arch=('any')
url="https://github.com/linuxmint/mint-y-icons"
license=('GPL3')
depends=('sardi-icons')
makedepends=()
optdepends=()
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/linuxmint/mint-y-icons.git)
sha256sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
package() {
  cd ${srcdir}/${_pkgname}/usr/share/icons
  rm -rf Mint-Y
  find .  -name "index.theme" -type f -exec sed -i "s/Name=Mint-Y-/Name=Sardi-Ghost-Flexible-Mint-Y-/g" {} \;
  find .  -name "index.theme" -type f -exec sed -i "s/Inherits=Mint-Y,Adwaita,gnome,hicolor/Inherits=Sardi-Ghost-Flexible,Sardi,Surfn,Adwaita,gnome,hicolor/g" {} \;
  mv Mint-Y-Aqua Sardi-Ghost-Flexible-Mint-Y-Aqua
  mv Mint-Y-Blue Sardi-Ghost-Flexible-Mint-Y-Blue
  mv Mint-Y-Brown Sardi-Ghost-Flexible-Mint-Y-Brown
  mv Mint-Y-Grey Sardi-Ghost-Flexible-Mint-Y-Grey
  mv Mint-Y-Orange Sardi-Ghost-Flexible-Mint-Y-Orange
  mv Mint-Y-Pink Sardi-Ghost-Flexible-Mint-Y-Pink
  mv Mint-Y-Purple Sardi-Ghost-Flexible-Mint-Y-Purple
  mv Mint-Y-Red Sardi-Ghost-Flexible-Mint-Y-Red
  mv Mint-Y-Sand Sardi-Ghost-Flexible-Mint-Y-Sand
  mv Mint-Y-Teal Sardi-Ghost-Flexible-Mint-Y-Teal
  cd ${srcdir}/${_pkgname}
  cp -aR ./usr ${pkgdir}
}
