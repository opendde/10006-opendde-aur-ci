# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=halo-icons-git
pkgver=1.6
pkgrel=0
pkgdesc="Halo is an icon theme for Linux desktops, the set is inspired by the latest flat design trend from Alejandro Camarena"
arch=('any')
url="https://github.com/archmerge/Halo-icons"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('halo-icons-git')
options=(!strip !emptydirs)
source=('Halo::git+https://github.com/archmerge/Halo-icons')
sha256sums=('SKIP')

package() {
  cd Halo

  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' 'HALO' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'HALODARK' "${pkgdir}"/usr/share/icons/

}
