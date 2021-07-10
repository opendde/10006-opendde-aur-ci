# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=clocker
pkgver=1.20.4
pkgrel=1
pkgdesc='Tracks project hours'
arch=('x86_64' 'i686' 'arm' 'armv6' 'armv7h' 'aarch64')
url="https://github.com/substack/clocker"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('bbf0df9fa665fec4afbe610a6e7122a1310f2e7a99f7c35c469b68de76b67c12')

package() {
	export NODE_ENV=production
	npm install -g --build-from-source --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	npm prune --production
	install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"

	### cleanup ###
	cd "$pkgdir/usr/lib/node_modules/$pkgname/"
	rm LICENSE README.md
	rm -rf node_modules/leveldown/prebuilds/deps
	find node_modules -type f \( -name '*.o' -or -name '*.o.d' \) -delete
	# find node_modules/leveldown/deps -type f -delete
	chown -R root:root "$pkgdir/"
}
