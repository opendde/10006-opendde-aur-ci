pkgname=('python-ipcalc' 'python2-ipcalc')
pkgbase='python2-ipcalc'
pkgver='1.99.0'
pkgrel=2
pkgdesc='IP subnet calculator for Python.'
arch=('any')
url='https://github.com/tehmaze/ipcalc'
license=('custom')
depends=('python2')
source=("http://pypi.python.org/packages/source/i/ipcalc/ipcalc-${pkgver}.tar.gz")
sha1sums=('a9841397166cce456f02e0226c0b97cbbdaf300a')

package_python-ipcalc() {
  cd "$srcdir/ipcalc-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-ipcalc() {
  cd "$srcdir/ipcalc-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
