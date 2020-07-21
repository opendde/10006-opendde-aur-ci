# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=owrx_connector-git
pkgver=r69.53b2e02
pkgrel=1
pkgdesc="Connectors used by OpenWebRX to interface with SDR hardware."
arch=('x86_64')
url="https://github.com/jketterl/owrx_connector"
license=('GPL3')
makedepends=('git' 'cmake')
provides=('owrx_connector')
source=("$pkgname"::'git://github.com/jketterl/owrx_connector.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	# use git tag or fall back to number of revisions
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	make -C build
}

check() {
	cd "$srcdir/$pkgname"
	make -k check
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
