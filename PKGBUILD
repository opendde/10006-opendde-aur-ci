# $Id$
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Ruben Van Boxem <vanboxem.ruben@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=('gcc5')
pkgver=5.5.0
_pkgver=5
_islver=0.18
pkgrel=1
pkgdesc="The GNU Compiler Collection (5.x.x)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=('glibc>=2.23' 'binutils>=2.26' 'libmpc')
makedepends=('git')
options=('!emptydirs')
_commit=ba9cddfdab8b539b788cd6fe0171351ae43c32da
source=(git+https://gcc.gnu.org/git/gcc.git#commit=${_commit}
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2)
sha512sums=('SKIP'
            '85d0b40f4dbf14cb99d17aa07048cdcab2dc3eb527d2fbb1e84c41b2de5f351025370e57448b63b2b8a8cf8a0843a089c3263f9baee1542d5c2e1cb37ed39d94')

prepare() {
  cd gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir ${srcdir}/gcc-build
}

build() {
  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  # This option exist in default makepkg.conf while it's not supported by gcc5
  CFLAGS=${CFLAGS/-fno-plt/}
  CXXFLAGS=${CXXFLAGS/-fno-plt/}

  ${srcdir}/gcc/configure --prefix=/usr \
      --build=${CHOST} \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,fortran,go,lto,objc,obj-c++ \
      --enable-shared --enable-threads=posix --enable-libmpx \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-lto --enable-plugin \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release \
      --program-suffix=-${_pkgver} \
      --enable-version-specific-runtime-libs
      #--enable-install-libiberty

  make
}

package() {
  cd gcc-build

  make -j1 DESTDIR=${pkgdir} install

  # Lazy way of dealing with conflicting files...
  rm -rf ${pkgdir}/usr/share/{info,locale,man}

  # Move potentially conflicting stuff to version specific subdirectory
  [[ -d ${pkgdir}/usr/lib ]] && mv ${pkgdir}/usr/lib/lib* ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/
  [[ -d ${pkgdir}/usr/lib/gcc/${CHOST}/lib/ ]] && mv ${pkgdir}/usr/lib/gcc/${CHOST}/lib/lib* ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/

  # Install Runtime Library Exception
  install -Dm644 ${srcdir}/gcc/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}
