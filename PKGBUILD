pkgbase=python-voluptuous
pkgname=('python-voluptuous' 'python2-voluptuous')
pkgver=0.8.11
pkgrel=1
pkgdesc="Voluptuous is a Python data validation library"
arch=('any')
url='https://pypi.python.org/pypi/voluptuous'
license=('BSD')
source=(https://pypi.python.org/packages/source/v/voluptuous/voluptuous-$pkgver.tar.gz)
md5sums=('0fb3c9de961a4acfac1cad1009657751')
makedepends=('python2' 'python' 'python-setuptools' 'python2-setuptools' 'python2-pip' 'python-pip')

package_python-voluptuous() {
  depends=('python')

  cd $srcdir/voluptuous-$pkgver
  pip install . --root=$pkgdir
}

package_python2-voluptuous() {
  depends=('python2')

  cd $srcdir/voluptuous-$pkgver
  pip2 install . --root=$pkgdir
}
