# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-lru-dict
_pkgname=lru-dict
pkgver=1.1.7
pkgrel=1
pkgdesc="A dict like LRU container."
arch=('x86_64')
url="https://pypi.org/project/lru-dict/"
license=('MIT')
depends=('python')
checkdepends=()
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('45b81f67d75341d4433abade799a47e9c42a9e22a118531dcb5e549864032d7c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build_ext

}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build_ext --inplace
  PYTHONPATH=. python test/test_lru.py
}
# vim:ts=2:sw=2:et:
