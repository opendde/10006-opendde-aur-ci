#Automatically generated by pip2arch on 2016-02-05

pkgname=python2-faftools
pkgver=0.0.0
pkgrel=1
pkgdesc="Forged Alliance Forever - Shared Library"
url="http://www.faforever.com/"
depends=('python2' )
makedepends=('python2' )
license=('GPL3')
arch=('any')
source=('https://github.com/FAForever/faftools/archive/develop.zip')
sha256sums=('da13d9dba7e18db6c49ae6ff83fa57a354791b0cce3cbb034b13db1e3a0b24b6')

build() {
    cd $srcdir/faftools-develop
    python2 setup.py build
}

package() {
    cd $srcdir/faftools-develop
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
