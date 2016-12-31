# Maintainer: Kasper Laudrup <laudrup@stacktrace.dk>
pkgname=properties-cpp-bzr
pkgver=0.1
pkgrel=1
pkgdesc="A very simple convenience library for handling properties and signals in C++11"
arch=('i686' 'x86_64')
url="https://launchpad.net/properties-cpp"
license=('LGPL3')
makedepends=('bzr')
provides=('properties-cpp')
source=('properties-cpp-bzr::bzr+https://code.launchpad.net/~phablet-team/properties-cpp/trunk')
md5sums=('SKIP')

_bzrtrunk=BZRURL
_bzrmod=MODNAME

prepare() {
  cd "$pkgname"
  # The tests requires a CMakeLists.txt to be present in the gmock
  # include dir which is not the case on Arch, so exclude it
  sed -i '/add_subdirectory(tests)/d' CMakeLists.txt
  mkdir -p build
  cd build
  cmake -Wno-dev -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

pkgver() {
  cd "$pkgname"
  printf "r%s" "$(bzr revno)"
}

package() {
  cd "$pkgname/build"
  echo "pkgdir is $pkgdir"
  make DESTDIR="$pkgdir/" install
}
