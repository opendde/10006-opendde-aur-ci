# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixQCvis
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=1.6.1
pkgrel=1
pkgdesc='Shiny-based interactive data-quality exploration for omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-complexheatmap
  r-dplyr
  r-ggplot2
  r-hmisc
  r-htmlwidgets
  r-impute
  r-imputelcmd
  r-limma
  r-openxlsx
  r-pcamethods
  r-plotly
  r-proda
  r-rlang
  r-rmarkdown
  r-rtsne
  r-s4vectors
  r-shiny
  r-shinydashboard
  r-shinyhelper
  r-shinyjs
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-umap
  r-upsetr
  r-vegan
  r-vsn
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-hexbin
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f3a8a492664c3bbc0b60da0ea28fdb8bce65420ab0e18ccbc8f2f1f1bcb31cd0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
