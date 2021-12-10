# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=scotch-git
pkgver=r542.2148346
pkgrel=1
pkgdesc="Software package and libraries for graph, mesh and hypergraph partitioning, static mapping, and sparse matrix block ordering. This is the all-inclusive version (MPI/serial/esmumps)."
url="https://gitlab.inria.fr/scotch/scotch"
license=("custom:CeCILL-C")
depends=('zlib' 'openmpi' 'bzip2')
provides=('scotch' 'ptscotch' 'ptscotch-openmpi' 'scotch_esmumps' 'scotch_ptesmumps')
conflicts=('scotch' 'ptscotch-openmpi' 'scotch_esmumps' 'scotch_esmumps5')
arch=('i686' 'x86_64')
source=("git+https://gitlab.inria.fr/scotch/scotch")
sha256sums=('SKIP')
_pkgname=scotch

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}/src"

  [ -e Makefile.inc ] && rm Makefile.inc
  cp "Make.inc/Makefile.inc.${CARCH/_/-}_pc_linux2.shlib" Makefile.inc

  # Apply patch to fix shared library ldflags
  sed -i 's/$(AR) $(ARFLAGS) $(@) $(?)/$(AR) $(ARFLAGS) $(@) $(?) $(LDFLAGS)/g' libscotch/Makefile

  # Use the CFLAGS defined /etc/makepkg.conf
  sed -i "s/-O3/${CFLAGS} -fPIC/g" Makefile.inc

  # Fix C compiler
  sed -i "s/CCD\t.*=.*gcc/CCD = mpicc/" Makefile.inc

  # Also enable bzip2 compression
  sed -i "s/-DCOMMON_FILE_COMPRESS_GZ/-DCOMMON_FILE_COMPRESS_GZ -DCOMMON_FILE_COMPRESS_BZ2/" Makefile.inc
  sed -i "s/-lz/-lz -lbz2/" Makefile.inc

  # Fix the creation of directories
  sed -i "s/mkdir/mkdir\ -p/" Makefile.inc

  # To install headers and libs also for esmumps
  sed -i 's/scotch\*/{scotch,esmumps}\*/g' Makefile
}

build() {
  cd "${srcdir}/${_pkgname}/src"

  make scotch
  make -j1 esmumps

  # MPI implementation is not thread-safe: compile the parallel versions without SCOTCH_PTHREAD
  sed -i "s/-DSCOTCH_PTHREAD//" Makefile.inc

  make ptscotch
  make -j1 ptesmumps
}

package() {
  cd "${srcdir}/${_pkgname}/src"

  make install prefix="${pkgdir}/usr" includedir="${pkgdir}/usr/include/scotch"

  # To avoid conflict with extra/gpart, maybe move the package to /opt/scotch ?
  mv "${pkgdir}/usr/bin/gpart" "${pkgdir}/usr/bin/gpart-scotch"

  install -m 644 -D "../doc/CeCILL-C_V1-en.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
