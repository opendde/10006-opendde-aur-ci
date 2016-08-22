# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=htmlhint
pkgver=0.9.12
pkgrel=1
pkgdesc="Static Code Analysis Tool for HTML, you can use it with IDE or in build system."
arch=(any)
url="http://htmlhint.com/"
license=('MIT')
provides=('nodejs-htmlhint')
replaces=('nodejs-htmlhint')
conflicts=('nodejs-htmlhint')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('54c2c05282bd4b406cad143be1c8c4494c3b27643ddaa78610270aada4ff2006')

package() {
	npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
	rm -rf "$pkgdir"/usr/etc
	chmod -R go-w "$pkgdir"
	install -Dm0644 "$pkgdir"/usr/lib/node_modules/htmlhint/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
