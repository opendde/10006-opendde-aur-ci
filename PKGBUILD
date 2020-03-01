# Maintainer: Simon Gardling <titaniumtown@gmail.com>

pkgname=mutter-git
_pkgname=mutter
pkgver=3.35.91+97+gf27de9620
pkgrel=1
pkgdesc="A window manager for GNOME."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf js68 gjs-dev gobject-introspection-runtime gsettings-desktop-schemas libcanberra sysprof-dev
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire-git jack2)
makedepends=(intltool gobject-introspection git egl-wayland)
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
