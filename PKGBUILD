# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>
#
pkgname=dbus-nosystemd
pkgver=1.12.14
pkgrel=1
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(i686 x86_64)
license=('GPL' 'custom')
groups=('eudev-base')
# dep on shadow for install scriptlet FS#29341
depends=('expat' 'coreutils' 'filesystem' 'shadow' 'audit')
makedepends=('libx11' 'autoconf-archive' 'graphviz')
optdepends=('libx11: dbus-launch support'
            'dbus-openrc: dbus openrc initscript'
            'dbus-docs: documentation')
provides=('dbus-core' "dbus=${pkgver}" "libdbus=${pkgver}")
conflicts=('dbus-core' 'dbus' 'libdbus' 'dbus-eudev' 'dbus-x11')
replaces=('dbus-core' 'dbus' 'libdbus' 'dbus-eudev' 'dbus-x11')
install=dbus-nosystemd.install
_commit=a330c6184fe9c7f67495f8d4563b11d51a6dccc7  # tags/dbus-1.12.14^0
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git#commit=$_commit"
	30-dbus.sh dbus.rc)
md5sums=('SKIP'
         '6683a05bd749929ef9442816c22c3268'
         '6f116e46adcbe99326ee67e597598d29')

prepare() {
  cd dbus

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd dbus

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      runstatedir=/run \
      --libexecdir=/usr/lib/dbus-1.0 \
      --with-dbus-user=dbus \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-system-pid-file=/run/dbus/pid \
      --with-console-auth-dir=/run/console/ \
      --enable-inotify \
      --disable-verbose-mode \
      --disable-static \
      --disable-tests \
      --disable-asserts \
      --disable-libaudit \
      --disable-xml-docs \
      --disable-doxygen-docs \
      --disable-ducktype-docs \
      --disable-systemd

  make
}

package(){
  cd dbus

  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/var/run"
  rm -rf "$pkgdir/usr/share/doc"

  install -Dm755 ../dbus.rc "$pkgdir/etc/rc.d/dbus"
  install -Dm755 ../30-dbus.sh "$pkgdir/etc/X11/xinit/xinitrc.d/30-dbus.sh"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/dbus/COPYING"
}

