# Maintainer: Evgeniy Filimonov <evgfilim1 at gmail dot com>

_pyname='magic-filter'
pkgname="python-${_pyname}"
pkgver=0.1.2
pkgrel=1
pkgdesc="A filter package based on dynamic attribute getter"
arch=('any')
url="https://github.com/aiogram/${_pyname}"
license=('MIT')
depends=(
    'python>=3.6.1'
)
makedepends=(
    'python-setuptools'
)
source=("https://pypi.python.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('dfd1a778493083ac1355791d1716c3beb6629598739f2c2ec078815952282c1d')
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
