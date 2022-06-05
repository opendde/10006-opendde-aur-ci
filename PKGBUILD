# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPexoQual
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='ChIPexoQual'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biovizbase
  r-broom
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-hexbin
  r-iranges
  r-rcolorbrewer
  r-rmarkdown
  r-rsamtools
  r-s4vectors
  r-scales
  r-viridis
)
optdepends=(
  r-biocstyle
  r-chipexoqualexample
  r-gridextra
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5f5d193b4800ea422b882444382103ded521a2eceedb2bc7784172beb9429ae4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
