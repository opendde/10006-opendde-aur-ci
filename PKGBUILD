# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lmdme
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Linear Model decomposition for Designed Multivariate Experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-pls
  r-stemhypoxia
)
optdepends=(
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('088dfeb59d17ce939d8bd3ab59d78779c6fecd54f65d4790ceded75e57b3de8e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
