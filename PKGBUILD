# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='rcon'
pkgname="python-${_pkgbase}"
pkgver=2.2.0
pkgrel=2
pkgdesc='Python 3 RCON client library and scripts'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-setuptools')
optdepends=('python-gobject: for GUI support')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgbase}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
