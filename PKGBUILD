# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pydantic-git
pkgver=1.5.1.r13.g5067508e
pkgrel=1
pkgdesc='Data parsing and validation using Python type hints'
arch=('x86_64')
url='https://pydantic-docs.helpmanual.io'
license=('MIT')
provides=("${pkgname%-git}")
depends=('python')
makedepends=('cython' 'git')
optdepends=('python-ujson: Faster JSON parsing in pure Python'
            'python-email-validator: Enable email validation')
checkdepends=('python-pytest-cov' 'mypy')
source=("python-pydantic::git+https://github.com/samuelcolvin/pydantic")
sha256sums=('SKIP')

pkgver() {
  cd pydantic
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd pydantic
  python setup.py build
}

package() {
  cd pydantic
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}