# system requirements: megadepth(<https://github.com/ChristopherWilks/megadepth>)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=megadepth
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='megadepth: BigWig and BAM related utilities'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-cmdfun
  r-dplyr
  r-fs
  r-genomicranges
  r-magrittr
  r-readr
  r-xfun
)
optdepends=(
  r-biocstyle
  r-covr
  r-derfinder
  r-genomeinfodb
  r-knitr
  r-refmanager
  r-rmarkdown
  r-rtracklayer
  r-sessioninfo
  r-testthat
  r-tools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2843ae5280eecdac65af1de09c75fc594412643532c5ad9feb73ce8f712c33cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
