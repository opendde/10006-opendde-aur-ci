# Maintainer: Ákos Uzonyi <uzonyi.akos@gmail.com>
pkgname=circuit-simulator
pkgver=1.6
pkgrel=2
pkgdesc="Electronic circuit simulator written by Paul Falstad"
arch=("any")
url="http://www.falstad.com/circuit-java"
license=("GPL")
depends=("java-runtime>=6" "hicolor-icon-theme" "bash")
makedepends=("unzip" "imagemagick")
source=("http://www.falstad.com/circuit-java/circuit.zip" "circuit-simulator" "circuit.desktop")
md5sums=("392f5956d1153755949b167842ccd7cc"
         "bd735bd306f677ee117e07784bec74e1"
	     "46ff1375643354a241c6c67fba7f08e5"
)

package() {
	cd "$srcdir"
	
	OPT_DIR="$pkgdir/opt/$pkgname"
	mkdir -pm 755 "$OPT_DIR"
	unzip circuit.zip -d "$OPT_DIR"
	chmod -R 644 "$OPT_DIR"
	chmod -R +X "$OPT_DIR"
	
	install -D -m755 "${srcdir}/circuit-simulator" "${pkgdir}/usr/bin/circuit-simulator"
	install -D -m644 "${srcdir}/circuit.desktop" "${pkgdir}/usr/share/applications/circuit.desktop"
	
	mkdir -pm 755 "${pkgdir}/usr/share/icons/hicolor/16x16/apps"
	convert "${OPT_DIR}/favicon.ico" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/circuit.png"
}
