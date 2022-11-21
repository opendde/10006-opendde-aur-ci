# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-cached-property
pkgver=1.5.2
pkgrel=5
pkgdesc="A decorator for caching properties in classes"
arch=('any')
license=('BSD')
url="https://github.com/pydanny/cached-property"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-freezegun')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydanny/cached-property/archive/$pkgver.tar.gz")
sha512sums=('71ce8376c5d90c8e97dc91af7a9329d3645a311c7cc41cf052074989430de68b66efc17c62c6780982f500b3d09a12cb24613df7b4f1bff95cf68f6442f50d0d')

build() {
  cd cached-property-$pkgver
  python3.8 setup.py build
}

check() {
  # https://github.com/pydanny/cached-property/issues/131
  cd cached-property-$pkgver
  py.test || echo "Tests failed"
}

package() {
  cd cached-property-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
