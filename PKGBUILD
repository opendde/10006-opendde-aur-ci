# Maintainer: Dominik Schrempf <dominik.schrempf at gmail dot com>
# Contributor: Jonathan Ryan <jryan at curious-computing dot com>
# Contributor: Hussam Al-Tayeb <hussam at visp dot net dot lb>
pkgname=htpdate
pkgver=1.2.2
pkgrel=1
pkgdesc="A client for time synchronisation"
arch=(i686 x86_64)
url="http://www.vervest.org/htp/"
license=(GPL2)
depends=('glibc')
# TODO: In the process of adding two patches from OpenWRT, but they are rejected.
# See https://aur.archlinux.org/packages/htpdate/.
source=("http://www.vervest.org/htp/archive/c/${pkgname}-${pkgver}.tar.xz"
        "htpdate.service")
md5sums=('aad8c33933648532ac8716c809b15be1'
         'ed9c9b1222e90e6ee0751f8f88772606')
        # "100-adjtimex.patch"
        # "101-daemon-run-in-foreground.patch")

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  install -D -m 644 htpdate.service ${pkgdir}/usr/lib/systemd/system/htpdate.service
  cd ${pkgname}-${pkgver}
  install -D -m 755 htpdate ${pkgdir}/usr/bin/htpdate
  install -D -m 644 htpdate.8 ${pkgdir}/usr/share/man/man8/htpdate.8
}
