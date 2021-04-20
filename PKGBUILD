# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=goocanvas2
_pkgname=goocanvas
pkgver=2.0.4
pkgrel=8
pkgdesc="A cairo canvas widget for GTK+, legacy version"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/GooCanvas"
license=('LGPL')
provides=($_pkgname=$pkgver)
depends=('gtk3')
makedepends=('gobject-introspection' 'python-gobject')
source=(https://download.gnome.org/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz)
sha256sums=('c728e2b7d4425ae81b54e1e07a3d3c8a4bd6377a63cffa43006045bceaa92e90')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
