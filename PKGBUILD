# system requirements: BLAT, UCSC hg18 in 2bit format for BLAT
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hiReadsProcessor
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Functions to process LM-PCR reads from 454/Illumina data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-dplyr
  r-genomicalignments
  r-genomicranges
  r-hiannotator
  r-readxl
  r-soniclength
)
optdepends=(
  r-knitr
  r-markdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('915d4c927e292ed222abda75585f10ca435a2ba789732b755dab0b5674ccc031')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
