# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Claudio d'Angelis <claudiodangelis at gmail dot com>
pkgname=postman-bin
pkgver=9.4.1
pkgrel=1
pkgdesc="Build, test, and document your APIs faster"
provides=('postman')
conflicts=('postman')
arch=('x86_64')
url="https://www.getpostman.com"
options=(!strip)
license=('custom')
source=(
	"Postman-linux-x64-${pkgver}.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux64"
	"postman.desktop"
)
depends=(libxss nss gtk3)
sha256sums=('c93add08c4355f9f324de377b650d5e9f98ee66587c828687fd9573bd38cddf2'
            '74b2d8570658e207e31f729e7f4768952252383aee7c695218d077bd0ef13245')
package() {
	install -dm755 "${pkgdir}/opt/"
	cp -r "Postman" "${pkgdir}/opt/postman"
  	install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/postman/Postman" "${pkgdir}/usr/bin/postman"
    # Desktop file
    install -D -m644 "postman.desktop" \
        "${pkgdir}/usr/share/applications/postman.desktop"
    # Icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    ln -s "/opt/postman/app/resources/app/assets/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman.png"
}
