# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gala-git
pkgver=3.3.2.r96.9dedf56d
pkgrel=1
pkgdesc='The Pantheon Window Manager'
arch=(x86_64)
url=https://github.com/elementary/gala
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  bamf
  gnome-desktop
  libgraphene-1.0.so=0-64
  lib{gee,gl}
  libgranite.so
  libmutter-6.so=0-64
)
makedepends=(
  git
  gnome-common
  intltool
  meson
  plank
  vala
)
provides=(
  gala
  libgala.so
)
conflicts=(gala)
source=(git+https://github.com/elementary/gala.git)
sha256sums=(SKIP)

pkgver() {
  cd gala

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson gala build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
