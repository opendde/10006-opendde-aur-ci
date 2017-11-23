# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>
# Contributor: honzor 

pkgname=libmodbus-git
_gitname=libmodbus
pkgver=3.1.4.r22.df7d633
pkgrel=1
pkgdesc="A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32 (github version)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://libmodbus.org"
license=('LGPL')
makedepends=(git asciidoc xmlto)
provides=(libmodbus)
conflicts=(libmodbus)
options=(!libtool)
source=(git://github.com/stephane/libmodbus.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | cut -c 2-)"
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf --install --symlink --force
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
