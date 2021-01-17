# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_eu
_name=trytond_account_eu
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for european accounting"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('11c1f7c498a9a6a6629ad78d13f8d077222c5fab5fd207f2341a355de0e3b449')
b2sums=('501ce6412758057dfd2eae86f56377a0f4a76d4a599475f8bff131b04a9e04610ebe00c1b81a650a8feb4b49c03c9e65f5e06db33e17bff16288dcf0bf95394d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
