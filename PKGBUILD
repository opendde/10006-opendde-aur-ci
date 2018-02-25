# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: bjoern lindig <bjoern dot lindig at googlemail dot com>

pkgname=pure-gen
pkgver=0.21
pkgrel=1
pkgdesc="A C interface generator for Pure"
arch=("i686" "x86_64")
license=('custom')
url="https://agraef.github.io/pure-lang/"
depends=('pure')
makedepends=('ghc' 'ghc-static' 'ghc-pristine' 'cabal-install' 'alex' 'happy')
groups=(pure-complete pure-util)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('f048421e67eea7da2aa2ad63691cb8427ecd0c07')

build() {
	cd $srcdir/$pkgname-$pkgver
	export PATH=/usr/share/ghc-pristine/bin:$PATH
	make PUREC_FLAGS=-mcpu=generic maintainer-build
}

check() {
	cd $srcdir/$pkgname-$pkgver
	make check
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
