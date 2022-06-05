# system requirements: GNU Make, C++11
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=Boom
_pkgver=0.9.10
pkgname=r-${_pkgname,,}
pkgver=0.9.10
pkgrel=1
pkgdesc='Bayesian Object Oriented Modeling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('403c1df9e3adbdf79b393c04cccfe99e6fbda352cce340eb5e2e65bcc61fa1f0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
