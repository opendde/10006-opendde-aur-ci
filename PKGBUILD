# Maintainer: Jia Sui <jsfaint at gmail dot com>

pkgname=known_hosts
_pkgname=known_hosts
pkgver=1.0.0.r5.g74e64c4
pkgrel=2
pkgdesc="A simple cli ssh known_hosts manager "
arch=('i686' 'x86_64')
url="https://github.com/markmcconachie/known_hosts"
makedepends=('git' 'cmake')
source=('git+https://github.com/markmcconachie/known_hosts.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  mkdir build
  cd build
  cmake ../
  make
}

package() {
  cd "$srcdir"

  # binary
  install -Dm755 $_pkgname/build/known_hosts $pkgdir/usr/bin/known_hosts

  # license
  install -Dm644 $_pkgname/README.md $pkgdir/usr/share/$_pkgname
}

# vim:set ts=2 sw=2 ft=sh et:
