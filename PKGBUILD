# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production
_name=trytond_production
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for production"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f0db8d4d468fe9ff633e6ed0ee4057d3acde722d44ac65f664feea723d1e6c5f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
