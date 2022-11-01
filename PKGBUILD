# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DelayedMatrixStats
_pkgver=1.18.2
pkgname=r-${_pkgname,,}
pkgver=1.18.2
pkgrel=1
pkgdesc="Functions that Apply to Rows and Columns of 'DelayedMatrix' Objects"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-delayedarray
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-s4vectors
  r-sparsematrixstats
)
optdepends=(
  r-biocstyle
  r-covr
  r-hdf5array
  r-knitr
  r-microbenchmark
  r-profmem
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fd4042fc5aca8d9df38c3973218b455c5643848ec4f913959b3fd2d28029877d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
