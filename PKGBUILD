# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=surfaltr
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=1.2.2
pkgrel=1
pkgdesc='Rapid Comparison of Surface Protein Isoform Membrane Topologies Through surfaltr'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biomart
  r-biostrings
  r-dplyr
  r-ggplot2
  r-httr
  r-msa
  r-protr
  r-readr
  r-seqinr
  r-stringr
  r-testthat
  r-xml2
)
optdepends=(
  r-devtools
  r-kableextra
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1becbe5bf59512c1cdc74fad18573aab90b567250690f4be860adbe9b7b3a8b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
