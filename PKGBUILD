# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnrichmentBrowser
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=2.26.0
pkgrel=1
pkgdesc='Seamless navigation through combined results of set-based and network-based enrichment analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocfilecache
  r-biocmanager
  r-edger
  r-go.db
  r-graph
  r-graphite
  r-gseabase
  r-hwriter
  r-kegggraph
  r-keggrest
  r-limma
  r-pathview
  r-rgraphviz
  r-s4vectors
  r-safe
  r-spia
  r-summarizedexperiment
)
optdepends=(
  r-airway
  r-all
  r-biocgraph
  r-biocstyle
  r-complexheatmap
  r-deseq2
  r-geneplotter
  r-hgu95av2.db
  r-knitr
  r-msigdbr
  r-reportingtools
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('83f2bf24c76f434fa99ae067583d378044b5b33fbf984cf3f43b544ca11418af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
