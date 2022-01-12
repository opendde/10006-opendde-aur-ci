#Contributor: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python-griddataformats
pkgver=0.6.0
pkgrel=2
pkgdesc="The gridDataFormats package provides classes to unify reading and writing n-dimensional datasets. One can read grid data from files, make them available as a Grid object, and allows one to write out the data again."
url="https://github.com/orbeckst/GridDataFormats/"
license=("GPL")
arch=('x86_64')
depends=('python-numpy')


source=(https://github.com/orbeckst/GridDataFormats/archive/$pkgver.tar.gz)
sha256sums=('8162beb3c360734ec5bf365b4afb8cc8beb498cf7c1b820da0a53e79fa6ca87f')

build() {
  cd $srcdir/GridDataFormats-$pkgver
  python setup.py build
}

package(){
  cd $srcdir/GridDataFormats-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
