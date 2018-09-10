# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=htmlhint
pkgver=0.10.1
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
sha256sums=('408fb0037fcb33e7c7f5142b91389ae5a442f800714ee6018f0899b7c076bcda')

package() {
	npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
	rm -rf "$pkgdir"/usr/etc
	chmod -R go-w "$pkgdir"
	install -Dm0644 "$pkgdir"/usr/lib/node_modules/htmlhint/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
