# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biscuiteer
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Convenience Functions for Biscuit'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biscuiteerdata
  r-bsseq
  r-data.table
  r-delayedmatrixstats
  r-dmrseq
  r-genomeinfodb
  r-genomicranges
  r-gtools
  r-hdf5array
  r-homo.sapiens
  r-impute
  r-matrixstats
  r-mus.musculus
  r-qdnaseq
  r-qualv
  r-r.utils
  r-readr
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-covr
  r-dss
  r-knitr
  r-markdown
  r-pkgdown
  r-qdnaseq.hg19
  r-qdnaseq.mm10
  r-rlang
  r-rmarkdown
  r-roxygen2
  r-scmeth
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b92a7256f0c5195027c8202bd6ec6755824b76e0423490bd09ea45a7545bfb78')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
