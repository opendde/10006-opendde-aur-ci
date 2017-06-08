# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=telegraf-bin
pkgver=1.2.1
pkgrel=2
pkgdesc="An open source agent for collecting metrics and data on the system; Binary release"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/influxdata/telegraf"
license=('MIT')
conflicts=('telegraf')
backup=('etc/telegraf/telegraf.conf')
install=telegraf.install

source_i686=(telegraf.tar.gz::"https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_i386.tar.gz")
md5sums_i686=('27b12b7bbaef2c683ffc7f0561a50e4e')
source_x86_64=(telegraf.tar.gz::"https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_amd64.tar.gz")
md5sums_x86_64=('3eb41e5581a7ec78379ace9eb4c1558c')
source_armv6h=(telegraf.tar.gz::"https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_armhf.tar.gz")
md5sums_armv6h=('d60047a8c14433c37961b4db30464113')
source_armv7h=(telegraf.tar.gz::"https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_armhf.tar.gz")
md5sums_armv7h=('d60047a8c14433c37961b4db30464113')
source=('telegraf.sysusers' 'telegraf.tmpfiles' 'LICENSE')
md5sums=('58cc9edf8fbf07e7d3a0357db78121b1' '9c7a4df3556cab94837c432f5e46cf04' '10a23e7a514f23f0930e1a4254936534')

package() {
  cd $srcdir
  install -Dm644 telegraf.sysusers "$pkgdir/usr/lib/sysusers.d/telegraf.conf"
  install -Dm644 telegraf.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/telegraf.conf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/telegraf/LICENSE"

  cd telegraf
  install -Dm755 usr/bin/telegraf "$pkgdir/usr/bin/telegraf"
  install -Dm644 usr/lib/telegraf/scripts/telegraf.service "$pkgdir/usr/lib/systemd/system/telegraf.service"
  install -Dm644 etc/telegraf/telegraf.conf "$pkgdir/etc/telegraf/telegraf.conf"
  install -Dm644 etc/logrotate.d/telegraf "$pkgdir/etc/logrotate.d/telegraf"
}
