# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python-awaitable
_pkgname=${pkgname//python-/}
pkgver=0.1.0
pkgrel=1
pkgdesc=" A decorator to asynchronously execute synchronous functions"
url="http://www.muflone.com/awaitable/"
arch=('any')
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('edd20a885587baa8e0d9914b710b7541f89c7a276fb4ce270218e88616269d4e')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

