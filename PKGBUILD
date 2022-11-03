# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XDE
_pkgver=2.44.0
pkgname=r-${_pkgname,,}
pkgver=2.44.0
pkgrel=1
pkgdesc='XDE: a Bayesian hierarchical model for cross-study analysis of differential gene expression'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-genefilter
  r-genemeta
  r-gtools
  r-mvtnorm
  r-rcolorbrewer
  r-siggenes
)
optdepends=(
  r-coda
  r-mass
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f73bdae53974b06d40ad45504a53cfe78fdca9b7666ca4721a8740ff45ca5ab6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
