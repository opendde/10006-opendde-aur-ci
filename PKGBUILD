# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=metR
_cranver=0.9.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Easier Analysis of Meteorological Fields"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=2.10' r-checkmate r-data.table r-digest r-fields r-formula r-formula.tools 'r-ggplot2>=3.0.0' r-gtable r-lubridate r-memoise r-plyr r-scales r-sp r-stringr r-purrr r-rcurl r-isoband)
optdepends=(r-maps r-maptools r-covr r-irlba r-knitr r-ncdf4 r-pkgdown r-reshape2 r-rmarkdown r-testthat r-viridis r-udunits2 r-gridextra r-vdiffr r-proj4 r-kriging r-raster r-rgdal)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('31afe5740ab4e3477e9cfed37a86bb5aa0d0c82753263969231ec0c4a8b40f69')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
