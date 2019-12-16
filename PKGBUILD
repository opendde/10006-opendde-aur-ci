# Maintainer: Juan Diego Tascon
# Maintainer: Swift Geek
pkgname=bluez-git
_pkgname=bluez
pkgver=5.52.r64.g6a83d1467
pkgrel=1
epoch=1
pkgdesc="Libraries and tools for the Bluetooth protocol stack"

url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libical' 'libdbus' 'glib2' 'alsa-lib' 'ell' 'json-c')
optdepends=('cups: CUPS backend')
makedepends=('git')
conflicts=($_pkgname
	   $_pkgname-utils
	   $_pkgname-libs
	   $_pkgname-cups
	   $_pkgname-hid2hci
	   $_pkgname-plugins
	   $_pkgname-hcidump
           'obexd-client'
	   'obexd-server')
provides=($_pkgname=${pkgver%%.r*}-${pkgrel}
          $_pkgname-utils=${pkgver%%.r*}-${pkgrel}
	  $_pkgname-libs=${pkgver%%.r*}-${pkgrel}
	  $_pkgname-cups=${pkgver%%.r*}-${pkgrel}
	  $_pkgname-hid2hci=${pkgver%%.r*}-${pkgrel}
	  $_pkgname-plugins=${pkgver%%.r*}-${pkgrel})
backup=('etc/bluetooth/main.conf')
source=("$pkgname::git://git.kernel.org/pub/scm/bluetooth/bluez.git"
	bluetooth.modprobe)
md5sums=('SKIP'
         '671c15e99d7154c2df987b71c5851b3d')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -r 's,^[^0-9],,;s,([0-9]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd $pkgname
  ./bootstrap
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-dbusconfdir=/usr/share \
    --enable-external-ell \
    --enable-btpclient \
    --enable-midi \
    --enable-sixaxis \
    --enable-mesh \
    --enable-experimental \
    --enable-manpages \
    --enable-library # this is deprecated
  make
}
  
check() {
  cd $pkgname
  # tests segfault and hang
#  make check || /bin/true # https://bugzilla.kernel.org/show_bug.cgi?id=196621
}


package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -Dm644 src/main.conf        "${pkgdir}/etc/bluetooth/main.conf"
  install -Dm644 ${srcdir}/bluetooth.modprobe "${pkgdir}/usr/lib/modprobe.d/bluetooth-usb.conf"
}
