pkgname=whale
_pkgname=Whale
pkgver=2.4.0
pkgrel=1
pkgdesc="A Unofficial Trello app"
arch=('x86_64')
url="https://github.com/1000ch/whale"
license=('MIT')
depends=('tar')
source=("https://github.com/1000ch/whale/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb" )
md5sums=('79f3a1a81b6205b7de98cb27473cb752')

build() {
        tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/
}

package() {
        cd ${srcdir}/
        mkdir -p ${pkgdir}/opt/

        # binary & lib
        cp -r opt/${_pkgname}  ${pkgdir}/opt/${_pkgname}

        # doc 
        mkdir -p ${pkgdir}/usr/share/doc/
        cp -r usr/share/doc/${pkgname}  ${pkgdir}/usr/share/doc

        # icon
        install -Dm644 usr/share/icons/hicolor/0x0/apps/${pkgname}.png -t ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/

        # desktop entry 
        install -Dm644 usr/share/applications/${pkgname}.desktop -t ${pkgdir}/usr/share/applications
        sed -i "s/.*Icon.*/Icon=\/usr\/share\/icons\/hicolor\/1024x1024\/apps\/${pkgname}.png/"  ${pkgdir}/usr/share/applications/${pkgname}.desktop

        # Link to the binary
        mkdir -p ${pkgdir}/usr/bin
        ln -sf "${pkgdir}/opt/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        # SUID chrome-sandbox for Electron 5+
        chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox" || true
}
