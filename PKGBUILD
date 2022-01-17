# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=Rsamtools
_bcver=2.10.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Binary alignment (BAM), FASTA, variant call (BCF), and tabix file import"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=3.5.0' 'r-genomeinfodb>=1.1.3' 'r-genomicranges>=1.31.8' 'r-biostrings>=2.47.6' 'r-biocgenerics>=0.25.1' 'r-s4vectors>=0.17.25' 'r-iranges>=2.13.12' 'r-xvector>=0.19.7' r-zlibbioc r-bitops r-biocparallel 'r-rhtslib>=1.17.7')
makedepends=(make)
optdepends=(r-genomicalignments r-shortread r-genomicfeatures r-txdb.dmelanogaster.ucsc.dm3.ensgene r-kegg.db r-txdb.hsapiens.ucsc.hg18.knowngene r-rnaseqdata.hnrnpc.bam.chr14 r-bsgenome.hsapiens.ucsc.hg19 r-runit r-biocstyle)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('d02799a7883b801abb5c0399e22a18f116bfb8dc41bbeb0870a9ed58881ccb6c')

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
