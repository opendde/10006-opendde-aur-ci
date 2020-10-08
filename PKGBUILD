# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=nbwmon-git
pkgver=0.5.2.r15.gf159b35
pkgrel=1
pkgdesc="ncurses bandwidth monitor"
arch=('i686' 'x86_64')
url="https://github.com/causes-/nbwmon"
license=('custom:MIT/X')
depends=('ncurses')
makedepends=('git')
provides=('nbwmon')
conflicts=('nbwmon')
source=("${pkgname%-*}::git+https://github.com/causes-/nbwmon.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  make
}

package() {
  cd "${pkgname%-*}"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
