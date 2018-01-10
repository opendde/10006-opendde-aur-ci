# Maintainer: Mateusz Galazyn <carbolymer@gmail.com>
pkgname=python-influxdb
pkgver=5.0.0
pkgrel=1
pkgdesc="Python client for InfluxDB"
arch=('any')
url="https://github.com/influxdb/influxdb-python/"
license=('MIT')
depends=('python' 'python-requests>=2.17.0' 'python-dateutil>=2.6.0' 'python-six>=1.10.0' 'python-pytz')
makedepends=('python-setuptools')
optdepends=('influxdb')
options=(!emptydirs)
source=("https://github.com/influxdb/influxdb-python/archive/v$pkgver.tar.gz")
md5sums=('dfca3ef328621a3af83f42b3587cca01')

package() {
  cd "$srcdir/influxdb-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
