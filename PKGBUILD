# system requirements: Graphviz version >= 2.2
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellNOptR
_pkgver=1.42.1
pkgname=r-${_pkgname,,}
pkgver=1.42.1
pkgrel=2
pkgdesc='Training of boolean logic models of signalling networks using prior knowledge networks and perturbation data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-graph
  r-igraph
  r-rbgl
  r-rcurl
  r-rgraphviz
  r-rmarkdown
  r-stringi
  r-stringr
  r-xml
  graphviz
)
optdepends=(
  r-biocgenerics
  r-data.table
  r-doparallel
  r-dplyr
  r-foreach
  r-plyr
  r-readr
  r-runit
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d9904326af2cce3c37e5414321fc9e0f1c331ebf25c906a6c4e943019eac4c41')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
