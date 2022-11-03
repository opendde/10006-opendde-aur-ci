# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVPanelizer
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Reliable CNV detection in targeted sequencing applications'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-exomecopy
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gplots
  r-iranges
  r-noiseq
  r-openxlsx
  r-plyr
  r-reshape2
  r-rsamtools
  r-s4vectors
  r-shiny
  r-shinyfiles
  r-shinyjs
  r-stringr
  r-testthat
)
optdepends=(
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1f7c4d2c67fd117344fdb7e8aba1e60313f21b520dfff4b43d081fa9fe5a660a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
