# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=moanin
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='An R Package for Time Course RNASeq Data Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-clusterr
  r-edger
  r-limma
  r-matrixstats
  r-nmi
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
  r-topgo
  r-viridis
  r-zoo
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
  r-timecoursedata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('235090b02ddd30d0daf183e82f2bae257bd1ec4d1b725d6d62b7131e43f54932')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
