# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgbase=jinja2-time
pkgbase=python-jinja-time
pkgname=(${pkgbase} python2-jinja-time)
pkgver=0.2.0
pkgrel=1
pkgdesc="Python Jinja2 library extension for dates and times"
arch=(any)
url="https://github.com/hackebrot/jinja2-time"
license=('MIT')
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/de/7c/ee2f2014a2a0616ad3328e58e7dac879251babdb4cb796d770b5d32c469f/${_pkgbase}-$pkgver.tar.gz")
sha256sums=('d14eaa4d315e7688daa4969f616f226614350c48730bfa1692d2caebd8c90d40')


prepare() {
  cp -r ${_pkgbase}-${pkgver} python2-${_pkgbase}-${pkgver}
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py build

  cd "${srcdir}/python2-${_pkgbase}-${pkgver}"
  python2 setup.py build
}

package_python-jinja-time() {
  pkgdesc="Python Jinja2 library extension for dates and times"
  depends=('python-jinja' 'python-arrow')

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-jinja-time() {
  pkgdesc="Python 2 Jinja2 library extension for dates and times"
  depends=('python2-jinja' 'python2-arrow')

  cd "${srcdir}/python2-${_pkgbase}-${pkgver}"
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
