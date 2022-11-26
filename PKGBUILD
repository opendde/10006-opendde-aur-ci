# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scatterpie
_pkgver=0.1.8
pkgname=r-${_pkgname,,}
pkgver=0.1.8
pkgrel=3
pkgdesc='Scatter Pie Plot'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggforce
  r-ggfun
  r-ggplot2
  r-rlang
  r-tidyr
)
optdepends=(
  r-knitr
  r-maps
  r-prettydoc
  r-rmarkdown
  r-scales
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a6ccc63a8be63fa113704cf5d4893c1ec1b75d3081ab971bd70e650e708872a0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
