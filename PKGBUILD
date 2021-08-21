# Maintainer Wings-Fantasy <1056947073@qq.com>

pkgname=badlion-client
pkgver=3.3.2
pkgrel=1
pkgdesc="A Minecraft client with anti-cheat protection"
url="https://client.badlion.net"
arch=('x86_64')
license=('custom')
provides=('BadlionClient')
source=('BadlionClient::https://client-updates-cdn77.badlion.net/BadlionClient'
'AppRun'
'BadlionClient.desktop')
sha256sums=('94a25c139dfd5e259bd35e3e2723a2d1a459b7519a25f701f199dfe4c5200b71'
            '7f18c33247cae96d268fd92c9e3a7e2d8ae9b3870f7d7f1b856186f95770e493'
            '3f5730cff2f8d1f0d36b14ebf6dd83ea25548fdc287c448716a3533e6f2d0885')

prepare() {
    chmod a+x BadlionClient
    ./BadlionClient --appimage-extract > /dev/null
    cd "squashfs-root"
    rm -rf "AppRun" "BadlionClient.desktop" "BadlionClient.png" ".DirIcon" "licenses" "LICENSE.electron.txt" "LICENSES.chromium.html"
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/licenses/BadlionClient"
    mkdir -p "$pkgdir/opt/BadlionClient"

    cd "${srcdir}"
    install -Dm644 BadlionClient.desktop "${pkgdir}/usr/share/applications/BadlionClient.desktop"
    install -Dm755 AppRun                "${pkgdir}/opt/BadlionClient/AppRun"

    cd "squashfs-root"
    mv license.txt                       "$pkgdir/usr/share/licenses/BadlionClient"
    cp -r usr/share                      "$pkgdir/usr"
    rm -rf usr/share
    cp -r *                              "$pkgdir/opt/BadlionClient"
    chmod -R go+rX "$pkgdir/usr/share/icons"
    cd "$pkgdir/opt/BadlionClient"
    chmod 755 cursors libs locales native-modules resources swiftshader usr usr/lib
}
