# Maintainer: Philipp A. <flying-sheep@web.de>
_name=resvg
pkgname=$_name-cairo
pkgver=0.20.0
pkgrel=1
pkgdesc='SVG rendering library and CLI (Linked against cairo)'
arch=(i686 x86_64)
url="https://github.com/RazrFalcon/$_name"
license=(MPL2)
provides=(resvg)
conflicts=(resvg)
depends=(gdk-pixbuf2 cairo pango)
makedepends=(cargo clang)
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b85b46e1a420c3c0b1a68187615d38d32dccad9cc86dfab114df3645912188c7')

build() {
	cd "$_name-$pkgver"
	for dir in usvg c-api .; do
	(
		msg2 "Building $dir"
		cd "$dir"
		if grep -q cairo-backend Cargo.toml; then
			cargo build --release --features=cairo-backend
		else
			cargo build --release
		fi
	)
	done
	
	msg2 'Building docs'
	cargo doc --release --no-deps -p resvg-capi
}

package() {
	cd "$_name-$pkgver"
	
	for tool in resvg usvg; do
		install -Dm755 target/release/$tool "$pkgdir/usr/bin/$tool"
	done
	install -Dm755 target/release/libresvg.so "$pkgdir/usr/lib/libresvg.so"
	install -Dm644 c-api/resvg.h              "$pkgdir/usr/include/resvg.h"
	install -d "$pkgdir/usr/share/doc/resvg"
	cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}
