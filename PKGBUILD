# Maintainer: Amael <nils.van-zuijlen@mailo.com>
pkgname=eqonomize-appimage
pkgver=1.3
pkgrel=1
arch=('any')
pkgdesc="Eqonomize! is a cross-platform personal accounting software, with focus on efficiency and ease of use for the small household economy."
url="http://eqonomize.github.io/"
licence=GPL3
depends=('qt5-base')
optdepends=('qt5-charts: charts in the statistics')
provides=('eqonomize')
conflicts=('eqonomize')
source=("https://github.com/Eqonomize/Eqonomize/releases/download/v1.3.0/Eqonomize-1.3.AppImage"
		"https://raw.githubusercontent.com/Eqonomize/Eqonomize/v1.3.0/data/eqonomize.desktop")
noextract=("${source[@]##*/}")
sha256sums=('a9d0682e641ed04db2c099592c53504239e0c14b610f1eb799199bd01356e834')

package() {
	mkdir -p "$pkgdir/opt/eqonomize"
	cp "Eqonomize-$pkgver.AppImage" "$pkgdir/opt/eqonomize/Eqonomize.AppImage"
	chmod +x "$pkgdir/opt/eqonomize/Eqonomize.AppImage"
	mkdir -p "$pkgdir/bin"
	ln -s "$pkgdir/opt/eqonomize/Eqonomize.AppImage" "$pkgdir/bin/eqonomize"

	mkdir -p "$pkgdir/usr/share/applications"
	cp "eqonomize.desktop" "$pkgdir/usr/share/applications"
}
