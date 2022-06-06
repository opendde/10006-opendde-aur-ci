#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspDescriptives
_pkgver=0.15.0
pkgname=r-${_pkgname,,}
pkgver=0.15.0
pkgrel=1
pkgdesc="Descriptives Module for JASP"
arch=('x86_64')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
'r-ggplot2'
'r-ggrepel'
'r-stringr'
'r-jaspbase'
'r-jaspgraphs'
)
groups=(r-jasp r-jaspcommon)
makedepends=('git')
optdepends=()
source=("git+https://github.com/jasp-stats/${_pkgname}.git")
sha256sums=('SKIP')


build() {
  mkdir -p ${srcdir}/usr/lib/R/library
  R -e "install.packages('${srcdir}/${_pkgname}',\
     type='source', repos=NULL,lib='${srcdir}/usr/lib/R/library', INSTALL_opts='--no-multiarch --no-docs --no-test-load')"

}

package() {
  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
