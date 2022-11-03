# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=crlmm
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='Genotype Calling (CRLMM) and Copy Number Analysis tool for Affymetrix SNP 5.0 and 6.0 and Illumina arrays'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-affyio
  r-beanplot
  r-biobase
  r-biocgenerics
  r-ellipse
  r-ff
  r-foreach
  r-illuminaio
  r-limma
  r-matrixstats
  r-mvtnorm
  r-oligoclasses
  r-preprocesscore
  r-rcppeigen
  r-vgam
)
optdepends=(
  r-genomewidesnp6crlmm
  r-hapmapsnp6
  r-runit
  r-snpstats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('319c9c582305649778624e575c5c46ec9c9f5756f92bba0360e387437fe31b5a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
