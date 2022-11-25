# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=performance
_pkgver=0.10.1
pkgname=r-${_pkgname,,}
pkgver=0.10.1
pkgrel=1
pkgdesc='Assessment of Regression Models Performance'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayestestr
  r-datawizard
  r-insight
)
optdepends=(
  r-aer
  r-afex
  r-bayesfactor
  r-betareg
  r-bigutilsr
  r-brms
  r-car
  r-compquadform
  r-correlation
  r-cplm
  r-dbscan
  r-fixest
  r-forecast
  r-gamm4
  r-ggplot2
  r-glmmtmb
  r-gridextra
  r-ics
  r-icsoutlier
  r-islr
  r-lavaan
  r-lme4
  r-lmtest
  r-loo
  r-magrittr
  r-mass
  r-matrix
  r-metafor
  r-mgcv
  r-mlogit
  r-nlme
  r-nonnest2
  r-ordinal
  r-parallel
  r-parameters
  r-pscl
  r-psych
  r-randomforest
  r-rmarkdown
  r-rstanarm
  r-rstantools
  r-sandwich
  r-see
  r-spelling
  r-survey
  r-survival
  r-testthat
  r-tweedie
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ff9ee7ddf034bc090501e03412eff3778641ee2e72f5096ac348d1e5ecff5fd4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
