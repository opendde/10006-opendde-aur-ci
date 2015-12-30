# $Id$
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jkkyll Wu <adaptee at gmail [dot] com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

name=qbittorrent
pkgname=${name}-qt4
pkgver=3.3.1
pkgrel=1
pkgdesc="A bittorrent client written in C++ / Qt4 using the good libtorrent library"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt4' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('boost' 'qt4')
optdepends=('python: needed for torrent search tab')
conflicts=(${name})
install=$pkgname.install
source=("http://downloads.sourceforge.net/sourceforge/qbittorrent/$name-$pkgver.tar.xz")
sha256sums=('dad15a233a69ce13ea75957585af3f9122dbf915291aab0fdbc48a71b8a229d2')

build() {
  cd $name-$pkgver

  ./configure --prefix=/usr --with-qt4
  make
}

package() {
  cd $name-$pkgver

  make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$name/COPYING
}
