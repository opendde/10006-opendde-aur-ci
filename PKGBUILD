# Maintainer: Yuannan Lin <yuannan.pm.me>
# Contributor: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-plus-bin
pkgver=8.0.0
pkgrel=3
pkgdesc='TETR.IO desktop client with Plus: Custom skins, sounds, backgrounds, and more!'
arch=('x86_64')
license=('custom')
url='https://gitlab.com/UniQMG/tetrio-plus'
depends=('libxss')
conflicts=('tetrio-desktop')
source=("$pkgname-$pkgver::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.deb"
        "tetrio-plus_0.23.7_app.asar.zip::https://gitlab.com/UniQMG/tetrio-plus/uploads/e51f2fd7a1370bf4ceeecd371204c2e1/tetrio-plus_0.23.7_app.asar.zip"
        MIT
        LICENSE) # https://tetr.io/about/terms/
sha256sums=('ae07110f88692e1485f7ef1d3ab5eff95774746631b17833e28cc09ba1a38bda'
            '34b8477a0388db80c545bd752a835f79016cba7380f61b43835d68934951d40e'
            'dd0322404982ad4e880b219cb39ffdb47ab44ed41fa89c3949657bf6d57dc6ed'
            '5e721783706e2018878ca127ec6ed5d6a1298ee9cc6a853329e25fafe45265f9')

package() {
    cd "$srcdir"

    tar -xf data.tar.xz -C "$pkgdir"

    rm -rf "$pkgdir/opt/TETR.IO/resources/app.asar"

    unzip tetrio-plus_0.23.7_app.asar.zip -d "$pkgdir/opt/TETR.IO/resources"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/TETR.IO/tetrio-desktop" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 MIT "$pkgdir/usr/share/licenses/$pkgname/MIT"

    chmod -R go-w "$pkgdir"
}
