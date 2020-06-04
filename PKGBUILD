# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rstatix
_cranver=0.5.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Pipe-Friendly Framework for Basic Statistical Tests"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=3.3.0' 'r-tidyr>=1.0.0' r-purrr r-broom 'r-rlang>=0.3.1' 'r-tibble>=2.1.3' 'r-dplyr>=0.7.1' r-magrittr r-corrplot 'r-tidyselect>=1.0.0' r-car)
optdepends=(r-knitr r-rmarkdown r-ggpubr r-emmeans r-coin r-testthat r-spelling)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('087f8b0e1af60bc4c4af2c1e31e121f3')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
