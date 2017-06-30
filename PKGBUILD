# Maintainer: Hui Yiqun <huiyiqun@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: jfperini <@jfperini>

pkgname=vocal
pkgver=2.0.1
_tag=2.0.20
pkgrel=3
pkgdesc='A powerful, beautiful, and simple podcast client for the modern free desktop.'
arch=('i686' 'x86_64')
url='http://www.vocalproject.net'
license=('GPL3')
depends=('libnotify' 'libxml2' 'granite' 'clutter-gst' 'clutter-gtk' 'sqlite' 'libsoup' 'json-glib' 'webkit2gtk' 'libgee')
makedepends=('vala' 'cmake')
source=("https://github.com/needle-and-thread/vocal/archive/$_tag.tar.gz")
md5sums=('e831a73435b1c08026ac8063e528b25d')

prepare() {
  [[ -d $pkgname-$_tag/build/ ]] || mkdir -p $pkgname-$_tag/build/
}

build() {
  cd $pkgname-$_tag/build/

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd $pkgname-$_tag/build/

  make DESTDIR="$pkgdir" install
}
