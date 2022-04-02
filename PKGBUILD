# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=nut-git
_srcname=${pkgname%-git}
pkgver=2.8.0.rc1.r0.g86af0b98
pkgrel=1
pkgdesc='A collection of programs which provide a common interface for monitoring and administering UPS, PDU and SCD hardware'
arch=(x86_64)
url=https://networkupstools.org/
license=(
  GPL2
  GPL3
)
depends=(
  gcc-libs
  glibc
  libtool
  libusb-compat
  neon
  net-snmp
  openssl
)
makedepends=(
  asciidoc
  gd
  git
  python
)
optdepends=('gd: CGI support')
provides=(nut network-ups-tools)
conflicts=(nut network-ups-tools)
replaces=(network-ups-tools)
options=(!makeflags)
backup=(
  etc/nut/hosts.conf
  etc/nut/nut.conf
  etc/nut/ups.conf
  etc/nut/upsd.conf
  etc/nut/upsd.users
  etc/nut/upsmon.conf
  etc/nut/upssched.conf
  etc/nut/upsstats.html
  etc/nut/upsstats-single.html
)
source=(
  git+https://github.com/networkupstools/nut.git
  nut.sysusers
  nut.tmpfiles
  nut-snmp-usb-order.patch
)
sha256sums=('SKIP'
            '3001e24969545136361670c5d615684d2b37830525e090c2ab3bcfa90d90e4ac'
            'c924ccaae9ec75ee7795c872e1708d10201402642a6d5de2304cc644744bbcc5'
            'c2c7d3b72f94f9c7987ab047bba466923c63ddb80b468485f100b1e44997ec84')

pkgver() {
  cd nut

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd nut

  git cherry-pick -n eea0c5e9e5566c36a8b1e364ed4909231901a8f5
  patch -Np1 -i ../nut-snmp-usb-order.patch

  ./autogen.sh
}

build() {
  cd nut

  ./configure \
    --prefix=/usr \
    --datadir=/usr/share/nut \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/nut \
    --disable-static \
    --with-user=nut \
    --with-group=nut \
    --with-altpidpath=/run/nut \
    --with-cgipath=/usr/share/nut/cgi \
    --with-drvpath=/usr/lib/nut \
    --with-htmlpath=/usr/share/nut/html \
    --with-pidpath=/run/nut \
    --with-statepath=/var/lib/nut \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-cgi \
    --with-dev \
    --with-doc=html-single \
    --with-libltdl \
    --with-neon \
    --with-openssl \
    --with-serial \
    --with-snmp \
    --with-usb \
    --without-avahi \
    --without-doc \
    --without-ipmi \
    --without-freeipmi \
    --without-powerman \
    --without-wrap
  make -j1
}

package() {
  make DESTDIR="${pkgdir}" -C nut install
  find "${pkgdir}"/etc/nut -name *.sample -exec rename '.sample' '' {} \;

  install -Dm 644 nut.sysusers "${pkgdir}"/usr/lib/sysusers.d/nut.conf
  install -Dm 644 nut.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/nut.conf
}

# vim: ts=2 sw=2 et:
