# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bsseq
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Analyze, manage and store bisulfite sequencing data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-beachmat
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-genomeinfodb
  r-genomicranges
  r-gtools
  r-hdf5array
  r-iranges
  r-limma
  r-locfit
  r-permute
  r-r.utils
  r-rcpp
  r-rhdf5
  r-s4vectors
  r-scales
  r-summarizedexperiment
  gcc
)
optdepends=(
  r-batchjobs
  r-beachmat
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsseqdata
  r-doparallel
  r-knitr
  r-matrix
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('25cee0bcaf95eeb734a76ad55f4e508b1201d99363b401df3d0d9ab5c58aeeca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
