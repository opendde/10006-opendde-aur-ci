# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vcd
_pkgver=1.4-9
pkgname=r-${_pkgname,,}
pkgver=1.4.9
pkgrel=4
pkgdesc='Visualizing Categorical Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-colorspace
  r-lmtest
)
optdepends=(
  r-coin
  r-hsaur3
  r-kernlab
  r-kernsmooth
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a5b420ad5ff1a27fa92f98099a8b43f2dded7e5f60297b3e4d947ad6f039568f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
