# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSingular
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Singular Value Decomposition for Bioconductor Packages'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beachmat
  r-biocgenerics
  r-biocparallel
  r-delayedarray
  r-irlba
  r-rcpp
  r-rsvd
  r-s4vectors
  r-scaledmatrix
  gcc
)
optdepends=(
  r-biocstyle
  r-knitr
  r-residualmatrix
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7dd45d85c0c8248406caab4accb74b483d0066443e443b51bc5049602df32aeb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
