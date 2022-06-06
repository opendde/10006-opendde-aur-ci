# system requirements: jupyter, jupyter_kernel_test (Python package fortesting)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IRkernel
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=3
pkgdesc="Native R Kernel for the 'Jupyter Notebook'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-crayon
  r-digest
  r-evaluate
  r-irdisplay
  r-jsonlite
  r-pbdzmq
  r-repr
  r-uuid
  jupyter
)
optdepends=(
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5a7fcbfd978dfb3cca6702a68a21c147551995fc400084ae8382ffcbbdae1903')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
