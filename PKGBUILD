# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Samo Turk <samo.turk@gmail.com>
pkgname=rdkit-python2
_pkgname=RDKit
pkgver=2018_03_2
pkgrel=3
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python2' 'python2-numpy' 'sqlite3' 'python2-cairocffi' 'python2-pillow' 'inchi' 'eigen3')
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz")
sha256sums=('29eeba93e723f0f9d61e31cf0f89ec18ba942a7f9e416dbc1a92122fce08cbed')
provides=('rdkit')
conflicts=('rdkit' 'rdkit-git')

build() {
  cd ${srcdir}/rdkit-Release_${pkgver} 
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DRDK_BUILD_INCHI_SUPPORT=ON
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
