# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=safe
_pkgver=3.38.0
pkgname=r-${_pkgname,,}
pkgver=3.38.0
pkgrel=3
pkgdesc='Significance Analysis of Function and Expression'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-sparsem
)
optdepends=(
  r-breastcancerupp
  r-dorng
  r-foreach
  r-go.db
  r-gostats
  r-hgu133a.db
  r-pfam.db
  r-reactome.db
  r-rgraphviz
  r-survival
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3cafee1176cdcb55f3f0b1dba94266e34a9712e58b5b6b8b335178f0230deabf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
