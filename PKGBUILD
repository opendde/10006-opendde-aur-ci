# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Eric DeStefano <eric at ericdestefano dot com> 
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Boris Timofeev <mashin87@gmail.com>

pkgname=xroar
pkgver=1.0.9
pkgrel=1
pkgdesc='A Dragon and Tandy CoCo emulator'
arch=('x86_64')
license=('GPL3')
url="https://www.6809.org.uk/${pkgname}"
depends=('gtk2' 'sdl2' 'libgl' 'libsndfile' 'gtkglext')
makedepends=('gendesk')
install=${pkgname}.install
source=("${url}/dl/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png")
sha256sums=('1775ce612c7f90d9424897cab7574291299022ad86dcdaf0c29b415615165952'
            '0c6e5def77c6ca809cd69ae518512a89bff335147b44eb9ffc898d7302a17a59')

prepare() {
  cd "${pkgname}-${pkgver}"

  gendesk --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec "/usr/bin/${pkgname}" -n
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -dm644 "${pkgdir}/usr/share/${pkgname}/roms"
}
