# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bladderbatch
_pkgver=1.35.0
pkgname=r-${_pkgname,,}
pkgver=1.35.0
pkgrel=1
pkgdesc='Bladder gene expression data illustrating batch effects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c04fa2199802c82d6132ebae0aeea7c8d4e7e4ff6bffc4f575ae73404067046')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
