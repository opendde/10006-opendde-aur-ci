# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=zinbwave
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Zero-Inflated Negative Binomial Model for RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-edger
  r-genefilter
  r-singlecellexperiment
  r-softimpute
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-biomart
  r-deseq2
  r-ggplot2
  r-knitr
  r-magrittr
  r-matrixstats
  r-rmarkdown
  r-rtsne
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d1bc70017abf9888fc98c64e4eb9bb93bf512e92b4c87e3d598547a68338ff6e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
