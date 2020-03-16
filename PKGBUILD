# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Upstream URL: https://github.com/themix-project/oomox-gtk-theme

_pkgname=themix-theme-oomox
pkgname="${_pkgname}-git"
pkgver=1.11.1.r21.g0143d5a1
pkgrel=2
pkgdesc="Oomox theme plugin
 (GTK2, GTK3, Cinnamon, Metacity, Openbox, Qt5ct, Unity, Xfwm) for Themix GUI designer.
 Have a hack for HiDPI in GTK2."
arch=('x86_64' 'i686')
url="https://github.com/themix-project/oomox-gtk-theme"
license=('GPL3')
source=(
	"git+https://github.com/themix-project/oomox.git#branch=master"
	"git+https://github.com/themix-project/oomox-gtk-theme.git#branch=master"
)
md5sums=('SKIP'
         'SKIP')
depends=(
	'gtk3'
	'glib2'  # oomox, materia, arc
	'gdk-pixbuf2'  # oomox, materia, arc
	'gtk-engine-murrine'  # oomox, materia, arc
	'gtk-engines'  # oomox, materia, arc
	'sassc'  # oomox, materia, arc
	'librsvg'  # oomox, gnome-colors
	'sed'  # oomox, materia, arc, gnome-colors, archdroid
	'findutils'  # oomox, materia, arc, gnome-colors, arch-droid
	'grep'  # oomoxify, oomox, materia, arc, gnome-colors
	'bc'  # oomoxify, oomox, materia, arc, gnome-colors
)
makedepends=(
	'git'
)
optdepends=(
	'themix-gui: GUI'
)
options=(
	'!strip'
)
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
	cd "${srcdir}/oomox-gtk-theme"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	_oomox_dir=/opt/oomox

	pkg_tmp_dir="${pkgdir}/_tmp"
	rm -fr "$pkg_tmp_dir"
	cp -r "${srcdir}/oomox" "$pkg_tmp_dir"
	rm -rf "${pkg_tmp_dir}/plugins/theme_oomox/gtk-theme"
	cp -r "${srcdir}/oomox-gtk-theme" "${pkg_tmp_dir}/plugins/theme_oomox/gtk-theme"

	cd "$pkg_tmp_dir"
	make DESTDIR="${pkgdir}" APPDIR="${_oomox_dir}" PREFIX="/usr" install_theme_oomox
	rm -fr "$pkg_tmp_dir"
}

# vim: ft=PKGBUILD
