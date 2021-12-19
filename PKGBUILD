# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=neovim-nerdcommenter
pkgver=2.6.0
pkgrel=1
pkgdesc='A Neovim plugin that allows for easy commenting of code for many filetypes'
url='https://github.com/scrooloose/nerdcommenter'
arch=('any')
license=('custom')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/scrooloose/nerdcommenter/archive/${pkgver}.tar.gz
        LICENSE)
sha512sums=('e5b576812351955641011ceb1c8af0e85a2f4be3db8b8bd3e8da05aff6d3beba8e0dfcbd3c78cf6833a0f4aaf07fd87cb05151fdd5f341037b4393590134023b'
            'fb6575315a22516e29ad414c8e0c9074e0e18a5361ce746524d938e0bf329f7b742b66dc43cfba138f69534d747507e2983b34149d7c66bd4ae2e1b435e37034')

package() {
  cd ${pkgname#neovim-}-${pkgver}
  _installpath="${pkgdir}/usr/share/nvim/runtime"
  install -Dm 644 doc/nerdcommenter.txt "${_installpath}/doc/nerdcommenter.txt"
  install -Dm 644 plugin/nerdcommenter.vim "${_installpath}/plugin/nerdcommenter.vim"
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
