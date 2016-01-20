# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: stefan husmann <stefan-husmann@t-online.de>

pkgname=picpuz
pkgver=2.7
pkgrel=2
pkgdesc="'jigsaw puzzle' program."
arch=('i686' 'x86_64')
url="http://www.kornelix.com/picpuz/"
license=('GPL3')
depends=('gtk3')
makedepends=('pkgconfig')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('cb15ba77814674a9c04e8fa6cd51e085')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make PREFIX=/usr LDFLAGS="-lpthread"
}
package() { 
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/share/doc/$pkgname/$pkgname.man
}
