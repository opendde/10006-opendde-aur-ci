# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python2-monero"
_projname="monero-python"
pkgver=0.4.3
pkgrel=1
pkgdesc='A comprehensive Python module for handling Monero cryptocurrency'
license=('BSD')
arch=('any')
url='https://github.com/emesik/monero-python'
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-requests' 'python2-pysha3')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('0ab99feba3d458a7b79e6ca8dbf6f26d')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
