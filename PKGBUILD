# system requirements: Rcpp
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RJMCMCNucleosomes
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Bayesian hierarchical model for genome-wide nucleosome positioning with high-throughput short-read data (MNase-Seq)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-consensusseeker
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rcpp
  r-s4vectors
  gsl
)
optdepends=(
  r-biocstyle
  r-knitr
  r-nucleosim
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9502cc42a70aaa7d0b6973ba53cbb5d138d3bb78259b00bd9c025148990d608e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
