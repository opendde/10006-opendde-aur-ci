# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ideal
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Interactive Differential Expression AnaLysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-base64enc
  r-biocparallel
  r-deseq2
  r-dplyr
  r-dt
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-go.db
  r-goseq
  r-gostats
  r-gplots
  r-heatmaply
  r-ihw
  r-iranges
  r-knitr
  r-limma
  r-pcaexplorer
  r-pheatmap
  r-plotly
  r-rentrez
  r-rintrojs
  r-rlang
  r-rmarkdown
  r-s4vectors
  r-shiny
  r-shinyace
  r-shinybs
  r-shinydashboard
  r-stringr
  r-summarizedexperiment
  r-topgo
  r-upsetr
)
optdepends=(
  r-airway
  r-biocstyle
  r-deformats
  r-edger
  r-org.hs.eg.db
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3589cf8d9adfafd07be255b537d08fd5a476793f6164a925d1a2afb271dd7ea5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
