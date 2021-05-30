# Maintainer: Plague-doctor <plague at privacyrequired dot com>

pkgname=xeoma-client-bin
pkgver=21.4.2
pkgrel=1
pkgdesc='Xeoma Client'
arch=('x86_64')
url='https://felenasoft.com/xeoma/en/'
license=('custom:xeoma')
_shortname=xeoma-client
_appfile=xeoma.app
_apppkg=$pkgname-$pkgver-$pkgrel.tgz
depends=('hicolor-icon-theme')
options=(!strip)
source=(
        "${_apppkg}::https://felenasoft.com/xeoma/downloads/latest/linux/xeoma_linux64.tgz"
        "xeoma-client.png"
        "xeoma-client.desktop"
        "LICENSE"
)
sha256sums=('86c0003273468807acc7accd4ab958e374d73a4744e4b3bb0e1dff954e708df8'
            'bd0ab0967b483b6d10fbeff18d7e1bd023ce477b8809a586d89741da34a0cffc'
            '1ae7f611c6261b8034974081e42bf2fdee3e5ba47afc7364e2ee8e9b5ef8910e'
            'c76a128f1662d5ca08693dd84e7da892942eaa3d61c0935188a9d32a5e755dfb')

package() {
    # Create Directories
    install -d "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 xeoma-client.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/xeoma-client.png"
    install -Dm644 xeoma-client.desktop "${pkgdir}/usr/share/applications/$_shortname.desktop"
    install -Dm755 "${srcdir}/$_appfile" "${pkgdir}/opt/${_shortname}/${_shortname}.app"

    # Symlink Xeoma
    ln -s "/opt/${_shortname}/${_shortname}.app" "${pkgdir}/usr/bin/${_shortname}"
}

