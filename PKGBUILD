# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aCGH
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=1.76.0
pkgrel=1
pkgdesc='Classes and functions for Array Comparative Genomic Hybridization data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('86dc0f4897d122cd84f5b9533b7173e06d11dc131377fcdb829b29e4d6000317')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
