# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=skewr
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc="Visualize Intensities Produced by Illumina's Human Methylation 450k BeadChip"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-illuminahumanmethylation450kmanifest
  r-methylumi
  r-minfi
  r-mixsmsn
  r-rcolorbrewer
  r-s4vectors
  r-watermelon
)
optdepends=(
  r-geoquery
  r-knitr
  r-minfidata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('abc2803f0cf1da501246803c903f6c5dc83383ba7bbe14b2f9af9512c39b8cb7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
