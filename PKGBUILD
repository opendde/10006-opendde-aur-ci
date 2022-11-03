# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqSQC
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='A bioconductor package for sample quality check with next generation sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-e1071
  r-experimenthub
  r-gdsfmt
  r-genomicranges
  r-ggally
  r-ggplot2
  r-iranges
  r-rbokeh
  r-rcolorbrewer
  r-reshape2
  r-rmarkdown
  r-s4vectors
  r-snprelate
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('80995bfc2f75a771c51063ff86e99459135dab7c2afb5820cf18c36b81d39f89')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
