# Maintainer: fthiery fthiery@gmail.com

pkgname=keeweb-desktop
pkgver=0.5.1
pkgrel=1
pkgdesc="This webapp is a desktop password manager compatible with KeePass databases."
arch=('x86_64')
url="https://github.com/antelle/keeweb"
license=('MIT')
source=(
    "${url}/releases/download/v${pkgver}/KeeWeb.linux.x64.zip"
    "keeweb.desktop"
    "keeweb-desktop.install"
)
sha256sums=(
    '4bed2321519ffbf9a35d1abe98cc7e3b4ea4c477fbb8a6ae2f2d4d8ccc040d46'
    '214496b02a0833098789514e3af0a65a4c94041448b5503579726c060b1c2d26'
    '78c88e74b4e951d52f328656c6b12dbb1da5a73019a9f2d230be8d0cdfdcfda8'
)
install=${pkgname}.install

package(){
    mkdir -p "${pkgdir}"/opt/${pkgname}
    cp --preserve=mode -r * "${pkgdir}"/opt/${pkgname}
    rm ${pkgdir}/opt/${pkgname}/KeeWeb.linux.x64.zip

    for res in 128x128; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        install -Dm755 "${pkgdir}/opt/${pkgname}/resources/app/icon.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/keeweb.png"
    done

    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "keeweb.desktop" "${pkgdir}/usr/share/applications/keeweb.desktop"

    mkdir -p "${pkgdir}"/usr/bin
    echo -e "#!/bin/sh\n/opt/${pkgname}/KeeWeb" > ${pkgdir}/usr/bin/KeeWeb
    chmod 755 ${pkgdir}/usr/bin/KeeWeb
}
