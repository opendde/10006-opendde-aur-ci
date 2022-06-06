# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mhsmm
_pkgver=0.4.16
pkgname=r-${_pkgname,,}
pkgver=0.4.16
pkgrel=4
pkgdesc='Inference for Hidden Markov and Semi-Markov Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fab573abdc0dd44e8c8bc7242a1428df20b3ec64c4c194e5f1f907393f902d01')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
