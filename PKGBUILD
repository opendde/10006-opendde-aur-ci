# Maintainer: Petr Mrázek <petr@mojang.com>
pkgname=minecraft-launcher
pkgver=887
pkgrel=1
pkgdesc="Official Minecraft Launcher"
arch=('x86_64')
url="https://mojang.com/"
license=('All rights reserved')
depends=('alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'atk' 'dbus' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'zlib' 'java-runtime' 'xorg-xrandr')
optdepends=('flite: narrator support')
conflicts=('minecraft-launcher-beta')
provides=('minecraft-launcher-beta')
source=(
https://launcher.mojang.com/download/linux/x86_64/minecraft-launcher_${pkgver}.tar.gz
minecraft-launcher.desktop
https://launcher.mojang.com/download/minecraft-launcher.svg
)
sha256sums=(
'a7d75ef47c8e940a56c8fad0c9a68f41df8d5df85df18377c53e3da5749c645c'
'677e2442a1ae83cc58d8d403666e508129e97dbed37fdfafdceac6101dc0dee7'
'35c2bcaeb09fa4b8864e9422fd66bf60847706f8b4400ec4a66ba6436b101f71'
)

build() {

  cd "$srcdir/minecraft-launcher"

}

package () {

  cd "$pkgdir"

  mkdir -p "opt"
  mkdir -p "usr/bin"

  install -Dm644 "$srcdir/minecraft-launcher.svg"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher.svg"

  install -Dm644 "$srcdir/minecraft-launcher.desktop"    "$pkgdir/usr/share/applications/minecraft-launcher.desktop"

  cp -Rv "$srcdir/minecraft-launcher" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/minecraft-launcher" "$pkgdir/usr/bin/$pkgname"

}
