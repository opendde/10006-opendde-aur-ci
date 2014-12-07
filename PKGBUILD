# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=dex-git
_gitname=dex
pkgver=48.21a763e
pkgrel=2
pkgdesc="A program to execute DesktopEntry files of type Application, primarily for window managers that do not implement the Freedesktop autostart specification"
url="https://github.com/jceb/dex"
arch=('any')
license=('GPL2')
depends=('python')
makedepends=('git' 'python-sphinx')
provides=('dex')
conflicts=('dex')
source=('git+https://github.com/jceb/dex.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd $_gitname
  install -m755 -D dex $pkgdir/usr/bin/dex
}

# vim:set ts=2 sw=2 et:
