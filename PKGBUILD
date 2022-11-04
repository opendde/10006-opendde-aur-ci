# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcxnData
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=2.20.0
pkgrel=1
pkgdesc='Correlation coefficients and p values between pre-defined pathway/gene sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-pcxn
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b5781964d6f14b0f30bd694c5951707cba29de02688a425cc80e9bcee95749bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
