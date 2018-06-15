# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Matt Coffin <mcoffin13@gmail.com>
pkgname=bossa-git
pkgver=1.8.r48.gb176eee
pkgrel=1
pkgdesc="Flash programming utility for Atmel's SAM family of flash-based ARM microcontrollers"
arch=('i686' 'x86_64')
url="https://github.com/shumatech/BOSSA"
license=('BSD')
depends=('readline' 'wxgtk')
provides=('bossa')
conflicts=('bossa')
source=("git://github.com/shumatech/BOSSA")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/BOSSA"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/BOSSA"
  make VERSION="$pkgver"
}

package() {
  cd "$srcdir/BOSSA"
  install -Dm755 -t "$pkgdir/usr/bin/" bin/bossa*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}

# vim:set ts=2 sw=2 et:
