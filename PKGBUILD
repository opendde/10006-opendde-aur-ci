# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CAGEfightR
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Analysis of Cap Analysis of Gene Expression (CAGE) data using Bioconductor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-biocgenerics
  r-biocparallel
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicfiles
  r-genomicinteractions
  r-genomicranges
  r-gviz
  r-interactionset
  r-iranges
  r-pryr
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.mm.eg.db
  r-rmarkdown
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de12594c7eb55ccc1c83cb964bdb607a8e9ed7ceec26414bdbe33dd68e5b88c7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
