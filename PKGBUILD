# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rTRM
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Identification of Transcriptional Regulatory Modules from Protein-Protein Interaction Networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-dbi
  r-igraph
  r-rsqlite
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-biomart
  r-biostrings
  r-bsgenome.mmusculus.ucsc.mm8.masked
  r-ggplot2
  r-graph
  r-knitr
  r-motifdb
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pwmenrich
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9b6cb32c82eb14bfcd5a3b6b88f16524759760aac5537a94aa709011fe3eb785')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
