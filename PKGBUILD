# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biodbKegg
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='biodbKegg, a library for connecting to the KEGG Database'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-biodb
  r-chk
  r-lifecycle
  r-r6
)
optdepends=(
  r-biocstyle
  r-devtools
  r-igraph
  r-knitr
  r-lgr
  r-magick
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('89dc8788aef2fe971a7dee1bd54194aec60f9765ba0732796257870f7d974780')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
