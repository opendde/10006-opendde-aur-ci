# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
# Co-Maintainer: Malstrond <malstrond@gmail.com>

pkgname=python-ipy
pkgver=1.00
pkgrel=0
pkgdesc="Class and tools for handling of IPv4 and IPv6 addresses and networks"
url="https://github.com/autocracy/python-ipy"
depends=('python')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/I/IPy/IPy-${pkgver}.tar.gz")
md5sums=('1a90c68174234672241a7e60c7ea0fb9')

build() {
    cd $srcdir/IPy-"$pkgver"
    python setup.py build
}

package() {
    cd $srcdir/IPy-"$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
