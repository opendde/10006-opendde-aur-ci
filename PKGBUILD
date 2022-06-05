# system requirements: pdfcrop (part of TexLive) is required to rebuildthe vignettes.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=copula
_pkgver=1.0-1
pkgname=r-${_pkgname,,}
pkgver=1.0.1
pkgrel=3
pkgdesc='Multivariate Dependence with Copulas'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-adgoftest
  r-colorspace
  r-gsl
  r-mvtnorm
  r-numderiv
  r-pcapp
  r-pspline
  r-stabledist
  texlive-core
)
optdepends=(
  r-abind
  r-bbmle
  r-copuladata
  r-crop
  r-gridextra
  r-kernsmooth
  r-knitr
  r-lcopula
  r-mass
  r-mev
  r-mvnormtest
  r-nor1mix
  r-parallel
  r-partitions
  r-polynom
  r-qrng
  r-randtoolbox
  r-rmarkdown
  r-rmpfr
  r-rugarch
  r-runuran
  r-scatterplot3d
  r-sfsmisc
  r-tseries
  r-vgam
  r-vinecopula
  r-zoo
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d09b2ccffc7379e48b00952aa6b282baf502feebaf55cc44e93f881d7b909742')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
