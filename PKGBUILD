# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=python-meshio
pkgver=4.1.1
pkgrel=1
pkgdesc='Input/output for many mesh formats'
url='https://github.com/nschloe/meshio'
arch=('x86_64')
license=('MIT')
depends=('python-numpy')
makedepends=('python-pep517' 'python-pip')
optdepends=('python-netcdf4' 'python-h5py')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9bda1a8e39676300a23bf8c96b3d15410ecc85ff1e7fa26feb47bd6e8d123ebb')

build() {
  cd "meshio-$pkgver"
  python3 -m pep517.build --source .
}

package() {
  cd "meshio-$pkgver/dist"
  tar zxf "meshio-$pkgver.tar.gz"

  cd "meshio-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  _site=$(/usr/bin/python3 -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
  mkdir -p "$pkgdir/$_site/"
  cp -a meshio "$pkgdir/$_site/"
}

