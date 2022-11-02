# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mistyR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Multiview Intercellular SpaTial modeling framework'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-caret
  r-deldir
  r-digest
  r-distances
  r-dplyr
  r-filelock
  r-furrr
  r-ggplot2
  r-purrr
  r-r.utils
  r-ranger
  r-readr
  r-rlang
  r-rlist
  r-stringr
  r-tibble
  r-tidyr
  r-withr
  r-ridge
)
optdepends=(
  r-biocstyle
  r-covr
  r-future
  r-igraph
  r-knitr
  r-matrix
  r-progeny
  r-rmarkdown
  r-sctransform
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('25d38f81f8ee32247cd900b041074d2255e034c75f1f620c52ca86a6b8eedfbb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
