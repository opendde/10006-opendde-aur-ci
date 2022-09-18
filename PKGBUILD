# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=bayestestR
_pkgver=0.13.0
pkgname=r-${_pkgname,,}
pkgver=0.13.0
pkgrel=1
pkgdesc='Understand and Describe Bayesian Models and Posterior Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-datawizard
  r-insight
)
optdepends=(
  r-bayesfactor
  r-bayesqr
  r-blavaan
  r-bridgesampling
  r-brms
  r-dplyr
  r-effectsize
  r-emmeans
  r-ggally
  r-ggplot2
  r-ggridges
  r-httr
  r-kernsmooth
  r-knitr
  r-lavaan
  r-lme4
  r-logspline
  r-mass
  r-mclust
  r-mediation
  r-modelbased
  r-parameters
  r-performance
  r-rmarkdown
  r-rstan
  r-rstanarm
  r-see
  r-spelling
  r-stringr
  r-testthat
  r-tidyr
  r-tweedie
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('206905f5e9ac82c9a6d1c41008713d952b71f8fbeee7a732c975518c50fda1a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
