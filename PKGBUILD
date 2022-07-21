# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=forcats
_pkgver=0.5.1
pkgname=r-${_pkgname,,}
pkgver=0.5.1
pkgrel=4
pkgdesc='Tools for Working with Categorical Variables (Factors)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-ellipsis
  r-magrittr
  r-rlang
  r-tibble
)
optdepends=(
  r-covr
  r-dplyr
  r-ggplot2
  r-knitr
  r-readr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c4fb96e874e2bedaa8a1aa32ea22abdee7906d93b5c5c7b42c0894c0c5b6a289')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
