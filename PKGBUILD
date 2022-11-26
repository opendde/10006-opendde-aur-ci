# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineR
_pkgver=3.50.0
pkgname=r-${_pkgname,,}
pkgver=3.50.0
pkgrel=3
pkgdesc='Cheminformatics Toolkit for R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-base64enc
  r-bh
  r-biocgenerics
  r-dbi
  r-digest
  r-dt
  r-ggplot2
  r-gridextra
  r-jsonlite
  r-png
  r-rcpp
  r-rcurl
  r-rjson
  r-rsvg
  r-stringi
  make
)
optdepends=(
  r-bibtex
  r-biocmanager
  r-biocstyle
  r-chemminedrugs
  r-chemmineob
  r-fmcsr
  r-gplots
  r-knitcitations
  r-knitr
  r-knitrbootstrap
  r-png
  r-rmarkdown
  r-rpostgresql
  r-rsqlite
  r-scatterplot3d
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('71180e15d376fb78ffe966f797facc478aa00c9014a70aa42f50766c55f36466')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
