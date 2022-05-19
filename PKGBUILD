# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>

_cranname=tibble
_cranver=3.1.7
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Simple Data Frames"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
    r-ellipsis
    r-fansi
    r-lifecycle
    r-magrittr
    r-pillar
    r-pkgconfig
    r-rlang
    r-vctrs
)
optdepends=(
    r-bench
    r-bit64
    r-blob
    r-brio
    r-callr
    r-cli
    r-covr
    r-crayon
    r-diagrammer
    r-dplyr
    r-evaluate
    r-formattable
    r-ggplot2
    r-hms
    r-htmltools
    r-knitr
    r-lubridate
    r-mockr
    r-nycflights13
    r-pkgbuild
    r-pkgload
    r-purrr
    r-rmarkdown
    r-stringi
    r-testthat
    r-tidyr
    r-withr
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRAN-MIT-TEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha256sums=('e1a50891f476803526960b4c4d736a72e7d9c3d366946744a02d6347f591c872'
            'e76e4aad5d3d9d606db6f8c460311b6424ebadfce13f5322e9bae9d49cc6090b')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 CRAN-MIT-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
