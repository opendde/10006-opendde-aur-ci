# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recountmethylation
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Access and analyze DNA methylation database compilations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-hdf5array
  r-minfi
  r-r.utils
  r-rcurl
  r-rhdf5
  r-s4vectors
  r-illuminahumanmethylation450kmanifest
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-experimenthub
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-knitr
  r-limma
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f373878a8f3ac6846f8bf6504343d14ae725d41760b1cf0e383598a637bcea0f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
