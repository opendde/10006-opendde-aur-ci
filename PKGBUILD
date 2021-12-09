
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>

pkgname=river-git
_pkgname=${pkgname%-*}
pkgver=0.1.0.r7.g93afdb3
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/riverwm/river'
license=('GPL3')
depends=(
	'mesa' 'wlroots' 'wayland' 'wayland-protocols' 'libxkbcommon'
	'libevdev' 'pixman' 'xorg-xwayland' 'polkit'
)
makedepends=('zig' 'git' 'scdoc')
provides=('river' 'riverctl' 'rivertile')
conflicts=('river' 'river-bin' 'river-noxwayland-git')
source=(
	"git+$url"
	'git+https://github.com/ifreund/zig-pixman.git'
	'git+https://github.com/ifreund/zig-wayland.git'
	'git+https://github.com/swaywm/zig-wlroots.git'
	'git+https://github.com/ifreund/zig-xkbcommon.git'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
	cd "$_pkgname"
	git submodule init
	for dep in pixman wayland wlroots xkbcommon; do
		git config "submodule.deps/zig-$dep.url" "$srcdir/zig-$dep"
	done
	git submodule update
}

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" zig build install -Drelease-safe -Dxwayland \
		--prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
