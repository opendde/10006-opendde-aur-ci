# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RnBeads
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=1
pkgdesc='RnBeads'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-ff
  r-fields
  r-genomicranges
  r-ggplot2
  r-gplots
  r-gridextra
  r-illuminaio
  r-iranges
  r-limma
  r-matrixstats
  r-methylumi
  r-plyr
  r-s4vectors
)
optdepends=(
  r-annotate
  r-argparse
  r-biomart
  r-category
  r-doparallel
  r-foreach
  r-ggbio
  r-glad
  r-glmnet
  r-gostats
  r-gviz
  r-hexbin
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-impute
  r-isva
  r-mclust
  r-methylseekr
  r-mgcv
  r-minfi
  r-missmethyl
  r-nlme
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-plotrix
  r-quadprog
  r-qvalue
  r-qvalue
  r-reffreeewas
  r-rnbeads.hg19
  r-rnbeads.mm9
  r-rpmm
  r-rtracklayer
  r-runit
  r-scales
  r-sesame
  r-shiny
  r-shinyjs
  r-sva
  r-watermelon
  r-wordcloud
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('858c6920745f54cb141e828ba80e366e3a803be2658cafc11d7224049295b6e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
