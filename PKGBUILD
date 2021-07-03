# Maintainer: Leo <i@setuid0.dev>
_pkgname=google-re2
pkgname=python-re2
pkgver=0.2.20210601
pkgrel=1
epoch=
pkgdesc="RE2 Python bindings"
arch=('any')
url="https://github.com/google/re2"
license=('BSD')
groups=()
depends=('re2')
makedepends=('python-setuptools' 'pybind11')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('69c0df6e8c3c87d059595921f78968c24533d10e62d34e133d1ebe7c3809ea51')
validpgpkeys=()

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py test
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	find $pkgdir -type f -exec chmod 644 {} \;
	find $pkgdir -type d -exec chmod 755 {} \;
}
