# Maintainer: twa022 <twa022 at gmail dot com>
# Maintainer: erik dubois <erik.dubois@gmail.com>
pkgname=sardi-flexible-mint-y-icons-git
_pkgname=sardi-flexible-mint-y-icons
pkgver=398.2442a3a26
pkgrel=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set with Sardi-Flexible as main icon set"
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
  rm -rf Mint-Y-Dark
  rm -rf Mint-Y-Dark-Aqua 
  rm -rf Mint-Y-Dark-Blue 
  rm -rf Mint-Y-Dark-Brown 
  rm -rf Mint-Y-Dark-Grey 
  rm -rf Mint-Y-Dark-Orange 
  rm -rf Mint-Y-Dark-Pink 
  rm -rf Mint-Y-Dark-Purple 
  rm -rf Mint-Y-Dark-Red 
  rm -rf Mint-Y-Dark-Sand 
  rm -rf Mint-Y-Dark-Teal
    find .  -name "index.theme" -type f -exec sed -i "s/Name=Mint-Y-/Name=Sardi-Flexible-Mint-Y-/g" {} \;
  find .  -name "index.theme" -type f -exec sed -i "s/Inherits=Mint-Y,Adwaita,gnome,hicolor/Inherits=Sardi-Flexible,Sardi,Surfn,Adwaita,gnome,hicolor/g" {} \;
  mv Mint-Y-Aqua Sardi-Flexible-Mint-Y-Aqua
  mv Mint-Y-Blue Sardi-Flexible-Mint-Y-Blue
  mv Mint-Y-Brown Sardi-Flexible-Mint-Y-Brown
  mv Mint-Y-Grey Sardi-Flexible-Mint-Y-Grey
  mv Mint-Y-Orange Sardi-Flexible-Mint-Y-Orange
  mv Mint-Y-Pink Sardi-Flexible-Mint-Y-Pink
  mv Mint-Y-Purple Sardi-Flexible-Mint-Y-Purple
  mv Mint-Y-Red Sardi-Flexible-Mint-Y-Red
  mv Mint-Y-Sand Sardi-Flexible-Mint-Y-Sand
  mv Mint-Y-Teal Sardi-Flexible-Mint-Y-Teal
  cd ${srcdir}/${_pkgname}
  cp -aR ./usr ${pkgdir}
}
