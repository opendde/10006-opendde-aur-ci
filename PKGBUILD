# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=REDseq
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Analysis of high-throughput sequencing data processed by restriction enzyme digestion'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-bsgenome.celegans.ucsc.ce2
  r-chippeakanno
  r-iranges
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fe7176ee8e6223db252907230ba1379f149789c28e99ea66085a5eaa0227208f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
