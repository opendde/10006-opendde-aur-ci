# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
# Modified for vfs_proprietary by Daniel Kamil Kozar <dkk089@gmail.com>
# Modified for libfprint2 by Stephen Bird <sebirdman@gmail.com>

pkgname=fprintd-libfprint2
pkgname_=fprintd
pkgver=0.9.0+23+ga520896
pkgrel=1
pkgdesc="D-Bus service to access fingerprint readers, modified to use libfprint2"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fprint/fprintd"
license=(GPL)
depends=(dbus-glib 'glib2>=2.56' 'libfprint-git>=1.90.0' 'polkit>=0.91')
provides=(fprintd)
conflicts=(fprintd)
makedepends=(intltool gtk-doc git pam)
checkdepends=(python-cairo python-dbusmock python-gobject)
groups=(fprint)
source=(
  "git+https://gitlab.freedesktop.org/libfprint/fprintd.git"
  'disable-systemd-protection.patch'
)
sha256sums=(
  'SKIP'
  '4854d32d6579de31fd59b4df02f6a29db2e266dedfe9edda13bedcda1b083be1'
)

check() {
  cd $pkgname_
  make check
}

pkgver() {
  cd $pkgname_
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname_
  patch -p1 -i "${srcdir}/disable-systemd-protection.patch"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname_
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname_
  make DESTDIR="$pkgdir" dbus_confdir=/usr/share/dbus-1/system.d install
  install -d -m 755 "$pkgdir/var/lib/fprint"
}
