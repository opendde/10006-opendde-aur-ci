# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aricode
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=1.0.0
pkgrel=4
pkgdesc='Efficient Computations of Standard Clustering Comparison Measures'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9463d63c25466ce8827329a32cfd01c399d4caca2f4ba6bb8a5213bfa0f5db44')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
