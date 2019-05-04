# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=lxqt-qtplugin
pkgname=$_pkgname-git
pkgver=0.14.0.5.g9068b5b
pkgrel=1
pkgdesc="LXQt platform integration for Qt"
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("GPL2")
depends=("libdbusmenu-qt5" "libqtxdg-git" "libfm-qt-git")
makedepends=("git" "cmake" "qt5-tools" "lxqt-build-tools-git")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/./g"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
