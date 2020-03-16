# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Upstream URL: https://github.com/themix-project/oomox-gtk-theme

_pkgname=themix-icons-gnome-colors
_reponame=gnome-colors-icon-theme
pkgname="${_pkgname}-git"
pkgver=5.5.5.r0.gcd8b05a
pkgrel=1
pkgdesc="Gnome-Colors icons plugin for Themix GUI designer"
arch=('x86_64' 'i686')
url="https://github.com/themix-project/gnome-colors-icon-theme"
license=('GPL3')
source=(
	"git+https://github.com/themix-project/oomox.git#branch=master"
	"${_reponame}::git+https://github.com/themix-project/gnome-colors-icon-theme.git#branch=master"
)
md5sums=('SKIP'
         'SKIP')
depends=(
	'librsvg'  # oomox, gnome-colors
	'sed'  # oomox, materia, arc, gnome-colors, archdroid
	'findutils'  # oomox, materia, arc, gnome-colors, arch-droid
	'grep'  # oomoxify, oomox, materia, arc, gnome-colors
	'bc'  # oomoxify, oomox, materia, arc, gnome-colors
	'imagemagick'  # gnome-colors
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
	cd "${srcdir}/${_reponame}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	_oomox_dir=/opt/oomox

	_oomox_dir=/opt/oomox
	_plugin_name=icons_gnomecolors
	_plugin_subpath="/${_reponame}"

	pkg_tmp_dir="${pkgdir}/_tmp"
	rm -fr "$pkg_tmp_dir"
	cp -r "${srcdir}/oomox" "$pkg_tmp_dir"
	rm -rf "${pkg_tmp_dir}/plugins/${_plugin_name}${_plugin_subpath}"
	cp -r "${srcdir}/${_reponame}" "${pkg_tmp_dir}/plugins/${_plugin_name}${_plugin_subpath}"

	cd "$pkg_tmp_dir"
	make DESTDIR="${pkgdir}" APPDIR="${_oomox_dir}" PREFIX="/usr" install_icons_gnomecolors
	rm -fr "$pkg_tmp_dir"
}

# vim: ft=PKGBUILD
