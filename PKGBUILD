# Davide Depau <davide@depau.eu>

_pkgname=libuinputplus
pkgname=$_pkgname-git
pkgver=v0.1.3.r0.gd8f8650
pkgrel=1
pkgdesc="Easy-to-use uinput library in C++"
arch=('i686' 'x86_64')
makedepends=('cmake' 'git' 'make' 'pkg-config')
url="https://github.com/YukiWorkshop/libuInputPlus"
license=('MIT')
source=(${_pkgname}::git+https://github.com/YukiWorkshop/libuInputPlus.git)
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  mkdir -p build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install -C build/
}
