# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AgiMicroRna
_pkgver=2.48.0
pkgname=r-${_pkgname,,}
pkgver=2.48.0
pkgrel=1
pkgdesc='Processing and Differential Expression Analysis of Agilent microRNA chips'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-affycoretools
  r-biobase
  r-limma
  r-preprocesscore
)
optdepends=(
  r-codelink
  r-gdata
  r-geneplotter
  r-gplots
  r-gtools
  r-marray
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c7d5319808ec9267e052fecc1336777d3fa8731efe882554801036d2bcf57060')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
