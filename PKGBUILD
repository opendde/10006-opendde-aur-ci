# Maintainer: Yongchun Jiang <me at JSpringYC@gmail.com>
pkgname=clash-for-windows-chinese
pkgver=0.19.29
pkgrel=1
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron（Chinese version.）."
arch=("x86_64")
url="https://github.com/Fndroid/clash_for_windows_pkg"
_logo_url="https://raw.githubusercontent.com/Dreamacro/clash/master/docs/logo.png"
_parch=$(echo ${arch} | sed "s/x86_64/x64/")
install=clash-for-windows.install
license=('custom')

depends=('libxss' 'gtk3' 'p7zip')

optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
)

provides=('clash-for-windows')
conflicts=('clash-for-windows')

source=(
    "${pkgname}-${pkgver}-${arch}-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-${_parch}-linux.tar.gz"
    "${pkgname}-app-${pkgver}.7z::https://github.com/ender-zhao/Clash-for-Windows_Chinese/releases/download/CFW-V${pkgver}_CN/app.7z"
    "clash.png::${_logo_url}"
    "clash-for-windows-chinese.desktop"
    "cfw"
)
sha256sums=('202c3d6411b38c5fe53cea9361f4dac1c4dc88d1826cd9d647ed637a3651e9b4'
            'd39ec1483784046a572d593e35e27bcadfe64d64b17e38aa921bd297f867cde4'
            '0d48a2ea1ee05ad4579b6e6996889548fa8a61a5ff6c85a32f7622cddfcb5782'
            'f842f09d3b2ac2fa7e6b98159723c4f7605de0191779c61bc7b424ede58cd96c'
            '2451fc0eff3f48c48e4eb818d1e1ce62182737db19b95541cb13ec81183550c7')

build() {
    # generate .desktop file
    sed -i "s/pkgver/${pkgver}/" clash-for-windows-chinese.desktop
}

package() {
    cd "Clash for Windows-${pkgver}-${_parch}-linux"
    echo "packaging resource files as 644"
    find . -type f -not \( -name "cfw" -or -name "clash-linux" -or -name "clash-core-service" -or -name "chrome-sandbox" -or -name "*.sh" \) \
        -exec install -Dm 644 {} "${pkgdir}/opt/${pkgname}"/{} \;
    echo "packaging executable files as 755"
    find . -type f \( -name "cfw" -or -name "clash-linux" -or -name "clash-core-service" -or -name "chrome-sandbox" -or -name "*.sh" \) \
        -exec install -Dm 755 {} "${pkgdir}/opt/${pkgname}"/{} \;
    cd ../
    install -Dm 755 cfw ${pkgdir}/usr/bin/cfw
    install -Dm 644 clash.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/clash.png
    install -Dm 644 clash-for-windows-chinese.desktop ${pkgdir}/usr/share/applications/clash-for-windows-chinese.desktop
    cp "${srcdir}/app.asar" "${pkgdir}/opt/${pkgname}/resources/"
}
