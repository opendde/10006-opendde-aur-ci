#Automatically generated by pip2arch on 2015-06-01

pkgname=python2-treq
pkgver=15.0.0
pkgrel=1
pkgdesc="A requests-like API built on top of twisted.web's Agent"
url="http://github.com/dreid/treq"
depends=('python2' )
makedepends=('python2' )
license=('MIT/X')
arch=('any')
source=(https://pypi.python.org/packages/source/t/treq/treq-$pkgver.tar.gz)
md5sums=('76e33f6cfd997a7387f201c2d048b3ad')

build() {
    cd $srcdir/treq-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/treq-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
