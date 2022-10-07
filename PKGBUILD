# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=monero-gui-static-bin
pkgver=0.18.1.2
pkgrel=1
pkgdesc="Monero: the secure, private, untraceable peer-to-peer currency"
arch=(x86_64)
url="https://www.getmonero.org"
license=('custom')
depends=(
	gcc-libs glib2 glibc libglvnd libx11 libxau libxcb libxdmcp libxkbcommon
	libxkbcommon-x11 pcre systemd-libs xcb-util xcb-util-image xcb-util-keysyms
	xcb-util-renderutil xcb-util-wm
)
provides=(monero monero-gui)
conflicts=(monero monero-gui)
source=("https://downloads.getmonero.org/gui/monero-gui-linux-x64-v${pkgver}.tar.bz2")
sha256sums=('1f9406044434eea770f1548a5bad5708f326f7295fb7c12d6c607ff783018a08')

package() {
	cd "monero-gui-v$pkgver"
	install -Dm755 monerod monero-wallet-gui extras/* -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
