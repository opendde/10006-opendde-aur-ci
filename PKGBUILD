# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=swamp
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=1.5.1
pkgrel=4
pkgdesc='Visualization, Analysis and Adjustment of High-Dimensional Data in Respect to Sample Annotations'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-amap
  r-gplots
  r-impute
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('83a06404a81873ada68a929fbfa9789ab105e18ce6b950c03ee0a6c0326646d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
