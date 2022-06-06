# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TPP2D
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Detection of ligand-protein interactions from 2D thermal profiles (DLPTP)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-doparallel
  r-dplyr
  r-foreach
  r-ggplot2
  r-limma
  r-openxlsx
  r-rcurl
  r-stringr
  r-tidyr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('64b93d0fc3f28a9277e38b9f8a51cd0f1466a018bb40ede5a6706a9176c8c794')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
