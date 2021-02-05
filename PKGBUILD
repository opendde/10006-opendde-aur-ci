# Maintainer: Márcio <marciosr10@gmail.com>

pkgname=mutter-40alfa
_pkgname=mutter
pkgver=40.alpha.1.1+204+g6a47eb8c8
pkgrel=3
pkgdesc="A window manager for GNOME."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf js78 gjs gobject-introspection-runtime gsettings-desktop-schemas libcanberra sysprof
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire jack2 xorg-xwayland 
	 			 gsettings-desktop-schemas-git glib2-git) 
makedepends=(intltool gobject-introspection git egl-wayland xorg-server meson graphene)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/mutter.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$_pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

