#Maintainer: Orphan
#generated by: fordprefect <fordprefect@dukun.de>
_cranname=expm
pkgname=r-cran-$_cranname
_cranver=0.999-0
pkgver=0.999_0
pkgrel=1
pkgdesc="Computation of the matrix exponential and related quantities"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('f2c933fc3994559a4767b26a81c8bf05')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
