# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-sudo
pkgname=$_pkgname-git
pkgver=0.9.0.6.ga2f898a
pkgrel=1
pkgdesc="Qt front-end for sudo. Part of but not restricted to LXQt."
arch=("i686" "x86_64")
url="https://github.com/lxde/lxqt-sudo"
license=("LGPL2.1")
depends=("qt5-base" "sudo" "liblxqt-git")
optdepends=("oxygen-icons: fallback icon theme on systems without LXQt")
makedepends=("git" "cmake" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/$_pkgname.git")
sha256sums=("SKIP")

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
