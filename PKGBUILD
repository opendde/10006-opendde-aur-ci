# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

_pkgname=LanguageClient-neovim
pkgname=languageclient-neovim
pkgver=0.1.160
pkgrel=1
pkgdesc="Language Server Protocol (LSP) support for Vim and NeoVim."
url="https://github.com/autozimu/LanguageClient-neovim"
license=('MIT')
arch=('x86_64')
makedepends=(
  'cargo'
  'git'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2f2e09ae19d750d3b35c5632369383b53f6cdd09c5238598a7c76bca94bc0150')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Install the license file
  install -D -m 644 \
    "LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  # Install the built executable to local bin/ directory to take advantage of
  # the iterative copying, below. `install` is used to ensure the correct
  # mode is set.
  install -D -m 755 \
    "target/release/${pkgname%-neovim}" \
    "bin/${pkgname%-neovim}"

  # Create runtime directories
  install -d -m 755 "${pkgdir}/usr/share/vim/vimfiles"
  install -d -m 755 "${pkgdir}/usr/share/nvim/runtime"

  # Install vimfiles from the project into the appropriate runtime directories
  for d in autoload bin doc plugin rplugin; do
    case $d in
      rplugin)
        # vim doesn't have "remote plugins", so we only need to move this into
        # neovim's runtime directory
        cp -r "$d" "${pkgdir}/usr/share/nvim/runtime"
        ;;
      *)
        cp -r "$d" "${pkgdir}/usr/share/vim/vimfiles"
        cp -r "$d" "${pkgdir}/usr/share/nvim/runtime"
    esac
  done
}
