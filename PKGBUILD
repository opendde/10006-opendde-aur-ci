# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=colorspace
_cranver=2.0-2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Toolbox for Manipulating and Assessing Colors and Palettes"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(BSD)
depends=('r>=3.0.0')
optdepends=(r-kernsmooth r-kernlab r-mvtnorm r-vcd r-shiny r-shinyjs r-ggplot2 r-dplyr r-scales r-png r-jpeg r-knitr r-rmarkdown r-rcolorbrewer r-rcartocolor r-scico r-viridis r-wesanderson)
source=("${pkgname}-${pkgver}.tar.gz::https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('b891cd2ec129ed5f116429345947bcaadc33969758a108521eb0cf36bd12183a')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${pkgname}-${pkgver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
