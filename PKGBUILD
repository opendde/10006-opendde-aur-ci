# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cogena
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='co-expressed gene-set enrichment analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-amap
  r-apcluster
  r-biobase
  r-biwt
  r-corrplot
  r-devtools
  r-doparallel
  r-dplyr
  r-fastcluster
  r-foreach
  r-ggplot2
  r-gplots
  r-kohonen
  r-mclust
  r-reshape2
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0c8f8b767d31a44e3eeeaef356ec0edf48b3bfc9c5135f362051ae2ce399bd43')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
