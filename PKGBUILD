# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phylobase
_pkgver=0.8.10
pkgname=r-${_pkgname,,}
pkgver=0.8.10
pkgrel=4
pkgdesc='Base Package for Phylogenetic Structures and Comparative Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ade4
  r-ape
  r-rcpp
  r-rncl
  r-rnexml
)
optdepends=(
  r-knitr
  r-mass
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5a44380ff49bab333a56f6f96157324ade8afb4af0730e013194c4badb0bf94b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
