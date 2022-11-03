# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ldblock
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='data structures for linkage disequilibrium measures in populations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-ensdb.hsapiens.v75
  r-ensembldb
  r-genomeinfodb
  r-genomicfiles
  r-httr
  r-rsamtools
  r-snpstats
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-gwascat
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d63071f99ac30ff67702623d91249c84d563b14356f8e16e2bee00711d271b45')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
