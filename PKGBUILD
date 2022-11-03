# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scCB2
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='CB2 improves power of cell detection in droplet-based single-cell RNA sequencing data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-dropletutils
  r-edger
  r-foreach
  r-iterators
  r-rhdf5
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  gcc
)
optdepends=(
  r-beachmat
  r-biocstyle
  r-kernsmooth
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d4760d95e744f10a5e19e67176e57d745be9a419a066cafab7576dcf0ff731e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
