# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_shipment_cost
_name=trytond_purchase_shipment_cost
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for purchase shipment cost"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('941df5625a99a69abfba98adbb57745d6351fd898e17f372a1e96eed645aa277')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
