#
# PKGBUILD file for package clapper
#
# Copyright (C) 2020/21 sp1rit
# Copyright (C) 2020  Rafostar
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Maintainer: sp1rit <sp1ritCS@protonmail.com>

_basename=clapper
pkgname="${_basename}-git"
pkgver=r959.159f96c
pkgrel=1
pkgdesc="A GNOME media player built using GJS with GTK4 toolkit and powered by GStreamer with OpenGL rendering."
arch=(any)
url="https://github.com/Rafostar/clapper"
license=("GPL-3.0")
depends=(
	"gtk4"
	"gjs"
	"glib2>=2.68.0" # glib-2.0, gmodule-2.0, gio-2.0
	"wayland-protocols" # gtk4 non-default runtime dep
	"hicolor-icon-theme"
	"gstreamer>=1.20.0" # gstreamer-1.0, gstreamer-base-1.0
	"gst-plugins-base>=1.20.0"
	"gst-plugins-good>=1.20.0"
	"gst-plugins-bad>=1.20.0"
	"libadwaita"
	"libsoup3"
)
makedepends=(
	"meson>=0.50"
	"git"
	"gobject-introspection" # /usr/sbin/g-ir-scanner
)
optdepends=(
	"gst-libav>=1.20.0: Popular video decoders"
	"gstreamer-vaapi>=1.20.0: Intel/AMD video acceleration"
	"gst-plugins-ugly>=1.20.0: CD/DVD playback"
	"gst-plugin-va>=1.20.0: Intel/AMD video acceleration (experimental)"
	"gtuber>=r242: Play videos from various services"
)
source=("${_basename}::git+https://github.com/Rafostar/${_basename}.git")
provides=("${_basename}" "libgst${_basename}-1.0")
conflicts=("${_basename}")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"	
}

prepare() {
	cd "${srcdir}/${_basename}"
	arch-meson . _build
}

build() {
	cd "${srcdir}/${_basename}"
	ninja -C _build
}

package() {
	cd "${srcdir}/${_basename}"
	DESTDIR="$pkgdir" meson install -C _build/
}
