# Maintainer: ThatOneCalculator <kainoa@t1c.dev>, Sander van Kasteel <info@sandervankasteel.nl>

_pkgname="hyprland"
pkgname="${_pkgname}-git"
pkgver=r615.g119e776
pkgrel=2
pkgdesc="Hyprland is a dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks."
arch=(any)
url="https://github.com/vaxerski/Hyprland"
license=('BSD')
depends=(libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango)
makedepends=(git cmake ninja gcc gdb)
source=("${_pkgname}::git+https://github.com/vaxerski/Hyprland.git")
conflicts=("${_pkgname}-git" "${_pkgname}" "${_pkgname}-bin")
sha256sums=('SKIP')
options=(!makeflags !buildflags)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init
	make all
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/wayland-sessions"
	mkdir -p "${pkgdir}/usr/share/hyprland"
	install -Dm755 build/Hyprland -t "${pkgdir}/usr/bin"
	install -Dm755 hyprctl/hyprctl -t "${pkgdir}/usr/bin"
	install -Dm644 assets/*.png -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 example/hyprland.desktop -t "${pkgdir}/usr/share/wayland-sessions"
	install -Dm644 example/hyprland.conf -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
