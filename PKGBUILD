# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=isoband
_cranver=0.2.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Generate Isolines and Isobands from Regularly Spaced Elevation Grids"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r)
checkdepends=(r-testthat r-xml2)
optdepends=(
    r-covr
    r-ggplot2
    r-knitr
    r-magick
    r-microbenchmark
    r-rmarkdown
    r-sf
    r-testthat
    r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRAN-MIT-TEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha256sums=('27e460945753f6710649563dc817e2f314392ef6d1f8b6af2b1bf9447fab43a3'
            'e76e4aad5d3d9d606db6f8c460311b6424ebadfce13f5322e9bae9d49cc6090b')

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

  install -Dm644 CRAN-MIT-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
