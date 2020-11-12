# Maintainer: water_lift <0xWATERx0@gmail.com>
pkgname=defold
pkgver=1.2.175
pkgrel=1
epoch=
pkgdesc="Defold is a completely free to use game engine for development of desktop, mobile and web games."
arch=(x86_64)
url="https://defold.com/"
license=("custom")
groups=()
depends=("glu")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://d.defold.com/archive/editor-alpha/e41438cca6cc1550d4a0131b8fc3858c2a4097f1/editor-alpha/editor2/Defold-x86_64-linux.zip"
	"LICENSE"
	"Defold.desktop"
	"logo.zip")
noextract=()
md5sums=("2e797a11274850c6b37dd06677aab5cb"
	 "12ddd6bdaaf6397931608af50492f005"
	 "8be2aad566732d3845c4472ebcfdd049"
 	 "2e220c9bf4a7e2f5aa3b81cfd7b8c8fe")
validpgpkeys=()

package() {
	cd "$srcdir"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 Defold.desktop "$pkgdir/usr/share/applications/Defold.desktop"
	install -Dm644 "logo/64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/defold.png"
	install -Dm644 "logo/128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/defold.png"
	install -Dm644 "logo/150.png" "$pkgdir/usr/share/icons/hicolor/150x150/apps/defold.png"
	install -Dm644 "logo/310.png" "$pkgdir/usr/share/icons/hicolor/310x310/apps/defold.png"
	install -Dm644 "logo/1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/defold.png"
	mkdir -p "$pkgdir/opt/Defold"
	cp -r Defold "$pkgdir/opt"
}
