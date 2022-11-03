# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SICtools
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Find SNV/Indel differences between two bam files with near relationship'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-doparallel
  r-genomicranges
  r-iranges
  r-matrixstats
  r-plyr
  r-rsamtools
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dd89c5e4c535f02f745d01e768b2315ac8ebf1771541abe1ff72439d00bc5cfe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
