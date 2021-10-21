# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lsp_signature
pkgver=0.1.1
pkgrel=1
pkgdesc="Neovim plugin for showing LSP signature hints"
arch=('any')
url="https://github.com/ray-x/lsp_signature.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
checkdepends=('neovim-plenary')
provides=('neovim-lsp-signature')
install=lsp_signature.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d8b2fe44f82733538f33042c399fa6b896639a3c3604e423b7752fd86fd367b6')

check() {
	cd "lsp_signature.nvim-$pkgver"
	make test
}

package() {
	cd "lsp_signature.nvim-$pkgver"
	install -Dm 644 lua/lsp_signature.lua lua/lsp_signature_helper.lua \
		-t "$pkgdir/usr/share/nvim/runtime/lua/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
