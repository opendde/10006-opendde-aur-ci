# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellScore
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Tool for Evaluation of Cell Identity from Transcription Profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-gplots
  r-lsa
  r-rcolorbrewer
  r-squash
)
optdepends=(
  r-hgu133plus2cellscore
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('75553c262b3f53586cb3809df9a9bfefd71fb9ccc3b24eeaa5834af851ba209d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
