# Maintainer: Barnaby Gray <barnaby@pickle.me.uk>
pkgname=cli53
pkgver=0.8.2
pkgrel=1
pkgdesc="Command line tool for Amazon Route 53"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
makedepends=('go>=1.5' 'make')
source=("https://github.com/barnybug/cli53/archive/$pkgver.tar.gz")
sha256sums=('0a9999f3e40f510d6d6faa01b64cefcd5a3ddeca1f785a25ede568f440d100bf')

build() {
    export GOPATH="$srcdir"
    rm -rf "$srcdir/src/github.com/barnybug/cli53"
    mkdir -p "$srcdir/src/github.com/barnybug"
    ln -s "$srcdir/$pkgname-$pkgver" "$srcdir/src/github.com/barnybug/cli53"
    cd "$srcdir/src/github.com/barnybug/cli53"
    make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -DT "cli53" "$pkgdir/usr/bin/cli53"
}
