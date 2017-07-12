# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=async_generator
pkgname='python-async_generator'
pkgver='1.8'
pkgrel='1'
pkgdesc='Easy to write async iterators in Python 3.5'
arch=('any')
url='https://github.com/njsmith/async_generator'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')

source=("https://github.com/njsmith/async_generator/archive/v$pkgver.tar.gz")
sha256sums=('4e5558912b5a7d142d4740a54f2e731e6492a5859e5cfcc166190c612de77874')

build() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}" --prefix="/usr"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest
}
# vim:set ts=2 sw=2 et:
