# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=svglite
_cranver=2.1.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="An 'SVG' Graphics Device"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(libpng r-systemfonts)
makedepends=(r-cpp11)
checkdepends=(
    r-fontquiver
    r-testthat
    r-xml2
    ttf-liberation
)
optdepends=(
    r-htmltools
    r-testthat
    r-xml2
    r-covr
    r-fontquiver
    r-knitr
    r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('ad40f590c7e80ae83001a3826b6e8394ba733446ed51fd55faeda974ab839c9b')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
