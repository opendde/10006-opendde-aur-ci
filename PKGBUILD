# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=Rpdb
_pkgver=2.3
pkgname=r-${_pkgname,,}
pkgver=2.3
pkgrel=2
pkgdesc='Read, Write, Visualize and Manipulate PDB Files'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('28beafa9cc6626bb1eef102dac45266533f96b2108391e5f62f79a48d771c57f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
