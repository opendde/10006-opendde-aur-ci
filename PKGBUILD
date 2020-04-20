# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=htmlhint
pkgver=0.11.0
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
sha256sums=('6328c221192cca750ade996950f323e8f19ab842964a3274d2dd08bcd2841763')

package() {
	npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
	rm -rf "$pkgdir"/usr/etc
	chmod -R go-w "$pkgdir"
	install -Dm0644 "$pkgdir"/usr/lib/node_modules/htmlhint/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
