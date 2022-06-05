# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cTRAP
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Identification of candidate causal perturbations from differential gene expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-binr
  r-cowplot
  r-data.table
  r-dplyr
  r-dt
  r-fastmatch
  r-fgsea
  r-ggplot2
  r-ggrepel
  r-highcharter
  r-htmltools
  r-httr
  r-limma
  r-pbapply
  r-purrr
  r-qs
  r-r.utils
  r-readxl
  r-reshape2
  r-rhdf5
  r-rlang
  r-scales
  r-shiny
  r-shinycssloaders
  r-tibble
)
optdepends=(
  r-biomart
  r-covr
  r-knitr
  r-remotes
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5ad5abc39a907eadb8458b371dc34a26b3042fa880c6b8d9e569c6eb026bb38e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
