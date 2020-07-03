# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="netctl-tray-auto"
pkgver=0.2.1
pkgrel=2
pkgdesc="A lightweight netctl tray app with notifications (netctl-auto)"
arch=('x86_64')
url="https://github.com/PonasKovas/netctl-tray"
license=('MIT')
makedepends=('rustup'
			 'cmake')
depends=('qt5-base'
     	 'polkit')
conflicts=("netctl-tray")
source=("netctl-tray-${pkgver}.tar.gz::https://github.com/PonasKovas/netctl-tray/archive/${pkgver}.tar.gz")
md5sums=('9d191cd2ab8359603786fc32b5b45d87')

build () {
  cd "$srcdir/netctl-tray-$pkgver"
  rustup toolchain install nightly
  rustup update
  RUSTUP_TOOLCHAIN=nightly \
    cargo +nightly build --release --locked --features "auto"
}

package() {
  cd "$srcdir/netctl-tray-$pkgver"
  install -Dm755 target/release/netctl-tray "${pkgdir}/usr/bin/netctl-tray-auto"
  install -d "${pkgdir}/usr/share/netctl-tray/"
  install -Dm644 assets/* "${pkgdir}/usr/share/netctl-tray/"
  install -dm0750 "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -Dm0644 scripts/netctl-tray.rules "${pkgdir}/usr/share/polkit-1/rules.d/netctltray.rules"
}