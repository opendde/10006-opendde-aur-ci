#Maintainer: Orphan
#generated by: fordprefect <fordprefect@dukun.de>
_cranname=msm
pkgname=r-cran-$_cranname
pkgver=1.6
pkgrel=1
pkgdesc="Multi-state Markov and hidden Markov models in continuous time"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('67f320315d58b905b471267dd4318d6d')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
