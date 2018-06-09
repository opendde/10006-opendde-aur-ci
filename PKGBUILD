# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=gnome-remote-desktop
pkgname=$_pkgname-git
pkgver=0.1.4.0.gafa12d0
pkgrel=1
pkgdesc='Remote desktop daemon for GNOME using pipewire'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
license=('GPL2')
depends=('libvncserver' 'dconf' 'pipewire')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://gitlab.gnome.org/jadahl/$_pkgname.git)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
