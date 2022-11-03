# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pRolocGUI
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=1
pkgdesc='Interactive visualisation of spatial proteomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-colorspace
  r-colourpicker
  r-dplyr
  r-dt
  r-ggplot2
  r-msnbase
  r-proloc
  r-scales
  r-shiny
  r-shinydashboard
  r-shinydashboardplus
  r-shinyhelper
  r-shinyjs
  r-shinywidgets
)
optdepends=(
  r-biocstyle
  r-knitr
  r-prolocdata
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('225788ccc3c03027138f08ac20809997b29281cbb32af4a208158f556af4d768')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
