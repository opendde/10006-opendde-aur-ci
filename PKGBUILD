# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gx52
pkgver=0.7.3
pkgrel=1
pkgdesc="A GTK application designed to provide control for the LEDs and MFD of Logitech X52 and X52 Pro H.O.T.A.S."
arch=('any')
url="https://gitlab.com/leinardi/gx52"
license=('GPL3')
depends=('gobject-introspection' 'libappindicator-gtk3' 'python' 'python-evdev' 'python-gobject' 'python-injector' 'python-peewee' 'python-pyudev' 'python-pyusb' 'python-requests' 'python-rx' 'python-xdg')
makedepends=('meson' 'appstream-glib' 'libudev0' 'libusb')
provides=()
conflicts=()
install="$pkgname.install"
source=("https://gitlab.com/leinardi/gx52/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        '60-gx52.rules')
sha256sums=('07439c2b55c9f6ab33f014a32cc7fbd6dfcbf4ff71f314b1a4cb9f8210416b00'
            '8239c7529f939f12455a3db5c000e76df9bb77c84f4ed9092ae731c5a1b3ab90')

build() {
	if [[ -d "$srcdir/build" ]]; then
		rm -rf "$srcdir/build"
	fi
	meson --prefix /usr --buildtype=plain "$pkgname-$pkgver" build
	ninja -C build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 "$srcdir/60-gx52.rules" "$pkgdir/usr/lib/udev/rules.d/60-gx52.rules"
}
