# Maintainer Jonne Haß <me@jhass.eu>
pkgname=workflowy
pkgver=1.1.16
pkgrel=1
pkgdesc="Desktop app for workflowy.com, a note taking tool based on lists"
arch=('x86_64')
url="https://workflowy.com"
license=('custom')
depends=('fuse2')
_filename="WorkFlowy-$pkgver-x86_64.AppImage"
options=('!strip')
source=("https://github.com/workflowy/desktop/releases/download/v$pkgver/$_filename")

prepare() {
  cd "$srcdir"
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env DESKTOPINTEGRATION=0 /opt/$_filename|" squashfs-root/workflowy.desktop
}

package() {
  cd "$srcdir/"
  install -Dm755 $_filename "$pkgdir/opt/$_filename"
  install -Dm644 squashfs-root/workflowy.desktop "$pkgdir/usr/share/applications/workflowy.desktop"
  install -dm755 "$pkgdir/usr/share/icons/hicolor"
  cp -av squashfs-root/usr/share/icons/hicolor/* "$pkgdir/usr/share/icons/hicolor/"
  chmod -R a+rX "$pkgdir/usr/share/icons/hicolor"
}
sha256sums=('efa78daae8513b42eb04ce88fe3fced832145893efaff5fb05badbd20ab9af5c')
