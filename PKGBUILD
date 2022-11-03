# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EpiTxDb
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Storing and accessing epitranscriptomic information using the AnnotationDbi interface'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocfilecache
  r-biocgenerics
  r-biostrings
  r-curl
  r-dbi
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-httr
  r-iranges
  r-modstrings
  r-rsqlite
  r-s4vectors
  r-trnadbimport
  r-xml2
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-ensembldb
  r-epitxdb.hs.hg38
  r-ggplot2
  r-httptest
  r-knitr
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a55f7333ae84cad2d57488b270b66f38b70ac57000bd619356ad475b8eb55a94')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
