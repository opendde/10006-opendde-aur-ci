# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=opencamlib-git
pkgver=2019.07.4.g983a416
pkgrel=1
pkgdesc="Multi-Purpose CNC Toolpath Library"
arch=('i686' 'x86_64')
url="https://github.com/aewallin/opencamlib"
license=('LGPL')
makedepends=('boost' 'cmake' 'doxygen')
depends=('python' 'boost')
provides=('opencamlib')
conflicts=('opencamlib')
source=("git+https://github.com/aewallin/opencamlib.git")
md5sums=('SKIP')

pkgver() {
  cd opencamlib
  git describe --tags | sed 's/-/./g'
}

build() {
  mkdir "$srcdir/opencamlib/build"
  cd "$srcdir/opencamlib/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_PY_3="ON" -DBUILD_PY_LIB="ON" ../src
  make
}

package() {
  cd "$srcdir/opencamlib/build"
  make install DESTDIR=$pkgdir
}
