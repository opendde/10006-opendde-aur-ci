# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-networkx-git
_name=networkx
pkgver=2.6rc1.r1.gc444024a5
pkgrel=1
pkgdesc="Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks."
arch=('any')
url="https://github.com/networkx/networkx"
license=('BSD')
depends=(
	'python-decorator'
	'python-matplotlib'
	'python-numpy'
	'python-pandas'
	'python-scipy'
)
makedepends=('git')
conflicts=('python-networkx')
provides=("python-networkx=$pkgver")
source=("git+$url#branch=main")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_name"
	git describe --long | sed 's/^networkx-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_name"
	python setup.py build
}

package() {
	cd "$srcdir/$_name"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
