# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstats
_pkgver=4.6.0
pkgname=r-${_pkgname,,}
pkgver=4.6.0
pkgrel=3
pkgdesc='Protein Significance Analysis in DDA, SRM and DIA for Label-free or Label-based Proteomics Experiments'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-checkmate
  r-data.table
  r-ggplot2
  r-ggrepel
  r-gplots
  r-limma
  r-lme4
  r-marray
  r-msstatsconvert
  r-preprocesscore
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-markdown
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('29da015d2331786707d273d8a907c0d7571cf5bb5d393e5b4786f15779c6fffd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
