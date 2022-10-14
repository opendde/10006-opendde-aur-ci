# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
_pkgver=2.6.3
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-multipledispatch' 'python-tensorflow' 'python-tensorflow-probability' 'python-tabulate' 'python-typing_extensions' 'python-packaging' 'python-deprecated' 'python-lark-parser')
checkdepends=('python-pytest')
optdepends=('python-matplotlib: Image to tensorboard extra utility')
makedepends=('python-setuptools' 'findutils')
source=("https://github.com/GPflow/GPflow/archive/v${_pkgver}.tar.gz")
sha256sums=('0ef32f19dbb45300ada1b43988e26b4030ac055ccb67520bed713e7693c9065a')

prepare() {
    # Do not install tests into site-packages root
    find "${srcdir}/GPflow-${_pkgver}/tests/" -name "__init__.py" -type f -delete
}

build() {
  cd "${srcdir}"/GPflow-${_pkgver}
  python setup.py build
}

package() {
  cd "${srcdir}"/GPflow-${_pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
