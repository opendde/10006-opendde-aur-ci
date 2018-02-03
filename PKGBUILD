# $Id$
# Maintainer: PhotonX <photon89@googlemail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libgnomeui
pkgver=2.24.5
pkgrel=3
pkgdesc="User Interface library for GNOME"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libbonoboui' 'libgnome-keyring' 'libsm')
makedepends=('intltool' 'pkg-config' 'python')
url="http://www.gnome.org"
source=(https://download.gnome.org/sources/$pkgname/2.24/$pkgname-$pkgver.tar.bz2 03_glib-2.54-ftbfs.patch)
sha256sums=('ae352f2495889e65524c979932c909f4629a58e64290fb0c95333373225d3c0f' 'a298358c38db97c569efedd7b446fdaaffa3f087cd1a049087043eeca53c7391')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch "libgnomeui/gnome-scores.h" < "$srcdir/03_glib-2.54-ftbfs.patch"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/libgnomeui
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
