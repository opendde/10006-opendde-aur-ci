# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-lru-dict
_pkgname=lru-dict
pkgver=1.1.6
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
sha256sums=('365457660e3d05b76f1aba3e0f7fedbfcd6528e97c5115a351ddd0db488354cc')

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
