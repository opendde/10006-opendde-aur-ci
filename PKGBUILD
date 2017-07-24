# Maintainer: Dan Printzell <arch@vild.io>

pkgname=('dscanner')
pkgver=0.4.0
pkgrel=1
pkgdesc="Swiss-army knife for D source code"
arch=('i686' 'x86_64')
url="https://github.com/dlang-community/D-Scanner"
license=("BSL")
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')
provides=('dscanner')
conflicts=('dscanner')

source=(
	"git+https://github.com/dlang-community/D-Scanner#tag=v${pkgver}"
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd "$srcdir/D-Scanner"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/D-Scanner"
	make
}

package() {
	# binaries
	install -Dm755 "$srcdir/D-Scanner/bin/dscanner" "$pkgdir/usr/bin/dscanner"

	# license
	install -Dm644 "$srcdir/D-Scanner/LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
