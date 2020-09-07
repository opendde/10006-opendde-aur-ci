# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname="python2-bjoern"
pkgver=3.1.0
pkgrel=1
pkgdesc="A screamingly fast, ultra-lightweight WSGI server for Python 2, written in C."
url="https://github.com/jonashaag/bjoern"
license=("BSD")
arch=("i686" "x86_64")
depends=("libev" "python2")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/b/bjoern/bjoern-$pkgver.tar.gz")
md5sums=("9589b4a03f7acf80e0200cf1e5a3b324")

build(){
 cd "bjoern-$pkgver"
 python2 setup.py build
}

package(){
 cd "bjoern-$pkgver"
 python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
