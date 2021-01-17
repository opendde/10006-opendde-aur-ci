# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_be
_name=trytond_account_be
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module with Belgian chart of accounts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6104ad93edd337168961df294ccf79ea14ba7e6bb3fd11ebc1d9bb32276c7520')
b2sums=('87c1514c096f4c3360c80facc087c39008b4ea0d7e6f1da28c20a984314b8452e993e48c7a48f825a7bb58ec6bce400be8d62318dd1ba02118767ef062c25847')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
