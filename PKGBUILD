# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_stock_anglo_saxon
_name=trytond_account_stock_anglo_saxon
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for anglo-saxon real-time stock valuation"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3ca21cd969f3fb4b4edf4cb9aa857202eb7fbe3ef517634f54a934b20b37fa4e')
b2sums=('8c981496e624deb5d72eb17691b69b2426fe981e13b4ecd6afdbb89efb22715ca131beb4fab7450a8e9bc6a4d876160cbcb9e4126e4e9819003bf3849381d476')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
