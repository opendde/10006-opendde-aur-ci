# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=byzanz
pkgname=$_pkgname-git
pkgver=0.2.1.126.g81235d2
pkgrel=1
pkgdesc="Record what's happening on your desktop"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/otte/2009/08/30/byzanz-0-2-0/"
license=('GPL')
depends=('gtk3' 'gst-plugins-base' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('gnome-common' 'intltool')
optdepends=('gnome-panel: panel applet')
provides=('byzanz')
conflicts=('byzanz')
install=$_pkgname.install
source=("$pkgname::git://git.gnome.org/byzanz")
pkgver() {
  cd $pkgname
  git describe | sed 's/^release-//; s/-/./g'
}
build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
               --disable-static \
               CFLAGS="$CFLAGS -Wno-error"
  make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')

