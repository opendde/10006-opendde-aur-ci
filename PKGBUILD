pkgname=python-gdal
pkgver=2.2.3
pkgrel=1
pkgdesc='Geospatial Data Abstraction Library for Python 3'
url='https://pypi.python.org/pypi/GDAL/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'gdal')
source=("https://pypi.python.org/packages/fb/62/e4c597c0b52bf0ddf7073c57e998c96cd98a8281a2cf40a8c036b34e4ec0/GDAL-2.2.3.tar.gz")
sha256sums=('561a952394bc1d9291179a8677eb6f5dafbf3e361c851f3dbb59db604c9b8e8b')

package() {
  cd GDAL-$pkgver
  python setup.py install --root="$pkgdir"
}
