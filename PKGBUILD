# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=tl
pkgbase=teal
pkgname=(teal "lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.13.2
pkgrel=4
pkgdesc='The compiler for Teal, a typed dialect of Lua'
arch=(any)
url=https://github.com/teal-language/$_rockname
license=(MIT)
_luadeps=(argparse
          filesystem)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a42c8dd1719933de027f8954b3edd4b255785d933f6ff183ae32bbf8adc7c6ae')

_package() {
	cd "$_rockname-$pkgver"
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	luarocks --lua-version $1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- "$_rockname-dev-1.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
	[[ -v 2 ]] &&
		rm -rf "$pkgdir/usr/"{lib,share} ||
		rm -rf "$pkgdir/usr/bin"
}

package_teal() {
	depends+=(lua lua-tl)
	optdepends+=('cyan: The Teal build system and project manager')
	provides+=($_rockname)
	_package 5.4 bin
}

package_lua-tl() {
	_package 5.4
}

package_lua53-tl() {
	_package 5.3
}

package_lua52-tl() {
	_luadeps+=(compat53)
	_package 5.2
}

package_lua51-tl() {
	_luadeps+=(compat53)
	_package 5.1
}
