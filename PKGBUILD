# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_cranname=maptools
_cranver=0.9
_cranrel=5
pkgname="r-$_cranname"
pkgver="${_cranver}_$_cranrel"
pkgrel=1
pkgdesc="Tools for Reading and Handling Spatial Objects"
arch=('x86_64')
_cranurl=http://cran.r-project.org
url="$_cranurl/web/packages/$_cranname/index.html"
license=('GPL')
depends=('r' 'r-sp')
options=(!emptydirs)
sha256sums=('5d9511f09fb49d57a51f28495b02239800596a4fcfad7b03ee1074d793657bdd')
source=("$_cranurl/src/contrib/${_cranname}_${_cranver}-$_cranrel.tar.gz")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/lib/R/library"
  R CMD INSTALL "$_cranname/" -l "$pkgdir/usr/lib/R/library"
}
