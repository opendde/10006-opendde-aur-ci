# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgbase=jinja2-time
pkgbase=python-jinja-time
pkgname=(${pkgbase} python2-jinja-time)
pkgver=0.1.0
pkgrel=1
pkgdesc="Python Jinja2 library extension for dates and times"
arch=(any)
url="https://github.com/hackebrot/jinja2-time"
license=('MIT')
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/j/${_pkgbase}/${_pkgbase}-$pkgver.tar.gz")
sha256sums=('e1dc60e917be18e7b07d5e908531ff55134f2bb67e1aeb4573a1d0267f33aa91')


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
  depends=('python')

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-jinja-time() {
  pkgdesc="Python 2 Jinja2 library extension for dates and times"
  depends=('python2')

  cd "${srcdir}/python2-${_pkgbase}-${pkgver}"
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
