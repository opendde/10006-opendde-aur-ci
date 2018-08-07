# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-screenshot-git
pkgver=132.c9a2360
pkgrel=1
pkgdesc="Gnome Shell extension for making and uploading screenshots"
arch=('any')
url="https://github.com/OttoAllmendinger/gnome-shell-screenshot"
license=('MIT')
depends=('gnome-shell')
makedepends=('git' 'zip')
source=("${pkgname}::git+https://github.com/OttoAllmendinger/gnome-shell-screenshot.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd ${pkgname}
  _extid="gnome-shell-screenshot@ttll.de"
  _extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

  make EXTENSION_PATH=${_extpath} install
}
