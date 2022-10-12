# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=insight
_pkgver=0.18.5
pkgname=r-${_pkgname,,}
pkgver=0.18.5
pkgrel=1
pkgdesc='Easy Access to Model Information for Various Model Objects'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-aer
  r-afex
  r-aod
  r-bayesfactor
  r-bayestestr
  r-bbmle
  r-bdsmatrix
  r-betareg
  r-bife
  r-biglm
  r-blavaan
  r-blme
  r-boot
  r-brms
  r-censreg
  r-cgam
  r-clubsandwich
  r-coxme
  r-cplm
  r-crch
  r-datawizard
  r-effectsize
  r-emmeans
  r-epir
  r-estimatr
  r-feisr
  r-fixest
  r-fungible
  r-gam
  r-gamlss
  r-gamm4
  r-gbm
  r-gee
  r-geepack
  r-glmmadaptive
  r-glmmtmb
  r-gmnl
  r-gt
  r-httr
  r-ivreg
  r-jm
  r-knitr
  r-lavaan
  r-lfe
  r-lme4
  r-lmtest
  r-logistf
  r-mass
  r-matrix
  r-mclust
  r-mcmcglmm
  r-mertools
  r-metabma
  r-mgcv
  r-mice
  r-mlogit
  r-multgee
  r-nlme
  r-nnet
  r-nonnest2
  r-ordinal
  r-panelr
  r-parameters
  r-parsnip
  r-performance
  r-plm
  r-poorman
  r-pscl
  r-psych
  r-quantreg
  r-rmarkdown
  r-rms
  r-robustbase
  r-robustlmm
  r-rstanarm
  r-rstantools
  r-rstudioapi
  r-sandwich
  r-speedglm
  r-spelling
  r-splines
  r-statmod
  r-survey
  r-survival
  r-testthat
  r-tripack
  r-truncreg
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('653a51b1c32de06e4649ffdd209e51c9cd82986ad6f8d5a3bcdedb6911456652')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
