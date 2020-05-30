# Maintainer: Felix Yan <felixonmars@archlinux.org>

_pkgname=chnroutes-alike
pkgname=$_pkgname-git
pkgver=0.2.066149b
pkgrel=1
pkgdesc="Collection of IP ranges not in China but works good enough"
arch=('any')
url="https://github.com/felixonmars/chnroutes-alike"
license=('Unlicense') 
makedepends=('git')
source=("git+https://github.com/felixonmars/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_pkgname
  install -Dm644 chnroutes-alike.txt -t "$pkgdir"/usr/share/chnroutes-alike/
}

# vim:set ts=2 sw=2 et:
