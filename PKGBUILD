# Maintainer: Mateusz Galazyn <carbolymer@gmail.com>
pkgname=python-influxdb
pkgver=5.0.0
pkgrel=2
pkgdesc="Python client for InfluxDB"
arch=('any')
url="https://github.com/influxdata/influxdb-python/"
license=('MIT')
depends=('python' 'python-requests>=2.17.0' 'python-dateutil>=2.6.0' 'python-six>=1.10.0' 'python-pytz')
makedepends=('python-setuptools')
optdepends=('influxdb')
options=(!emptydirs)
source=("https://github.com/influxdata/influxdb-python/archive/v$pkgver.tar.gz")
sha512sums=('ed5cc71130daf19f95a482c4b33bbc563c29fe742b4c873391251112e6358f8cb0e3d1167b24ba0c108f6c57f11ba6aba76a6f6f89925d44309788d217811a0a')

package() {
  cd "$srcdir/influxdb-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
