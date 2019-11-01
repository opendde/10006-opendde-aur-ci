# Maintainer: Akatsuki <akiirui@outlook.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>

pkgname=rime-data
_gitname=plum
pkgver=r2019.11.01
pkgrel=1
pkgdesc="Rime schema repository from plum"
arch=('x86_64')
url="https://github.com/rime/plum/"
license=('GPL3')
makedepends=('git' 'librime')
provides=('librime-data' 'brise')
conflicts=('brise')
source=("git+https://github.com/rime/plum.git")
sha512sums=('SKIP')

pkgver() {
  build_date=r$(date +%Y.%m.%d)
  echo $build_date
}

build() {
  cd "$_gitname"
  make all
  rime_deployer --build output
  rm output/user.yaml
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
