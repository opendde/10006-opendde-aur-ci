# Maintainer: Stuart Cardall <developer__at__it-offshore.co.uk>
pkgname=arch-sign-modules
_pkgname=Arch-SKM
pkgver=0.2.1
pkgrel=2
pkgdesc="Helper scripts for Signed Kernel Modules"
arch=(x86_64)
url="https://github.com/itoffshore/Arch-SKM"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://github.com/itoffshore/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('1c021866e93f0401322f3a1ffccb493f')

build() {
  return 0
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{src,bin,share/$pkgname}
  
  cp -rf certs-local $pkgdir/usr/src/
  cp scripts/* $pkgdir/usr/bin/
  cp Arch-Linux-PKGBUILD-example $pkgdir/usr/share/$pkgname/PKGBUILD.example
}
