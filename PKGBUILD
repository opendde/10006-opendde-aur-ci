# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=available
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=1.0.5
pkgrel=4
pkgdesc='Check if the Title of a Package is Available, Appropriate and Interesting'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-clisymbols
  r-crayon
  r-desc
  r-glue
  r-jsonlite
  r-memoise
  r-snowballc
  r-stringdist
  r-tibble
  r-tidytext
  r-udapi
  r-yesno
)
optdepends=(
  r-biocmanager
  r-covr
  r-testthat
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c59f6c1c92bb846ed7eedbfae02da4854129626716966c2b68a3aaa95dfd9ed6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
