# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEP
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Differential Enrichment analysis of Proteomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-assertthat
  r-circlize
  r-complexheatmap
  r-dplyr
  r-dt
  r-fdrtool
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-imputelcmd
  r-limma
  r-msnbase
  r-purrr
  r-rcolorbrewer
  r-readr
  r-rmarkdown
  r-shiny
  r-shinydashboard
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-vsn
)
optdepends=(
  r-biocstyle
  r-enrichr
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('469e9c07fafe0244dd54c446feb44c074611f14c14c867ba12835d2d8dce2b05')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
