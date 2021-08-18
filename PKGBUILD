# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-nebulous-git
pkgver=r38.b15c938
pkgrel=1
pkgdesc="Minimalist collection of colorschemes"
arch=('any')
url="https://github.com/yagua/nebulous.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5')
optdepends=('tree-sitter')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=nebulous.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find colors lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
