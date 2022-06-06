# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=truncnorm
_pkgver=1.0-8
pkgname=r-${_pkgname,,}
pkgver=1.0.8
pkgrel=4
pkgdesc='Truncated Normal Distribution'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('49564e8d87063cf9610201fbc833859ed01935cc0581b9e21c42a0d21a47c87e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
