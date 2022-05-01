# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomicAlignments
_bcver=1.32.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Representation and manipulation of short genomic alignments"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=(
    "r>=4.0.0"
	"r-biocgenerics>=0.37.0"
    r-biocparallel
	"r-biostrings>=2.55.7"
	"r-genomeinfodb>=1.13.1"
	"r-genomicranges>=1.41.5"
	"r-iranges>=2.23.9"
	"r-rsamtools>=1.31.2"
	"r-s4vectors>=0.27.12"
	"r-summarizedexperiment>=1.9.13"
)
optdepends=(
	r-biocstyle
	r-bsgenome
	r-bsgenome.dmelanogaster.ucsc.dm3
	r-bsgenome.hsapiens.ucsc.hg19
	r-deseq2
	r-edger
	r-genomicfeatures
	r-pasillabamsubset
	r-rnaseqdata.hnrnpc.bam.chr14
	r-rtracklayer
	r-runit
	r-txdb.dmelanogaster.ucsc.dm3.ensgene
	r-txdb.hsapiens.ucsc.hg19.knowngene
    r-shortread
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('71354a8f7b07283065bff8280558a15ddfc35a6d225de2d8f7c5214400a3d5c5')

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
