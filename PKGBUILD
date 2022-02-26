# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gdm-settings
__pkgver='0.3-alpha'
pkgver=${__pkgver/-/+}
pkgrel=3
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-settings"
license=('AGPL3')
depends=('libadwaita' 'glib2' 'python-gobject')
makedepends=('git' 'meson' 'blueprint-compiler-git>=r128' 'gobject-introspection')
checkdepends=('appstream')
backup=()
source=("${pkgname}-${__pkgver}.tar.gz"::"$url/archive/refs/tags/v${__pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-${__pkgver}"
}
build() {
   arch-meson "${srcdir}/${pkgname}-${__pkgver}" build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}
