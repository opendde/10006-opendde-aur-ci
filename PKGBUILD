# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=minetime-bin
pkgver=1.8.10
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('minetime')
source=("${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb"
        minetime)
b2sums=('7a1f1ba007dbbef3d90be937609cc62755fc11af3a65199186156d14ad30db2c4aacbbbabd0b8ff14ea7909c9b56e94a154edf844cb057e849a947b9ae13355f'
        '5d7b161312866c7093913428743bb8901c622cbd6d29e447bbd9ba70aea2972ceaf01263a285f78f8a39e6deee4f5d968ed96eee555e456eb3cd879c230ad02d')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/minetime "${pkgdir}"/usr/bin/minetime
}
