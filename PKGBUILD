# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=('lua-basexx' 'lua51-basexx' 'lua52-basexx' 'lua53-basexx')
pkgver=0.4.1
pkgrel=1
arch=('any')
url='https://github.com/aiq/basexx'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aiq/basexx/archive/v$pkgver.tar.gz")
sha256sums=('ff62b00446df1181a9cd20ba970c3c8493165d262142e10d069ee3de6337dfe6')

package_lua-basexx() {
	pkgdesc='A Lua library which provides base2(bitfield), base16(hex), base32(crockford/rfc), base64(rfc/url), base85(z85) decoding and encoding for Lua 5.4'

	cd "basexx-$pkgver"
	install -Dm644 lib/basexx.lua "$pkgdir/usr/share/lua/5.4/basexx.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-basexx() {
	pkgdesc='A Lua library which provides base2(bitfield), base16(hex), base32(crockford/rfc), base64(rfc/url), base85(z85) decoding and encoding for Lua 5.1'

	cd "basexx-$pkgver"
	install -Dm644 lib/basexx.lua "$pkgdir/usr/share/lua/5.1/basexx.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-basexx() {
	pkgdesc='A Lua library which provides base2(bitfield), base16(hex), base32(crockford/rfc), base64(rfc/url), base85(z85) decoding and encoding for Lua 5.2'

	cd "basexx-$pkgver"
	install -Dm644 lib/basexx.lua "$pkgdir/usr/share/lua/5.2/basexx.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-basexx() {
	pkgdesc='A Lua library which provides base2(bitfield), base16(hex), base32(crockford/rfc), base64(rfc/url), base85(z85) decoding and encoding for Lua 5.3'

	cd "basexx-$pkgver"
	install -Dm644 lib/basexx.lua "$pkgdir/usr/share/lua/5.3/basexx.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
