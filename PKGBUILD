# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Dino
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=3
pkgdesc='Normalization of Single-Cell mRNA Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biocsingular
  r-matrixstats
  r-s4vectors
  r-scran
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-devtools
  r-ggplot2
  r-ggpubr
  r-grid
  r-gridextra
  r-hexbin
  r-knitr
  r-magick
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2efcc5e8f19c3eef71ab114fc841490222cc8db766b6113f040fc445846670cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
