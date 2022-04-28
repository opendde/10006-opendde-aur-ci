# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gdm-settings
__pkgver='0.5.2'
pkgver=${__pkgver/-/+}
pkgrel=1
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-settings"
license=('AGPL3')
depends=('libadwaita' 'glib2' 'python-gobject' 'gettext')
makedepends=('meson' 'blueprint-compiler-git' 'gobject-introspection')
checkdepends=('appstream-glib')
backup=()
source=("${pkgname}-${__pkgver}.tar.gz"::"$url/archive/refs/tags/v${__pkgver}.tar.gz")
md5sums=('abc04433b776833f226b25558c1c3f4c')

prepare() {
  cd "$srcdir/$pkgname-${__pkgver}"
}
build() {
   arch-meson --buildtype=release "${srcdir}/${pkgname}-${__pkgver}" build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}
