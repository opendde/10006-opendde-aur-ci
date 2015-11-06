# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=libunity
pkgver=7.1.4
pkgrel=2
pkgdesc='Library for instrumenting and integrating with all aspects of the Unity shell'
arch=('i686' 'x86_64')
url='https://launchpad.net/libunity'
license=('LGPL')
depends=('dee' 'gtk3' 'libdbusmenu-glib')
makedepends=('bzr' 'gnome-common' 'gobject-introspection' 'intltool' 'vala')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}::bzr+lp:${pkgname}#revision=318")
sha256sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
