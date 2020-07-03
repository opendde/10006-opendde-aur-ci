# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=responsively-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A modified browser that helps in responsive web development"
arch=('x86_64')
url='https://responsively.app'
license=('AGPL3')
provides=('responsively')
depends=('zlib')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/manojVivek/responsively-app/releases/download/v${pkgver}/ResponsivelyApp-${pkgver}.AppImage")
sha256sums=('27fd59366043d5e86aa0350ce880669f5dbb510fb77fc099dc7dd4db53109275')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/responsively-app.png "${pkgdir}/usr/share/pixmaps/responsively.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Responsively" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Development;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage"
  ln -s /opt/${pkgname%-bin}/${pkgname%-bin}.AppImage "${pkgdir}/usr/bin/responsively"
}