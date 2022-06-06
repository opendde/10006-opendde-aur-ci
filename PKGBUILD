# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=import
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=3
pkgdesc='An Import Mechanism for R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-knitr
  r-magrittr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2fcb564d342362999abc3b76dc9683272dda4b605e18ceacde7bdef49c95e4a5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
