# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clipto-bin
pkgver=5.1.2
pkgrel=2
pkgdesc="Effortless, super fast and flexible notes taking app and clipboard manager."
arch=('x86_64')
url="https://clipto.pro"
license=('custom')
depends=('electron13')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}.pro")
replaces=("${pkgname%-bin}.pro")
source=("https://github.com/clipto-pro/Desktop/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.AppImage"
        "${pkgname%-bin}")
sha256sums=('a89aab8504bbe55a581bac943ef9461fb95fb403356a5021cfd5756e6da698f4'
            '992432bb07bdc6f3ac2551d7ec923a59bd649141c458112a969f4994dea2ecf1')

prepare() {
  chmod +x "${pkgname%-bin}-$pkgver.AppImage"
  ./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

  sed -i 's|Exec=AppRun|Exec=clipto|g' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
  cd "$srcdir/squashfs-root"
  find {locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

  install -d "$pkgdir/usr/lib/${pkgname%-bin}"
  cp -r resources "$pkgdir/usr/lib/${pkgname%-bin}"

  install -Dm755 "$srcdir/${pkgname%-bin}" -t "$pkgdir/usr/bin"

  install -Dm644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"

  install -d "$pkgdir/usr/share/icons"
  cp -r usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}
