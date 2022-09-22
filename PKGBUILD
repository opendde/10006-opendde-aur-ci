# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lsp_signature
pkgver=0.2.0
pkgrel=2
pkgdesc="Neovim plugin for showing LSP signature hints"
arch=('any')
url="https://github.com/ray-x/lsp_signature.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim')
checkdepends=('neovim-plenary')
provides=('neovim-lsp-signature')
install=lsp_signature.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f8583779be55ed09c851e2d2d435373c4125a04bd1c98ed7a73f6bb50487ecc9')

prepare() {
	cd "lsp_signature.nvim-$pkgver"
	## do not run packadd
	sed -i '158d' tests/signature_spec.lua
}

check() {
	cd "lsp_signature.nvim-$pkgver"
	make test
}

package() {
	cd "lsp_signature.nvim-$pkgver"
	install -Dm644 lua/lsp_signature/*.lua -t "$pkgdir/usr/share/nvim/runtime/lua/lsp_signature/"
	install -Dm644 doc/lsp_signature.txt -t "$pkgdir/usr/share/nvim/runtime/doc/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
