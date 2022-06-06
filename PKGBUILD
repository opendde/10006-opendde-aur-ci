# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggplotify
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=0.1.0
pkgrel=4
pkgdesc="Convert Plot to 'grob' or 'ggplot' Object"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-gridgraphics
  r-yulab.utils
)
optdepends=(
  r-aplot
  r-colorspace
  r-cowplot
  r-ggimage
  r-knitr
  r-lattice
  r-prettydoc
  r-rmarkdown
  r-utils
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('178f73d6d3dc391c3efb1a62c95fe38587044f9e3288dffb915d3687941bb38a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
