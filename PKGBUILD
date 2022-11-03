# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOTHiC
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Binomial test for Hi-C data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocmanager
  r-biostrings
  r-bsgenome
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shortread
)
optdepends=(
  r-hicdatalymphoblast
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a5f597596f56ace46c685b4bb231f885cdc474a59e8b2ed20d5b69e5c35ffb84')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
