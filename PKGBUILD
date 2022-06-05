# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CATALYST
_pkgver=1.20.1
pkgname=r-${_pkgname,,}
pkgver=1.20.1
pkgrel=3
pkgdesc='Cytometry dATa anALYSis Tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-circlize
  r-complexheatmap
  r-consensusclusterplus
  r-cowplot
  r-data.table
  r-dplyr
  r-drc
  r-flowcore
  r-flowsom
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-gridextra
  r-magrittr
  r-matrixstats
  r-nnls
  r-purrr
  r-rcolorbrewer
  r-reshape2
  r-rtsne
  r-s4vectors
  r-scales
  r-scater
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-diffcyt
  r-flowworkspace
  r-ggcyto
  r-knitr
  r-opencyto
  r-rmarkdown
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eaafee8367812665d0dfb7560f7567d57fa39fff2be973fa35a16a9c14c76e17')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
