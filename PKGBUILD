# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=batchtools
_pkgver=0.9.15
pkgname=r-${_pkgname,,}
pkgver=0.9.15
pkgrel=4
pkgdesc='Tools for Computation on Batch Systems'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-backports
  r-base64url
  r-brew
  r-checkmate
  r-data.table
  r-digest
  r-fs
  r-progress
  r-r6
  r-rappdirs
  r-stringi
  r-withr
)
optdepends=(
  r-debugme
  r-dompi
  r-doparallel
  r-e1071
  r-foreach
  r-future
  r-future.batchtools
  r-knitr
  r-parallelmap
  r-ranger
  r-rmarkdown
  r-rpart
  r-snow
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a238fca4dca005ce49f73b132e6fcca63b80224a9bf58fbeb70cfe09cff15d34')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
