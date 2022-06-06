# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=easyRNASeq
_pkgver=2.32.0
pkgname=r-${_pkgname,,}
pkgver=2.32.0
pkgrel=1
pkgdesc='Count summarization and normalization for RNA-Seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocfilecache
  r-biocgenerics
  r-biocparallel
  r-biomart
  r-biostrings
  r-edger
  r-genomeinfodb
  r-genomeintervals
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-locfit
  r-lsd
  r-rappdirs
  r-rsamtools
  r-s4vectors
  r-shortread
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-bsgenome.dmelanogaster.ucsc.dm3
  r-curl
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f9c6b27ccbae0bdb79785f899adc3181dfed416b8f155ce53c7c4b7c6cbec1b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
