# Maintainer: Erik Sonnleitner <es at delta-xi dot net>

pkgname=morgen-bin
pkgver=2.4.4
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("https://download.todesktop.com/210203cqcj00tw1/morgen-${pkgver}.deb" morgen)
b2sums=('efbff2f1fd0d1f8d31f5268d8816b67fdf2ac53d0b51d3b9e4624daaa7e1ce1bb958410b5b5a5eca1a52ff6661c7fa94bd40fdde726fafa09f3f3df7d02c6e93'
        '22bb3535edf2320bcb51a81e8865b0775b129ff1fad8007c6c9f385f4cdc241b0d166dd8e51a700ad7a1bf72efdcb2d5a13bb3b39ec8aa2db0a71fc22dfeeb57')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

