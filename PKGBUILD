# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=topGO
_pkgver=2.50.0
pkgname=r-${_pkgname,,}
pkgver=2.50.0
pkgrel=1
pkgdesc='Enrichment Analysis for Gene Ontology'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-dbi
  r-go.db
  r-graph
  r-matrixstats
  r-sparsem
)
optdepends=(
  r-all
  r-genefilter
  r-globaltest
  r-hgu133a.db
  r-hgu95av2.db
  r-multtest
  r-rgraphviz
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a40e3430de9aa00fad265a4f5254015b1ec9573b005d5297497029568f6d37e6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
