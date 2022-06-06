# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epivizr
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=2.26.0
pkgrel=1
pkgdesc='R Interface to epiviz web app'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bumphunter
  r-epivizrdata
  r-epivizrserver
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-s4vectors
)
optdepends=(
  r-antiprofilesdata
  r-biobase
  r-biocstyle
  r-hgu133plus2.db
  r-knitr
  r-minfi
  r-mus.musculus
  r-rmarkdown
  r-roxygen2
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1fde153a1643ad94586f37ac12c11fd6cfff9dd5ff07939d78df712c0ce8f0c3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
