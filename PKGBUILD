# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cummeRbund
_pkgver=2.38.0
pkgname=r-${_pkgname,,}
pkgver=2.38.0
pkgrel=1
pkgdesc='Analysis, exploration, manipulation, and visualization of Cufflinks high-throughput sequencing data.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-fastcluster
  r-ggplot2
  r-gviz
  r-plyr
  r-reshape2
  r-rsqlite
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-cluster
  r-genomicfeatures
  r-genomicranges
  r-nmfn
  r-plyr
  r-rjson
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('185478a9e3ed1b8c8bc9e475a8cf42720ef1ca79078c1cc19dfe9b4162b58adc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
