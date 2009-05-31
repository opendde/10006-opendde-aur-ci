# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=crda
pkgver=1.1.0
pkgrel=1
pkgdesc="Central Regulatory Domain Agent"
arch=(i686 x86_64)
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
license=('custom')
depends=('wireless-regdb' 'libnl' 'libgcrypt' 'udev' 'iw')
makedepends=('python-m2crypto')
install=crda.install
source=(http://wireless.kernel.org/download/crda/${pkgname}-${pkgver}.tar.bz2
        crda.rc)
md5sums=('6004584d2e39e899f7642b141dd72028'
         '014eef3f8655e9a130064ec6891317fc')
                  
build() {
  # Install crda, regdbdump and udev rules
  msg "Compiling and installing crda ..."
  cd ${srcdir}/${pkgname}-${pkgver}
  make crda regdbdump || return 1
  make DESTDIR=${pkgdir} install || return 1
  # This rule automatically sets the regulatory domain when cfg80211 is loaded
  echo 'ACTION=="add" SUBSYSTEM=="module", DEVPATH=="/module/cfg80211", RUN+="/etc/rc.d/wireless-regdom start >/dev/null"' >> ${pkgdir}/lib/udev/rules.d/85-regulatory.rules || return 1

  msg "Installing license ..."
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/crda/LICENSE || return 1
  
  msg "Installing boot script ..."
  install -D -m755 ${srcdir}/crda.rc ${pkgdir}/etc/rc.d/wireless-regdom || return 1
}
