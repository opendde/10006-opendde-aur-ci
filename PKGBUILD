# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffHic
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Differential Analyis of Hi-C Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-csaw
  r-edger
  r-genomeinfodb
  r-genomicranges
  r-interactionset
  r-iranges
  r-limma
  r-locfit
  r-rcpp
  r-rhdf5
  r-rhtslib
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-zlibbioc
  gcc
  make
)
optdepends=(
  r-bsgenome.ecoli.ncbi.20080805
  r-matrix
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5a964d0bbd8ff9019ae3d2ba4192e7ecf58346b5b2a064135cb3eb67433243be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
