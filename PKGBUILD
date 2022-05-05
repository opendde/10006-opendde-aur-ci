# Maintainer: Bruno Ancona <bruno at powerball253 dot com>

pkgname=eternalmodmanager
pkgver=2.0.0
pkgrel=1
pkgdesc='Cross-platform mod manager for DOOM Eternal.'
arch=('x86_64')
url='https://github.com/PowerBall253/EternalModManager-Avalonia'
license=('MIT')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk')
source=("git+https://github.com/PowerBall253/EternalModManager-Avalonia.git#tag=v${pkgver}"
        eternalmodmanager)
sha256sums=('SKIP'
            'c2eaebd3cf4a5a57f0d81107b64e321b70bb2db38904b6caff58a39079f08a5e')

build() {
    cd "EternalModManager-Avalonia"

    # Build with dotnet
    dotnet publish -c Release -r linux-x64 --no-self-contained
}

package() {
    # Install app's files
    install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"

    cd "EternalModManager-Avalonia"
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "resources/${pkgname}.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/metainfo/" "resources/${pkgname}.appdata.xml"
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/" "resources/${pkgname}.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    find "EternalModManager/bin/Release/net6.0/linux-x64/publish/" -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/eternalmodmanager/" "{}" \;
}
