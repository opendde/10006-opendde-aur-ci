# system requirements: JAGS >= 4.3.0 (https://mcmc-jags.sourceforge.io/)
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=RoBMA
_pkgver=2.3.0
pkgname=r-${_pkgname,,}
pkgver=2.3.0
pkgrel=1
pkgdesc='Robust Bayesian Meta-Analyses'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayestools
  r-bridgesampling
  r-callr
  r-coda
  r-extradistr
  r-ggplot2
  r-mvtnorm
  r-psych
  r-rdpack
  r-rjags
  r-runjags
  r-scales
  jags
)
optdepends=(
  r-covr
  r-knitr
  r-metabma
  r-parallel
  r-rmarkdown
  r-rstan
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dda47566af9e73808fc88f0f7d9f3d5b129c6d529bb3e102a5c5381895fcbe50')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
