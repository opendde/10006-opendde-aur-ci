# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnhancedVolcano
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Publication-ready volcano plots with enhanced colouring and labeling'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggalt
  r-ggplot2
  r-ggrastr
  r-ggrepel
)
optdepends=(
  r-airway
  r-biocgenerics
  r-deseq2
  r-gridextra
  r-knitr
  r-magrittr
  r-org.hs.eg.db
  r-pasilla
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e2d30184c0b420bb18bb4f2a091563905b5a17ebf2c25fea368a8b05bdab1abe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
