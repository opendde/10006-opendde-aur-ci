# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='imgsize'
pkgname="python2-$_projectname"
pkgver='2.1'
pkgrel='5'
pkgdesc='Pure Python image size library - python2 version'
arch=('any')
url="https://github.com/ojii/$_projectname"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a413cc368cac5f5cf9199038887e52ed1ece08f431885dd762dde2df56882f13')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python2 -m unittest discover
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
