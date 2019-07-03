# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="bamr"
pkgver=0.5
pkgrel=2
epoch=
pkgdesc="Simple GUI recording software"
arch=("x86_64")
url="https://gitlab.com/oktopod11/bamr"
license=("GPL3")
groups=()
depends=("gtk3" "gstreamer" "gst-plugins-base" "gst-plugins-good" "gst-plugins-rs")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("c65d01a8184c9f508b72a84dbe11f2f1182614ef3b8eb61ef0b2f4d252554919")

build() {
	cd "$srcdir/$pkgname"
	make FLAGS=-O3
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -vp "$pkgdir/usr/bin/"
	mkdir -vp "$pkgdir/usr/share/man/man1/"
	mkdir -vp "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	mkdir -vp "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
	mkdir -vp "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	mkdir -vp "$pkgdir/usr/share/applications/"

	cp -v bamr "$pkgdir/usr/bin/"
	cp -v bamr.man "$pkgdir/usr/share/man/man1/bamr.1"
	gzip -v "$pkgdir/usr/share/man/man1/bamr.1"
	cp -v icons/bamr.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bamr.svg"
	cp -v icons/bamr_32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/bamr.png"
	cp -v icons/bamr_48x48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/bamr.png"
	cp -v bamr.desktop "$pkgdir/usr/share/applications/"
}

