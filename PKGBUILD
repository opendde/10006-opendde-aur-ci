# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 

pkgname=libpamac
pkgver=11.1.3
pkgrel=1
pkgdesc="Library for Pamac package manager based on libalpm"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'appstream-glib' 'polkit' 'archlinux-appstream-data-pamac')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc')
options=(!emptydirs)
conflicts=('libpamac-aur' 'libpamac-full')
source=(https://gitlab.manjaro.org/applications/libpamac/-/archive/$pkgver/libpamac-$pkgver.tar.bz2)
sha256sums=('4618dce17f66857d4a2872fccfa60308e84dee83756524f6b5df59472f22496b')

build() {
  cd $pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  meson setup --prefix=/usr --sysconfdir=/etc --buildtype=release
  # build
  ninja
}

package() {
  backup=('etc/pamac.conf')
  cd $pkgname-$pkgver
  cd builddir
  DESTDIR="$pkgdir" ninja install
}

#vim:set ts=2 sw=2 et:
