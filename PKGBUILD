# Maintainer: nycex <nycex / cccp.org>
# Contributor: Tom Hetmer <tom.hetmer / outlook.cz>
# Contributor: Daniel Milde <daniel / milde.cz>

_pkgname=winbox
pkgname=${_pkgname}-xdg
pkgver=3.24
pkgrel=1
pkgdesc="Mikrotik RouterOS GUI Configurator (wine). xdg base directory specification compliant version"
url="http://www.mikrotik.com"
arch=('x86_64')
license=('custom')
depends=('wine' 'ttf-tahoma')
conflicts=('winbox')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.exe::https://download.mikrotik.com/winbox/${pkgver}/${_pkgname}64.exe"
        "${_pkgname}.desktop"
        "${_pkgname}.png"
        "${_pkgname}")
sha256sums=('793d1f6928bf688b5a56be025a3aef8fd927fe2be9e5b1dfbe6c00a1ebd32dea'
            '6e9ffe5ff24d286d2d719455dd52f6ddf8c5ed2ba0494c566a67555df37d5c19'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            '0684c39919f917ec15d6234d58c3abc112a55002a7551401f5fa00ebfd246229')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.exe" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.exe"
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm655 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm655 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

