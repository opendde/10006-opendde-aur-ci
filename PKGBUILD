# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyMethyl
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Interactive visualization for Illumina methylation arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-illuminahumanmethylation450kmanifest
  r-matrixstats
  r-minfi
  r-rcolorbrewer
  r-shiny
)
optdepends=(
  r-biocstyle
  r-digest
  r-knitr
  r-minfidata
  r-runit
  r-shinymethyldata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('deff47a3cb2508b0d54d3963f2aa135e6e52fe3c38fb4b6c2b741493dcf06698')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
