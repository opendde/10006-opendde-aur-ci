# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RFOC
_pkgver=3.4-6
pkgname=r-${_pkgname,,}
pkgver=3.4.6
pkgrel=3
pkgdesc='Graphics for Spherical Distributions and Earthquake Focal Mechanisms'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-geomap
  r-rpmg
  r-rseis
  r-splancs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0dfa237f4d04eb9a2718942b4d7ed9538fc5f89e3cbaa5a34a4fd1bc6fe54533')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
