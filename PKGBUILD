# Maintainer: Joermungand <joermungand at gmail dot com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=('python2-pycups')
pkgver=1.9.74
pkgrel=1
arch=('x86_64')
url="http://cyberelk.net/tim/software/pycups/"
license=('GPL')
pkgdesc="Python 2 CUPS Bindings"
depends=('libcups' 'python2')
source=(${pkgname#*-}-${pkgver}.tar.gz::https://github.com/zdohnal/pycups/archive/${pkgver}.tar.gz)
sha256sums=('d5b5e4058757d1c090c85ed2ee7e5c2c1785976dc934a6144dbf425398304850')
validpgpkeys=('02EA6349CE58E1BCAA8514F57955128DA3A1ABD3'  # Tim Waugh
              '4629AFE960EC20BEC12E3104B7C20D079491EA63') # Tim Waugh <twaugh@redhat.com>

build() {
  cd $srcdir/${pkgname#*-}-${pkgver}
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#*-}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
