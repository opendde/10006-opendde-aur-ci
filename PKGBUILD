# Maintainer: Josef Behr <dev[at]josef-behr[dot]de>
pkgname=somafm-qt
pkgver=0.1
pkgrel=1
pkgdesc="A player for somafm.com radio channels written in qt5/c++"
url="http://www.github.com/josefbehr/somafm-qt"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-base' 'qt5-multimedia')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git://github.com/josefbehr/somafm-qt.git#tag=v0.1")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D somafm-qt "$pkgdir/usr/bin/somafm-qt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
