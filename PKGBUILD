# Maintainer: Mateusz Galazyn <carbolymer@gmail.com>
pkgname=python-influxdb
pkgver=5.1.0
pkgrel=1
pkgdesc="Python client for InfluxDB"
arch=('any')
url="https://github.com/influxdata/influxdb-python/"
license=('MIT')
depends=('python' 'python-requests>=2.17.0' 'python-dateutil>=2.6.0' 'python-six>=1.10.0' 'python-pytz')
makedepends=('python-setuptools')
optdepends=('influxdb')
options=(!emptydirs)
source=("https://github.com/influxdata/influxdb-python/archive/v$pkgver.tar.gz")
sha512sums=('c279c230bb6b7ec69c0105f7ff9b7d3a7492f70eac03d1159bb62f521ab13a201a6bb2fc6f9c05edc0d99d7af1edfb4c7aafddeb8bea1462ba85777972a5e51d')

package() {
  cd "$srcdir/influxdb-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
