# Contributor: Guillaume DOLLÉ <dolle.guillaume at gmail.com>
# Contributor: George Eleftheriou <eleftg>

pkgname=feelpp
pkgver=0.107.0
pkgrel=1
pkgdesc="Finite Element Embedded Language and Library in C++"
arch=('i686' 'x86_64')
url="https://github.com/feelpp"
license=('LGPL')
depends=('cln' 'mumps' 'slepc' 'gmsh' 'fftw' 'ann' 'glpk' 'gsl' 'python')
makedepends=('cmake' 'clang')
source=("${pkgname}-${pkgver}::git+https://github.com/feelpp/feelpp.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  git submodule init
  git submodule update -f --init

  # https://github.com/feelpp/feelpp/pull/1415
  git cherry-pick cad7be165e2c4e377a4acfcf89abfb5365b43601 8b29331f5b2a4c6f47631b788829d5529eaf2d17

  # https://gitlab.com/libeigen/eigen/-/issues/1676
  cd feelpp/contrib/eigen/
  curl -L https://gitlab.com/libeigen/eigen/-/commit/2aa9eb3ce8fa6b2d61dce5be9d6d6460a28080c4.patch |patch -p1
}

build() {
  cd ${pkgname}-${pkgver}
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPETSC_DIR=/opt/petsc/linux-c-opt/ \
    -DSLEPC_DIR=/opt/slepc/linux-c-opt/ \
    -DFEELPP_MINIMAL_CONFIGURATION=ON \
    -DFEELPP_MINIMAL_BUILD=ON \
    -DFEELPP_ENABLE_QUICKSTART=OFF \
    -DFEELPP_ENABLE_PYFEELPP_LIBFEELPP=OFF \
    -DFEELPP_ENABLE_DOCUMENTATION=OFF \
    -DFEELPP_ENABLE_GMSH=ON \
    -DFEELPP_ENABLE_PETSC=OFF \
    -DFEELPP_ENABLE_SLEPC=OFF \
    -DFEELPP_ENABLE_ANN=ON \
    -DFEELPP_ENABLE_FFTW=ON \
    -DFEELPP_ENABLE_GSL=ON \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    ..
  make
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/bin/{ginsh,gflags_completions.sh}
  rm "$pkgdir"/usr/lib/*.a
  rm -r "$pkgdir"/usr/doc
  rm -r "$pkgdir"/home
}

