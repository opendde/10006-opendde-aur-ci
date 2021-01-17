# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_complaint
_name=trytond_sale_complaint
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for sale complaint"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('259534a30544a1cb8146c5255e5b827a8ccac3d10ee3b8c4af113637b225266f')
b2sums=('1d2e643bee1d78f588743f0294b61bb8ae165f5fe44361cd4bb1a3d1b71adcdaaf85d1eacc7c4b10cce464e7aec466e6e15c94c0dcb17d08df0a2741f82761d4')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
