# Maintainer: sukanka <su975853527 [AT] gmail.com>
pkgname=clash-for-windows-electron-zh
_pkgname=${pkgname%-bin}
pkgver=0.20.8
pkgrel=1
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron. Using system clash and electron"
arch=("x86_64" "aarch64")
license=('unknown')
url="https://github.com/Fndroid/clash_for_windows_pkg"
install=clash-for-windows-bin.install
provides=('clash-for-windows' ${_pkgname})
conflicts=('clash-for-windows' 'clash-for-windows-bin')
depends=('electron'
'clash-geoip'
)
optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
    'clash-premium-bin>=2022.04.01: clash core'
    'clash-meta: clash core'
)
makedepends=('asar' 'npm')
source_x86_64=("${pkgname}-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-x64-linux.tar.gz")
source=(
    "clash-for-windows.desktop"
    "cfw"
    "cfw-start-pre.sh"
    "clash-core-service@.service"
    "https://github.com/ender-zhao/Clash-for-Windows_Chinese/releases/download/CFW-V${pkgver}_CN/app.asar"
    )
sha256sums=('9a84b05b718913d3d1fbe462a2da671abff2cb94bb2ded75a3af12204cebe32f'
            'db2e160e5d5cf82ed69d0926ac51c0eccb9efc541f89be3bb467d85be509f735'
            '4bea2fe6e8580a4316451ca5c8b921bd908422d839f8bd9ceaddd709f9178153'
            'd55c2f4088505116a5bad6d09f5ebe232e7c6a269ea6bf46daada02bc3a9f961'
            '5111e230e29a2ea6693409661576d81a07a41a8e1c58b059316901e5ac76fd94')
sha256sums_x86_64=('e2156894e95a9db77f2dc6bd6875b37bb37602f7cf0c39eafa1aa2ffd60a0660')

_parch=$(echo ${arch} | sed "s/x86_64/x64/;s/aarch64/arm64/")
build() {
    cd $srcdir
    sed -i "s/pkgver/${pkgver}/" clash-for-windows.desktop
    cp app.asar "Clash for Windows-${pkgver}-${_parch}-linux"/resources/
    cd "Clash for Windows-${pkgver}-${_parch}-linux"/resources/
    
    asar e app.asar apps

    # fix for autostart and system electron
    cd apps
    sed -i 's|r=n\[1\],|r="cfw\\nIcon=clash\\n",|g' dist/electron/renderer.js
    # force local mode
     sed -i 's|200===a.status|true|g' dist/electron/renderer.js
    sed -i 's|"electron-log": "^4.1.0",|"electron-log": "^4.4.6",|g' package.json

    export HOME=$srcdir
    npm install
    cd ..
    asar p apps app.asar
}

package() {
    cd $srcdir

    install -Dm755 cfw -t ${pkgdir}/usr/bin
    install -Dm644 "clash-for-windows.desktop" -t ${pkgdir}/usr/share/applications
    install -Dm644 "clash-core-service@.service" -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm755 cfw-start-pre.sh -t ${pkgdir}/opt/clash-for-windows

    cd "Clash for Windows-${pkgver}-${_parch}-linux"
    install -Dm644 resources/app.asar -t ${pkgdir}/opt/clash-for-windows/

    cp -pvr resources/static ${pkgdir}/opt/clash-for-windows/

    cd resources/apps/dist/electron/static/imgs
    install -Dm644 logo.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/clash.png

    cd ${pkgdir}/opt/clash-for-windows/static/files
    rm -rf linux/{common,${_parch}/clash-linux} default/Country.mmdb
    ln -s /usr/bin/clash linux/${_parch}/clash-linux
    ln -s /etc/clash/Country.mmdb default/Country.mmdb
}
