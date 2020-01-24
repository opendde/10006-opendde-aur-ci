_pkgname=coretime
pkgname=${_pkgname}-git
pkgver=v2.8.0.r3.98d1c25
pkgrel=1
pkgdesc="A time related task manager from the CoreApps family."
arch=('i686' 'x86_64')
url="https://gitlab.com/cubocore"
license=('GPL3')
depends=('libcprime-git' 'qt5-multimedia')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('coreapps-git')
source=("git+https://gitlab.com/cubocore/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
	qmake-qt5 ${_pkgname}.pro
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT=${pkgdir} install
}
