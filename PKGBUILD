# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=crisprseekplus
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='crisprseekplus'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocmanager
  r-bsgenome
  r-crisprseek
  r-dt
  r-genomicfeatures
  r-genomicranges
  r-guideseq
  r-hash
  r-shiny
  r-shinyjs
)
optdepends=(
  r-knitr
  r-r.rsp
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('052c5d54cc9f1118fd8afb1df51fc47987f04debb368ab64406ddd8b8fa2bec2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
