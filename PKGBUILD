# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc
pkgver=3.13.4.1515
pkgrel=1
pkgdesc="Qt based UI application for verifying and signing digital signatures"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libdigidocpp>=3.13.2.1355' 'qt5-base' 'shared-mime-info' 'ccid' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'opensc' 'qt5-tools' 'qt5-translations')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('7741e1fb176e13a012b281fab4d38dabbd3ccab762160a9e5bfd84915610ca97')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/"
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DBREAKPAD=""
  make
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}
