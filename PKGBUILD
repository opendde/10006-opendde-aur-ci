# Maintainer: Jed Brown <jed@59A2.org>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: George Eleftheriou <eleftg>

pkgname=mpich
pkgver=4.0.3
pkgrel=1
pkgdesc="An improved implementation of the Message Passing Interface."
url="https://mpich.org"
arch=(x86_64)
license=("custom")
replaces=(mpich2)
depends=('gcc-fortran' 'libxml2' 'openssh' 'numactl' 'pciutils' 'hwloc' 'bash')
makedepends=(texlive-core sowing autoconf python)
optdepends=(perl python)
install="${pkgname}.install"
source=("https://www.mpich.org/static/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"mpich.profile")
sha256sums=('17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4e8c5ebe4a3e3b6c501'
            'b9716439a544511bf88618edeb40c3eb80f1b5d0d9369c30d750251feed02284')
options=('!libtool')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  sed -i 's|PTR|void *|' modules/ucx/src/ucs/debug/debug.c

  # CFLAGS etc are normally written into the wrapper compilers.  This
  # gives surprising results, e.g. when the user wants to compile their
  # program without optimization.
  export MPICHLIB_CFLAGS="${CFLAGS}";      unset CFLAGS
  export MPICHLIB_CXXFLAGS="${CXXFLAGS}";  unset CXXFLAGS
  export MPICHLIB_CPPFLAGS="${CPPFLAGS}";  unset CPPFLAGS
  export MPICHLIB_FFLAGS="${FFLAGS}";      unset FFLAGS
  export MPICHLIB_FCFLAGS="${FCFLAGS}";    unset FCFLAGS
  export MPICHLIB_LDFLAGS="${LDFLAGS}";    unset LDFLAGS

  mkdir -p build
  cd build

  ../configure --prefix=/opt/mpich \
               --with-device=ch4:ucx \
               --with-hwloc \
               --without-java \
               --enable-error-checking=runtime \
               --enable-error-messages=all \
               --enable-g=meminit \
               CC=gcc CXX=g++ FC=gfortran \
               FFLAGS=-fallow-argument-mismatch \
               FCFLAGS=-fallow-argument-mismatch

  make
  make mandoc
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}/build

  # Disabled for mpich-3.4 due to json-c test failure
  # make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  ln -sf mpiexec.hydra "${pkgdir}/opt/mpich/bin/mpirun.hydra"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/mpich/license.txt"
  install -D -m755 "${srcdir}/${pkgname}.profile" "${pkgdir}/etc/profile.d/mpich.sh"

  mkdir -p "${pkgdir}/etc/ld.so.conf.d"
  echo /opt/mpich/lib > "${pkgdir}/etc/ld.so.conf.d/mpich.conf"
}
