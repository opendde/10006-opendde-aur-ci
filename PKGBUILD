# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FSelector
_pkgver=0.33
pkgname=r-${_pkgname,,}
pkgver=0.33
pkgrel=3
pkgdesc='Selecting Attributes'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
  r-entropy
  r-randomforest
  r-rweka
)
optdepends=(
  r-mlbench
  r-rpart
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3d57ea602cfa571ef1c1496855610819ff80eb7118d49cf68debfe6b0251d9d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
