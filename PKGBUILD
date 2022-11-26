# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BEclear
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=3
pkgdesc='Correction of batch effects in DNA methylation data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gcc
  r
  r-abind
  r-biocparallel
  r-data.table
  r-dixontest
  r-futile.logger
  r-ids
  r-rcpp
  r-rdpack
)
optdepends=(
  r-biocstyle
  r-knitr
  r-pander
  r-rmarkdown
  r-seewave
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('01e43b82edfdfc99313a9e39851f1792ec51336d42c27a468a9daae88454f617')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
