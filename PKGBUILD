# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv-git
pkgver=1.1.2.r73.g750a4bfb
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="https://gitlab.com/ocserv/ocserv"
license=('GPL2')
provides=('ocserv')
conflicts=('ocserv')
depends=('autogen' 'libpcl' 'http-parser' 'libnl' 'libsystemd' 'protobuf-c' 'talloc'
	 'libseccomp' 'freeradius-client' 'oath-toolkit' 'tcp_wrappers-libs' 'libev')
makedepends=('git' 'freeradius' 'gperf' 'autogen')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("$pkgname::git+https://gitlab.com/ocserv/ocserv.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags --long|sed -r 's,^[a-zA-Z_]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd ${pkgname}
  autoreconf -fi
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir" install
  install -Dm0644 doc/sample.config "$pkgdir/etc/ocserv.config"
  install -Dm0600 doc/sample.passwd "$pkgdir/etc/ocserv-passwd"
  install -Dm0644 doc/systemd/standalone/ocserv.service "$pkgdir/usr/lib/systemd/system/ocserv.service"
}
