# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BaalChIP
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='BaalChIP: Bayesian analysis of allele-specific transcription factor binding in cancer genomes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-coda
  r-doby
  r-doparallel
  r-foreach
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-iranges
  r-reshape2
  r-rsamtools
  r-scales
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('16c48bf0b72ce70a55e6011e04095a288553f302859d1ce66c24ec59cd3e469b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
