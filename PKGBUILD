# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggdendro
_pkgver=0.1.23
pkgname=r-${_pkgname,,}
pkgver=0.1.23
pkgrel=3
pkgdesc="Create Dendrograms and Tree Diagrams Using 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
)
optdepends=(
  r-cluster
  r-knitr
  r-rmarkdown
  r-rpart
  r-scales
  r-spelling
  r-testthat
  r-tree
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3a33e988c4fe12eec540876ad8ba09bda998773b2d2a90e043ebae4a69fa8eb8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
