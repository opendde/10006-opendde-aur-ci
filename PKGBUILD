# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=repmis
_pkgver=0.5
pkgname=r-${_pkgname,,}
pkgver=0.5
pkgrel=4
pkgdesc='Miscellaneous Tools for Reproducible Research'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-digest
  r-httr
  r-plyr
  r-r.cache
)
optdepends=(
  r-xlsx
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('65a5d32349baceb68e8761f3d585cb8450c5f22b2373a5005dd21341f592b57c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
