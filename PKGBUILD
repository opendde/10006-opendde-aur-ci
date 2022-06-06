# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vulcan
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='VirtUaL ChIP-Seq data Analysis using Networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-catools
  r-chippeakanno
  r-csaw
  r-deseq2
  r-diffbind
  r-genomicranges
  r-gplots
  r-locfit
  r-s4vectors
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-viper
  r-wordcloud
  r-zoo
)
optdepends=(
  r-vulcandata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5c388c810df921125c0fad9ce5b196a3dea1baff739a338f026fd850afaf2f39')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
