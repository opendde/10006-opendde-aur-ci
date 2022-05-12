# Maintainer: Grey Christoforo <first name at last name dot net>
# Co-Maintainer: Bert Peters <bert@bertptrs.nl>

pkgname=python-plotly
pkgver=5.8.0
pkgrel=3
pkgdesc="An open-source, interactive graphing library"
url="https://github.com/plotly/plotly.py"
depends=(python
python-tenacity)
# optdepends based on optional_requirements.txt
optdepends=(
'ipython'
'jupyterlab'
'python-ipywidgets'
'python-numpy'
'python-matplotlib'
'python-pillow'
'python-scipy')
makedepends=(python-setuptools
python-jupyter_core
python-tornado
jupyterlab
npm)
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plotly/plotly.py/archive/v${pkgver}.tar.gz")
options=(!strip) # strip isn't useful for python files and takes forever
sha256sums=('7c9a4425799dcc80c9baa1224b119906964ce6b3edeefc9175f27018a2de764c')

build() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py build
}

package() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
