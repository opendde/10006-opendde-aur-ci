# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dce
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Pathway Enrichment Based on Differential Causal Effects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-combinepvalue
  r-dplyr
  r-edger
  r-epinem
  r-expm
  r-ggplot2
  r-ggraph
  r-glm2
  r-glue
  r-graph
  r-graphite
  r-harmonicmeanp
  r-igraph
  r-logger
  r-metap
  r-mnem
  r-naturalsort
  r-org.hs.eg.db
  r-pcalg
  r-ppcor
  r-purrr
  r-reshape2
  r-rgraphviz
  r-rlang
  r-tidygraph
  r-tidyverse
  r-shadowtext
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-curatedtcgadata
  r-dagitty
  r-devtools
  r-formatr
  r-knitr
  r-lmtest
  r-rmarkdown
  r-sandwich
  r-summarizedexperiment
  r-tcgautils
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e180b7c224c5081b44f56269abd3dfb078f59c93154ca4f0fd4e43a2c1e56de4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
