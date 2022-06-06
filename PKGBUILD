# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reactR
_pkgver=0.4.4
pkgname=r-${_pkgname,,}
pkgver=0.4.4
pkgrel=4
pkgdesc='React Helpers'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmltools
)
optdepends=(
  r-htmlwidgets
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-shiny
  r-usethis
  r-v8
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5cb88fb365a986cba36c99c26f6c96692c5fa85fd3be7fe7564dd3d7878c8095')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
