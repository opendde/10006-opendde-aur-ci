# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-jsonrpc
pkgver=0.7.11
pkgrel=1
pkgdesc="Simple to use Python JSONRPC-Library"
arch=('any')
depends=('python2' 'python2-bunch')
makedepends=('python2-setuptools')
url="https://github.com/gerold-penz/python-jsonrpc"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('04c0c1631fc5162736549e2a6da3966c')
sha256sums=('010fcdc24bc7bcfd27900a1d85f801eb9f3b1bf1803707c2eece059e3c6b28f3')
provides=('pyjsonrpc' 'python2-pyjsonrpc' 'python2-python-jsonrpc')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
