# Maintainer: Keith <k-aur at 3d3 dot ca>
# Contributor: Drew DeVault <sir@cmpwn.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=sway-mask-modifiers-git
_pkgname=sway
pkgver=r6815.38020d15
pkgrel=1
license=("MIT")
pkgdesc="Tiling Wayland compositor and replacement for the i3 window manager"
makedepends=(
	"git"
	"meson"
	"scdoc"
	"wayland-protocols"
)
depends=(
	"cairo"
	"gdk-pixbuf2"
	"json-c"
	"pango"
	"polkit"
	"pcre"
	"swaybg-git"
	"ttf-font"
	"wlroots-git"
	"xorg-server-xwayland"
)
optdepends=(
	"alacritty: Terminal emulator used by the default config"
	"dmenu: Application launcher"
	"grim: Screenshot utility"
	"i3status: Status line"
	"mako: Lightweight notification daemon"
	"slurp: Select a region"
	"swayidle: Idle management daemon"
	"swaylock: Screen locker"
	"wallutils: Timed wallpapers"
	"waybar: Highly customizable bar"
)
backup=(etc/sway/config)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("sway::git+https://github.com/swaywm/sway.git"
	"mask-modifiers.patch"
	50-systemd-user.conf)
sha512sums=('SKIP'
            'd540153de3d20a1ad20607415495e6d06068500bc6299e4fb6e24f5a71a7bc48d057141ee57c4db80a62cebabbdca52245bef36f3588497db82e1065620d2848'
            '57590bc0d14c87289a4a9cd67991c6a841e54244d2a6186b5da5a08e633de2e8631959fa8c77ede211b0a5f315d920f2c1350951a53d6f2e9e81859056cb3c9e')
provides=("sway" "sway-git")
conflicts=("sway" "sway-git")
options=(debug)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	patch --forward --strip=1 --input="${srcdir}/mask-modifiers.patch"
}

build() {
	arch-meson \
		-Dsd-bus-provider=libsystemd \
		-Dwerror=false \
		"$_pkgname" build
	meson compile -C build
}

package() {
	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"

	DESTDIR="$pkgdir" meson install -C build

        cd "$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
		install -Dm755 "contrib/$util" -t "$pkgdir/usr/share/$pkgname/scripts"
	done
}

post_upgrade() {
	echo "Make sure to upgrade wlroots-git and sway-git together."
	echo "Upgrading one but not the other is unsupported."
}
