# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=statnet.common
_pkgver=4.7.0
pkgname=r-${_pkgname,,}
pkgver=4.7.0
pkgrel=1
pkgdesc='Common R Scripts and Utilities Used by the Statnet Project Software'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-coda
)
optdepends=(
  r-covr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b69731a606b56b729b1917375efafb572b960ce5000a0fc2ec5222fd7d80a1b3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
