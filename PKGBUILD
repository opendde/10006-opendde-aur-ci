# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=annaffy
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=1.70.0
pkgrel=1
pkgdesc='Annotation tools for Affymetrix biological metadata'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocmanager
  r-dbi
  r-go.db
)
optdepends=(
  r-hgu95av2.db
  r-multtest
  r-tcltk
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf2552152ce81eb209a454efe727bfc913c2f2ef1fddf6dfbe5ac6d32185b163')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
