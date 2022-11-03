# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tRNAscanImport
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Importing a tRNAscan-SE result file as GRanges object'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-structstrings
  r-trna
  r-xvector
)
optdepends=(
  r-biocstyle
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aff1206cf3338f347e52c70ede0cbb83ec655ae915590cc732fdc3754749cdc2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
