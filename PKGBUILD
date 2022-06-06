# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=settings
_pkgver=0.2.7
pkgname=r-${_pkgname,,}
pkgver=0.2.7
pkgrel=4
pkgdesc='Software Option Settings Manager for R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('651a02d59fe64fded64a9b7bc252f7ab9e3124445a6d44727f698b8b669131c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
