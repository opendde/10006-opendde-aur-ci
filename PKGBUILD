# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=decoupleR
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
pkgrel=1
pkgdesc='decoupleR: Inferring biological activities from omics data using a collection of methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-dplyr
  r-magrittr
  r-purrr
  r-rlang
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-withr
)
optdepends=(
  r-aucell
  r-biocstyle
  r-covr
  r-fgsea
  r-ggplot2
  r-ggrepel
  r-glmnet
  r-gsva
  r-knitr
  r-omnipathr
  r-patchwork
  r-pheatmap
  r-pkgdown
  r-ranger
  r-refmanager
  r-rmarkdown
  r-roxygen2
  r-rpart
  r-sessioninfo
  r-seurat
  r-summarizedexperiment
  r-testthat
  r-viper
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b141afd331449b0b1c2dc3dc3097465c2c02b5026129d8f06dd5bfb445bce2a0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
