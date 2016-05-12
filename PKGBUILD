# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: DaZ <daz.root+arch@gmail.coM>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgname=networkmanager-consolekit
pkgver=1.2.2
pkgrel=1
_pppver=2.4.7
pkgdesc="NetworkManager with ConsoleKit support for non-systemd systems"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("libnm-glib>=${pkgver}" 'iproute2' 'polkit-consolekit' 'consolekit'
         'wpa_supplicant' 'libsoup' 'libmm-glib' 'libnewt' 'libndp' 'libteam')
makedepends=('intltool' 'dhclient' 'iptables' 'gobject-introspection' 'gtk-doc'
             "ppp=$_pppver" 'modemmanager' 'rp-pppoe' 'vala' 'perl-yaml'
             'python-gobject')
optdepends=('modemmanager: for modem management service'
            'dhclient: External DHCP client'
            'dhcpcd: alternative DHCP client; does not support DHCPv6'
            'dnsmasq: connection sharing'
            'bluez: bluetooth support'
            'openresolv: resolvconf support'
            'ppp: dialup connection support'
            'rp-pppoe: ADSL support')
provides=("networkmanager=$pkgver")
replaces=('networkmanager')
conflicts=('networkmanager')
backup=('etc/NetworkManager/NetworkManager.conf')
install=networkmanager.install
source=(https://download.gnome.org/sources/NetworkManager/${pkgver:0:3}/NetworkManager-$pkgver.tar.xz
        NetworkManager.conf 
        networkmanager.rc
        )
sha256sums=('41d8082e027f58bb5fa4181f93742606ab99c659794a18e2823eff22df0eecd9'
            '452e4f77c1de92b1e08f6f58674a6c52a2b2d65b7deb0ba436e9afa91ee15103'
            'e39a2a0401518abd1d1d060200e2ca0f0854cdc49a5cb286919be177a7cd90fc')

prepare() {
  cd NetworkManager-$pkgver

  2to3 -w libnm src tools
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd NetworkManager-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/networkmanager \
    --with-crypto=nss \
    --with-dhclient=/usr/bin/dhclient \
    --without-dhcpcd \
    --with-dnsmasq=/usr/bin/dnsmasq \
    --with-iptables=/usr/bin/iptables \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-resolvconf=/usr/bin/resolvconf \
    --with-pppd=/usr/bin/pppd \
    --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
    --with-kernel-firmware-dir=/usr/lib/firmware \
    --with-session-tracking=ck \
    --disable-static \
    --enable-more-warnings=no \
    --disable-wimax \
    --enable-modify-system \
    --enable-doc \
    --enable-gtk-doc

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package() {
  cd NetworkManager-$pkgver
  make DESTDIR="${pkgdir}" install

  make DESTDIR="$pkgdir" -C libnm uninstall
  make DESTDIR="$pkgdir" -C libnm-glib uninstall
  make DESTDIR="$pkgdir" -C libnm-util uninstall
  make DESTDIR="$pkgdir" -C vapi uninstall
  
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib/pkgconfig"

  install -D -m644 "${srcdir}/NetworkManager.conf" "${pkgdir}/etc/NetworkManager/NetworkManager.conf"
  install -D -m755 "${srcdir}/networkmanager.rc"   "${pkgdir}/etc/rc.d/networkmanager"

  rm -r "${pkgdir}/var/run"
  rmdir -p --ignore-fail-on-non-empty \
    "$pkgdir"/usr/{share/{vala/vapi,gir-1.0},lib/girepository-1.0}
}
