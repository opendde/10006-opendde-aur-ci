# Maintainer: Stick <stick@stma.is>

_pkg=python-geventhttpclient-wheels
pkgname="$_pkg-git"
pkgver=1.3.1dev2.r0.g4d83606
pkgrel=4
pkgdesc="A high performance, concurrent http client library for python with gevent"
arch=('x86_64')
url='https://github.com/locustio/geventhttpclient'
license=('MIT')
depends=('python-certifi')
makedepends=('git'
             'python-setuptools')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname" || exit
	local _ver
	_ver="$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
	printf '%s\n' "${_ver#v}"
}

build() {
	cd "$pkgname" || exit
    python setup.py build
}

package() {
	cd "$pkgname" || exit
    python setup.py install --skip-build --root="$pkgdir"/ --optimize=1
}
