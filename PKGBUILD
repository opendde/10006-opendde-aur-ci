# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: orelien <aurelien.foret@wanadoo.fr>

_pkgname=rp-pppoe
pkgname=${_pkgname}-gui
pkgver=3.12
pkgrel=1
pkgdesc="GUI for Roaring Penguin's Point-to-Point Protocol over Ethernet client"
arch=('i686' 'x86_64')
url="http://www.roaringpenguin.com/pppoe/"
license=('GPL')
depends=("$_pkgname=$pkgver" 'tk')
options=('!makeflags' '!emptydirs')
source=(http://www.roaringpenguin.com/files/download/rp-pppoe-$pkgver.tar.gz{,.sig} 
       kmode.patch)
validpgpkeys=('FC2E9B645468698FD7B21655C1842E2A126F42E0') # Dianne Skoll

prepare() {
  cd "$srcdir/$_pkgname-$pkgver/src"
  patch -Np2 -i ../../kmode.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver/src"
  ./configure --prefix=/usr --sbindir=/usr/bin --enable-plugin
  cd ../gui
  make PLUGIN_DIR="/usr/lib/rp-pppoe"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/src"
  cd ../gui
  make PLUGIN_DIR="/usr/lib/rp-pppoe" DESTDIR="$pkgdir" install
}
md5sums=('216eb52b69062b92a64ee37fd71f4b66'
         'SKIP'
         '8df35e67558b6b4567d1ab24c9202898')
