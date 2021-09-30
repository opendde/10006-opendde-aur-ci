# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=uxplay
_gitname=UxPlay
pkgver=1.37b
pkgrel=1
pkgdesc="AirPlay Unix mirroring server"
arch=('any')
url="https://github.com/FDH2/$_gitname"
license=('GPL3')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-libav' 'gstreamer-vaapi' 'avahi' 'libplist')
makedepends=('cmake')
conflicts=('uxplay')
provides=('uxplay')
source=("$_gitname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" "uxplay.desktop")
sha256sums=('6f66e35a8fa12215659a7ce687dc4e23319f3658de1176745206a25837146c33' '6b43385942508d8c360e8360be52719cbf3899868f3560b245731d866fb245a3')

build() {
  cd "$srcdir/$_gitname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DZOOMFIX=1
  cmake --build . --config Release
}

package() {
  # install binary
  install -Dm 755 "$srcdir/$_gitname-$pkgver/build/uxplay" "$pkgdir/usr/bin/uxplay"
  # install desktop file
  install -Dm 644 "$srcdir/uxplay.desktop" "$pkgdir/usr/share/applications/uxplay.desktop"

  printf "%b" "\e[1;33m==> WARNING: \e[0mIn order for UxPlay to work, the avahi systemd service has to be running. Enable it with: systemctl enable --now avahi-daemon\n"
}
