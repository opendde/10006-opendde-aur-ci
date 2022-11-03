# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affydata
_pkgver=1.45.0
pkgname=r-${_pkgname,,}
pkgver=1.45.0
pkgrel=1
pkgdesc='Affymetrix Data for Demonstration Purpose'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
)
optdepends=(
  r-hgu133acdf
  r-hgu95av2cdf
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8eb673765a233416394f6f9fe685ef7f209475d3f8008360bfacd45c3c2bef4f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
