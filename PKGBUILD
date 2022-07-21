# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splus2R
_pkgver=1.3-3
pkgname=r-${_pkgname,,}
pkgver=1.3.3
pkgrel=4
pkgdesc='Supplemental S-PLUS Functionality in R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7d5c90842debaf6046d445e3fce4f9721baad0339aa7193339705ef68568bf0c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
