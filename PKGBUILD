# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gage
_pkgver=2.48.0
pkgname=r-${_pkgname,,}
pkgver=2.48.0
pkgrel=1
pkgdesc='Generally Applicable Gene-set Enrichment for Pathway Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-go.db
  r-graph
  r-keggrest
)
optdepends=(
  r-deseq2
  r-edger
  r-gagedata
  r-genomicalignments
  r-gseabase
  r-hgu133a.db
  r-limma
  r-org.hs.eg.db
  r-pathview
  r-rsamtools
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d17b7cdb336b7fa55766a1f68587640e69f9c39f01e5317ee1c7d25c59781b23')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
