# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# zipios++ has been rebranded to zipios
pkgname=zipios-git
pkgver=2.1.7.git20181201
_pkgver=2.1.7
pkgrel=1
pkgdesc="Small C++ library for reading and writing zip files, similar to java.util.zip and the standard iostreams library"
arch=('i686' 'x86_64')
url="http://zipios.sourceforge.net"
license=('LGPL')
conflicts=('zipios++')
depends=('zlib')
makedepends=('cmake' 'doxygen' 'graphviz')
checkdepends=('catch2' 'zip')
source=("git+https://github.com/Zipios/Zipios.git")
md5sums=('SKIP')

pkgver() {
  _last_commit_date=$( git log -1 --date=short --pretty=format:%cd | sed s/-//g )
  echo $_pkgver.git$_last_commit_date
}

build() {
  rm -rf build && mkdir build && cd build
  cmake ../Zipios \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib \
    -Wno-dev
    #-DBUILD_DOCUMENTATION=OFF
    #-DBUILD_ZIPIOS_TESTS=OFF
  make
}

check() {
  cd build
  make run_zipios_tests
  # they take some time
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
