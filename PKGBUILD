#Submiter: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python-gsd
pkgver=2.4.0
pkgrel=1
pkgdesc="The macromolecular transmission format (MMTF) is a binary encoding of biological structures."
url="http://mmtf.rcsb.org/"
license=("BSD")
arch=('x86_64')
depends=('cython' 'python-numpy')


source=(https://github.com/glotzerlab/gsd/archive/v$pkgver.tar.gz)
sha256sums=('210b56995b22ae7cc2c53e0307f267752c7738ae4b149ab798f9c16f47943a8b')

build() {
  cd $srcdir/gsd-$pkgver/
  python setup.py build
}

package(){
  cd $srcdir/gsd-$pkgver/
  python setup.py install --root=$pkgdir --optimize=1
}
