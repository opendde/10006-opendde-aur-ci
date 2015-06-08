# Maintainer: Daniel Nagy <danielnagy at gmx de>

_realname=CuteMarkEd
pkgname=cutemarked
pkgver=0.11.0
pkgrel=1
pkgdesc="Qt Markdown Editor"
url="https://github.com/cloose/CuteMarkEd"
arch=('i686' 'x86_64')
license=( "GPL2" )
depends=( "qt5-webkit" "hunspell" "discount>=2.1.7" )
makedepends=( 'qt5-tools' )
source=( "https://github.com/cloose/CuteMarkEd/archive/v$pkgver.tar.gz" )
sha256sums=('c6396d3807417ffe63fcbe3e84a8c1dc7d38bd7f5dada0c75de4f374318831a5')

prepare() {
  cd $srcdir/$_realname-$pkgver
  sed -i -e "s,#include <discount/mkdio.h>,#include <mkdio.h>,g" app-static/converter/discountmarkdownconverter.cpp
}

build() {
  cd $srcdir/$_realname-$pkgver
  qmake
  make || true #  the first make run might fail
  make
}
package() {
  cd $srcdir/$_realname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  mkdir -p "$pkgdir"/usr/bin
  #ln -s ../lib/qt/bin/cutemarked "$pkgdir"/usr/bin/cutemarked
}
