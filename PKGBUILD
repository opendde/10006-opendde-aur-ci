# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=plustache
pkgver=0.4.0
pkgrel=1
pkgdesc="Basic port of mustache templating to C++"
url="https://github.com/mrtazz/plustache"
arch=( 'i686' 'x86_64' )
license=( 'MIT' )
depends=( 'boost' )
source=( "$pkgname-$pkgver.tar.gz::https://github.com/mrtazz/plustache/archive/$pkgver.tar.gz" )
md5sums=('e22a8d53650776ade11b7b0ed71258bc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e "s,boost_regex-mt,boost_regex,g" \
         -e "s,LDFLAGS=.*,\0 -version-info 3:0:3,g" \
         Makefile.am
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
