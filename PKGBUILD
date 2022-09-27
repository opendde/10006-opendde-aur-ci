# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

_pkgname=gnome-shell-extension-notes
pkgname=$_pkgname-git
pkgver=r223.12bfb34
pkgrel=1
pkgdesc="A GNOME Shell extension providing customizable sticky notes on the desktop"
arch=('any')
url="https://github.com/maoschanz/notes-extension-gnome"
license=('GPL-3')
depends=('gnome-shell')
makedepends=('glib2')
source=(git+https://github.com/maoschanz/notes-extension-gnome)
sha256sums=('SKIP')

_gitsrcdir=notes-extension-gnome

build() {
  cd $_gitsrcdir
  ./update-and-compile-translations.sh --all
  glib-compile-schemas notes@maestroschan.fr/schemas
}

package() {
  cd $_gitsrcdir
  mkdir -p $pkgdir/usr/share/gnome-shell/extensions
  cp --recursive --no-dereference --preserve=mode,links notes@maestroschan.fr $pkgdir/usr/share/gnome-shell/extensions
}
