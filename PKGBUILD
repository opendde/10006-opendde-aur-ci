# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VanillaICE
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='A Hidden Markov Model for high throughput genotyping arrays'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-bsgenome.hsapiens.ucsc.hg18
  r-crlmm
  r-data.table
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-oligoclasses
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-domc
  r-dompi
  r-doparallel
  r-doredis
  r-dosnow
  r-human610quadv1bcrlmm
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('37e150372b1d97b10799f32675ad3ac2678366b35c486e219db9386b358a6ed4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
