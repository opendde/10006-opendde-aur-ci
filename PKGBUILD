# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=SummarizedExperiment
_bcver=1.24.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="SummarizedExperiment container"
arch=(any)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=4.0.0' 'r-matrixgenerics>=1.1.3' 'r-genomicranges>=1.41.5' r-biobase 'r-biocgenerics>=0.37.0' 'r-s4vectors>=0.27.12' 'r-iranges>=2.23.9' 'r-genomeinfodb>=1.13.1' 'r-delayedarray>=0.15.10')
optdepends=(r-hdf5array r-annotate r-annotationdbi r-hgu95av2.db r-genomicfeatures r-txdb.hsapiens.ucsc.hg19.knowngene r-jsonlite r-rhdf5 r-airway r-biocstyle r-knitr r-rmarkdown r-runit r-testthat r-digest)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('aa8864655e3a0efdbcdd6554282126112eedcf91a52b70993b7aa71895e8f662')

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
