pkgname=neovim-lspconfig
pkgver=9661d26
pkgrel=1
pkgdesc='Quickstart configurations for the Nvim LSP client.'
arch=('any')
url=https://github.com/neovim/nvim-lspconfig
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'lua')
makedepends=('git')
optdepends=('neovim-plug: for plugin manager')
source=("git+${url}")
sha256sums=('SKIP')
package(){
    cd "${srcdir}/nvim-lspconfig"
    mkdir -p "${pkgdir}/usr/share/nvim/runtime"
    install -Dm644 "plugin/lspconfig.vim" "${pkgdir}/usr/share/nvim/runtime/plugin/lspconfig.vim"
    cp -a lua "${pkgdir}/usr/share/nvim/runtime/"
}
pkgver(){
    cd "${srcdir}/nvim-lspconfig"
    git rev-parse --short HEAD
}
