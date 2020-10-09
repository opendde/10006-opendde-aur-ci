# Maintainer:
pkgname=python-i18n
pkgver=0.3.9
pkgrel=1
pkgdesc="Easy to use i18n library for Python"
arch=('any')
url="https://github.com/danhper/python-i18n"
license=('GPL')
depends=('python-yaml' 'python-coveralls')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('df97f3d2364bf3a7ebfbd6cbefe8e45483468e52a9e30b909c6078f5f471e4e8'
            'SKIP')
validpgpkeys=('1FEFF6D65203687AC33771CDA0B4CCFEBD33E18A') # Daniel Perez <tuvistavie@gmail.com>


build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
