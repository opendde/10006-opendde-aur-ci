# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multcomp
_pkgver=1.4-19
pkgname=r-${_pkgname,,}
pkgver=1.4.19
pkgrel=1
pkgdesc='Simultaneous Inference in General Parametric Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
  r-sandwich
  r-th.data
)
optdepends=(
  r-coin
  r-coxme
  r-fixest
  r-foreign
  r-iswr
  r-lme4
  r-lmtest
  r-mass
  r-nlme
  r-robustbase
  r-simcomp
  r-tram
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f03473b1cfbc714cd85a0ee948e2ecdb23bcdccbe95e27237ee25e9c71e3e557')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
