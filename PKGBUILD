#Automatically generated by pip2arch on 2016-02-05

pkgname=python2-bsdiff4
pkgver=1.2.0
pkgrel=1
pkgdesc="binary diff and patch using the BSDIFF4-format"
url="https://github.com/ilanschnell/bsdiff4"
depends=('python2' )
makedepends=('python2' )
license=('BSD')
arch=('i686' 'x86_64')
source=(https://pypi.python.org/packages/source/b/bsdiff4/bsdiff4-$pkgver.tar.gz)
sha256sums=('3c2f7f5504f41a54d238b54b00b4544d0eb4276179edabf02b9d00415a03cc9d')

build() {
    cd $srcdir/bsdiff4-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/bsdiff4-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
