# Maintainer: Konrad Sekuła <konradsekula@outlook.com>
pkgname=bruh
pkgver=1.0
pkgrel=0
pkgdesc="bruh"
arch=('i686' 'x86_64')
license=('GPL')
depends=("alsa-utils")
makedepends=("coreutils" "gcc")
source=("git+https://github.com/kejpies/bruh")
provides=("bruh")
pkgver(){
  cd "$srcdir/$pkgname"
  cat ver
}
build() {
  cd "$srcdir/$pkgname"
  make
}
package() {
  cd "$srcdir/$pkgname"
  
  install -Dm 755 -o root bruh $pkgdir"/usr/bin/bruh"
  install -Dm 644 -o root bruh.wav $pkgdir"/usr/share/bruh/bruh.wav"
}

md5sums=(SKIP)
