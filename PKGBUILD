# Maintainer: Evgeniy Filimonov <evgfilim1 at gmail dot com>

_pyname='magic-filter'
pkgname="python-${_pyname}"
pkgver=1.0.0a1
pkgrel=1
pkgdesc="A filter package based on dynamic attribute getter"
arch=('any')
url="https://github.com/aiogram/${_pyname}"
license=('MIT')
depends=(
    'python>=3.6.2'
)
makedepends=(
    'python-setuptools'
)
source=("https://pypi.python.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('af77522f1ab2a7aac6a960fb731097ada793da18f7ad96b1e29c11bd9c2d09cd')
provides=("python-${_pyname}")
conflicts=("python-${_pyname}" "python-${_pyname}-git")

build() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ft=sh ts=4 sw=4 et 
