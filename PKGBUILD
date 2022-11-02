# system requirements: C++11, Rtools (>= 3.1)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QUBIC
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='An R package for qualitative biclustering in support of gene co-expression analyses'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-biclust
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-fields
  r-knitr
  r-qgraph
  r-qubicdata
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('af95c7f7c2394caaba1796f8b19be3701c04c1719c46200be92e06fa8e470933')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
