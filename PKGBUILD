# Maintainer: JSH <jsh6789 at gmail dot com>

pkgname=pocl-git
_pkgname=pocl
pkgver=0.13.r581.g9ec652ef
pkgrel=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets (git version)"
arch=('i686' 'x86_64')
url="http://portablecl.org/"
license=('GPL')
depends=('clang' 'opencl-icd-loader' 'hwloc' 'libltdl' 'opencl-headers')
makedepends=('git' 'cmake' 'llvm' 'ocl-icd')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/pocl/pocl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib -D_libdir_set=false \
    -DPOCL_INSTALL_ICD_VENDORDIR='/etc/OpenCL/vendors' \
    -DCMAKE_BUILD_TYPE=Release \
    -DEXTRA_KERNEL_CXX_FLAGS='-std=c++11' \
    "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir"/ install
}
