# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_analytic_sale
_name=trytond_analytic_sale
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add analytic accounting on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ddfac6bd93271ed90c18c7ac77658e29f89a32a5ed951364561795e05ebc3410')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
