# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HPAanalyze
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Retrieve and analyze data from the Human Protein Atlas'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-gridextra
  r-openxlsx
  r-tibble
  r-xml2
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-markdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('90019894d919a6b9788bc1b21874f2b82978c721f53b1108be1ea99295a6d54d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
