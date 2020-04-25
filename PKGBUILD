# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Abhishek Mudgal
# Contributor: Ivan Semkin (ivan at semkin dot ru)

_pkgname=vdf
pkgname=(python-vdf)
pkgver=3.2
pkgrel=1
pkgdesc="Library for working with Valve's VDF text format"
arch=('any')
url='https://github.com/ValvePython/vdf'
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python python-nose python-coverage python-mock)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ValvePython/vdf/archive/v$pkgver.tar.gz")
sha256sums=('ad790a34a20d9c5f36b8bd9e93658f85a9e90be7c84bb3a24f893b531a94e3ca')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
