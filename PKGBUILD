#Automatically generated by pip2arch on 2014-04-28

pkgname=python2-kitchen
pkgver=1.2.4
pkgrel=1
pkgdesc="Kitchen contains a cornucopia of useful code"
url="https://fedorahosted.org/kitchen"
depends=('python2' )
makedepends=('python2' 'python2-setuptools')
license=('LGPLv2+')
arch=('any')
source=("https://pypi.python.org/packages/source/k/kitchen/kitchen-$pkgver.tar.gz")
sha256sums=('38f73d844532dba7b8cce170e6eb032fc07d0d04a07670e1af754bd4c91dfb3d')

build() {
  cd "$srcdir/kitchen-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/kitchen-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
