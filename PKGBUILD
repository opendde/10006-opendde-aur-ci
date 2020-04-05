pkgname=kisslicer2
pkgver=1.6.2
pkgrel=3
pkgdesc="KISSlicer is a fast, easy-to-use, cross-platform program that takes 3D files (STL) and generates path information (G-code) for a 3D Printer.  The FREE version has all the features needed for the hobbyist who uses a single-head machine. Alpha version of V2"
arch=('i686' 'x86_64')
url="http://www.kisslicer.com/index.html"
license=('custom')
depends=(
	'libx11'
	'libgl'
)

conflicts=('kisslicer2')
provides=('kisslicer2')

# Sources
source=(
	"$pkgname.desktop"
	"$pkgname.sh"
	"$pkgname.png"
)
source_i686=('https://www.dropbox.com/sh/78y5ec24yx1ycbk/AAD0c1pyxFRMtSe8CLZxqEqYa/KISSlicer_Linux32_v2_alpha_1.6.2.zip')
source_x86_64=('https://www.dropbox.com/sh/78y5ec24yx1ycbk/AACN90y_A2vWZFCj8VZwRl1Oa/KISSlicer_Linux64_v2_alpha_1.6.2.zip')
# Checksums
sha256sums=('dcc2f0c110fc71e35a6a0e8aad8e375bfd4eb09db309fafa517b2857d600b6c6'
            '9f6bbb2357f2f81cfeb86f8f114b4e529c9f9f52a551fc5bca16a679ce60245b'
	    '17ec56ab667fc601b5282c8093e795cc65c6c73df25fdafd8ddd96436ea24589'
	   )
sha256sums_i686=('6766e9c4d1f73f4a19a8bc53f58750c7323ae0fd354a5433150d3bfe9954c2f6')
sha256sums_x86_64=('703f8db8518ab68b02184d9a5ee3e07b799a29313a8953a69e9186d93f796cad')

package() {

	cd "$srcdir/"

	# Program
	install -Dm755 "$srcdir/KISSlicer" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname.sh"

	# Desktop launcher
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
