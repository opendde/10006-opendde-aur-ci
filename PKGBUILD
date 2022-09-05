# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=lpSolve
_cranver=5.6.16
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Interface to 'Lp_solve' v. 5.5 to Solve Linear/Integer Programs"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL2.1)
depends=(lpsolve r)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('18a11e5184914e02b056d3d8f54ad92e4bbce651d930d61430570b4ae2ecbb2a')

prepare() {
  cd "${_cranname}/src"
  # devendor lpsolve

  # remove all source and header files except init.c and lpslink56.c
  # as everything else is provided by lpsolve library
  mv init.c init.c.keep
  mv lpslink56.c lpslink56.c.keep
  rm *.c *.h
  mv init.c.keep init.c
  mv lpslink56.c.keep lpslink56.c

  # build against system lpsolve
  sed -i -e 's|-I .|-I/usr/include/lpsolve|' \
      -e '1i PKG_LIBS=-llpsolve55' \
      Makevars
}

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
