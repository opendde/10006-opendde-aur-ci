pkgname=python-orange
pkgver=3.25.1
pkgrel=1
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-chardet' 'python-docutils' 'python-pyqtgraph' 'python-xlrd' 'python-matplotlib' 'python-scikit-learn' 'python-psycopg2' 'python-joblib' 'python-keyrings-alt' 'python-bottleneck' 'python-anyqt' 'qt5-svg' 'python-pip' 'python-serverfiles' 'python-louvain' 'python-xlsxwriter' 'python-opentsne' 'python-networkx' 'python-requests' 'python-pandas' 'python-openpyxl' 'python-orange-widget-base' 'python-orange-canvas-core')
source=("https://github.com/biolab/orange3/archive/${pkgver}.tar.gz")
sha256sums=('cfd1b539398edbdeac4981774bd547cbadffd8609de92756536ab55ff3aadf4c')

build() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 distribute/orange-canvas.desktop "${pkgdir}"/usr/share/applications/orange-canvas.desktop
  install -Dm644 distribute/icon-256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/orange-canvas.png
}

