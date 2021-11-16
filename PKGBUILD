# Maintainer: water_lift <0xWATERx0@gmail.com>
pkgname=defold
pkgver=1.2.189
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
source=("http://d.defold.com/archive/editor-alpha/794112e7e21be5d00f1cc70bb891b80ded986c6f/editor-alpha/editor2/Defold-x86_64-linux.zip"
	"http://d.defold.com/archive/stable/794112e7e21be5d00f1cc70bb891b80ded986c6f/engine/defoldsdk.zip"
	"http://d.defold.com/archive/stable/794112e7e21be5d00f1cc70bb891b80ded986c6f/bob/bob.jar"
	"Defold.desktop"
	"LICENSE"
	"logo.zip")
noextract=("bob.jar")
md5sums=("96e88c6da876ec2c4d08cd59b85c705e"
	"afce580f6a5f52423bf72282d9272835"
	"6d234620a527f3ee5471e6f6c9870568"
	"228c751d9720d1dfcbb2adbbd8f68914"
	"12ddd6bdaaf6397931608af50492f005"
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
	cp -r defoldsdk "$pkgdir/opt/Defold"
	mkdir -p "$pkgdir/usr/include/dmsdk"
	ln -s "$pkgdir/opt/Defold/defoldsdk/sdk/include/dmsdk" "$pkgdir/usr/include/dmsdk"
	install -Dm644 bob.jar "$pkgdir/opt/Defold"
}
