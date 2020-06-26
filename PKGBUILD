# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad
pkgver=0.14.1
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('qt5-svg' 'qt5-x11extras' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("$url/releases/download/V$pkgver/FeatherPad-$pkgver.tar.xz"{,.asc})
sha256sums=('6723933eaa27e6329d14bdd025967b0421aa0f95707ad0a41da92f78cee6851a'
            'SKIP')
validpgpkeys=('19DFDF3A579BD509DBB572D8BE793007AD22DF7E')

build() {
  rm -Rf build && mkdir build
  cd build
  qmake $srcdir/FeatherPad-$pkgver/
  make
}

package() {
  cd build
  make INSTALL_ROOT=$pkgdir install
}
