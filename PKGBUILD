# Maintainer: Tom Hetmer <tom.hetmer / outlook.cz>
# Maintainer: Daniel Milde <daniel / milde.cz>

pkgname=winbox
pkgver=3.32
pkgrel=2
pkgdesc="Mikrotik RouterOS GUI Configurator (wine)"
url="http://www.mikrotik.com"
arch=('x86_64')
license=('custom')
depends=('wine')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.exe::https://download.mikrotik.com/winbox/${pkgver}/${pkgname}64.exe"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
sha256sums=('d67e92155f1558bf5946c009c9b05c8336ca5ffc16f0621d02d741456cfbc0bd'
            '5b206007771bc84b5291180ca24c2538f0cd03f1e6738edddf58e57d66a13f8d'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            'e7d6a2ffc0eda07ac40db88d92629bf8b1e2fa9433f3b74b1eef3437c1d0f6c6')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.exe" "${pkgdir}/usr/share/${pkgname}/${pkgname}.exe"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
