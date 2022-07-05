#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspGraphs
_pkgver=0.5.2.15
pkgname=r-${_pkgname,,}
pkgver=0.5.2.15
pkgrel=1
pkgdesc="Custom Graphs for JASP"
arch=('x86_64')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
'r-jsonlite'
'r-lifecycle'
'r-ggplot2'
'r-gridextra'
'r-rlang'
'r-scales'
'r-viridislite'
'r-rcolorbrewer'
)
groups=(r-jasp r-jaspbase)
makedepends=('git')
optdepends=('r-testthat')
source=("git+https://github.com/jasp-stats/${_pkgname}.git")
sha256sums=('SKIP')


build() {
  mkdir -p ${srcdir}/usr/lib/R/library
  R -e "install.packages('${srcdir}/${_pkgname}',\
     type='source', repos=NULL,lib='${srcdir}/usr/lib/R/library', INSTALL_opts='--no-multiarch --no-docs --no-test-load')"
}

package() {

  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
}
