# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=hdf5-java
pkgver=1.12.0
_pkgver=${pkgver%.*}
pkgrel=2
pkgdesc="General purpose library and file format for storing scientific data , w/java bindings"
arch=(x86_64)
url="https://www.hdfgroup.org/hdf5"
license=(custom)
depends=(zlib libaec bash)
makedepends=(cmake time gcc-fortran jre-openjdk)
replaces=(hdf5-cpp-fortran)
provides=(hdf5-cpp-fortran hdf5)
conflicts=(hdf5)
options=('staticlibs')
source=("${pkgname}-${pkgver}.tar.gz::https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${_pkgver}/hdf5-${pkgver}/src/CMake-hdf5-${pkgver}.tar.gz"
        hdf5-1.12.0-compat-1.6.patch)
sha256sums=('01b9c01c45cc8c66da86e69c510e17f3cff0706a65d8683cd86af405eaf75397'
            '72ad497c56760bb3af8193c88d3fa264125829850b843697de55d934c56f7f44')

prepare(){
  cd CMake-hdf5-${pkgver}

  # enable java
  sed -i 's,^set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_JAVA:BOOL=OFF"),#set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_JAVA:BOOL=OFF"),g' -i HDF5options.cmake
  sed -i 's,^#set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_JAVA:BOOL=ON"),set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_JAVA:BOOL=ON"),g' -i HDF5options.cmake

  # enable fortran
  sed -i 's,^set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_FORTRAN:BOOL=OFF"),#set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_FORTRAN:BOOL=OFF"),g' -i HDF5options.cmake
  sed -i 's,^#set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_FORTRAN:BOOL=ON"),set (ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_FORTRAN:BOOL=ON"),g' -i HDF5options.cmake

  #sed '/HDF5_BUILD_JAVA/c\set(ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DHDF5_BUILD_JAVA:BOOL=ON")' -i HDF5options.cmake
  #echo 'set(ADD_BUILD_OPTIONS "${ADD_BUILD_OPTIONS} -DCMAKE_INSTALL_PREFIX=/usr")' >> HDF5options.cmake
}

build(){
  cd CMake-hdf5-${pkgver}
  ctest -S HDF5config.cmake,BUILD_GENERATOR=Unix,INSTALLDIR=/usr -C Release -V -O hdf5.log
  #./build-unix.sh
  cd build
  make
}

package() {
  cd CMake-hdf5-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../hdf5-${pkgver}/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm644 ../hdf5-${pkgver}/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

