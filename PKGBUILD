# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-driftcar-git
_gitname=${pkgname%-git*}
pkgver=17.9920427
pkgrel=1
pkgdesc='A vehicle using some physics modelling for more realistic behaviour. (Mod for Minetest)'
arch=('any')
url="https://github.com/paramat/driftcar"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/paramat/driftcar.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
  cp -r * "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
}

