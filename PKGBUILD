#Maintainer: Orphan
#generated by: fordprefect <fordprefect@dukun.de>
_cranname=msm
pkgname=r-cran-$_cranname
pkgver=1.5
pkgrel=1
pkgdesc="Multi-state Markov and hidden Markov models in continuous time"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('e32da00652a867782adae7601d4c95b8')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
