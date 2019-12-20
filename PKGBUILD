# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: ifaigios <ifaigios_at_gmail_dot_com>
# Contributor: Alyssa Hung <deciare@isisiew.org>
# Contributor: Matt Brennan
# Contributor: falconindy
# Contributor: adee
# Contributor: mystilleef

pkgname=zramswap
pkgver=5
pkgrel=1
pkgdesc="Sets up zram-based swap devices on boot"
arch=('any')
url="http://en.wikipedia.org/wiki/ZRam"
license=('GPL')
depends=('bash')
backup=("etc/zramswap.conf")
source=("zramctrl"
        "zramswap.conf"
        "zramswap.service")
md5sums=('fa0b8339c91cb2a45c57671839c46116'
         '20f7b479830c9511b972268df8479c26'
         'a6c029dc942c85704b0f6ac1ca078a24')

package() {
  install -Dm755 zramctrl $pkgdir/usr/lib/systemd/scripts/zramctrl
  install -Dm644 zramswap.conf $pkgdir/etc/zramswap.conf
  install -Dm644 zramswap.service $pkgdir/usr/lib/systemd/system/zramswap.service
}
