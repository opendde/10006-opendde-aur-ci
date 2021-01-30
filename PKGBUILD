# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2
pkgver=2.8.2
pkgrel=2
pkgdesc="Icinga Web 2 Interface"
license=('GPL')
arch=('any')
depends=('php7')
optdepends=('php7-gd: export data to PDF'
            'php7-imagick: graphs in PDF exports'
            'php7-intl: support for internationalization'
            'php7-pgsql: for PostgreSQL backend')
url="https://icinga.com/"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
install='icingaweb2.install'
sha256sums=('47d64bc4eeb574ca4ca2f765866a1612ed885d47d53cb3e7dc19adeb10b2b3db')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #mkdir -p "$pkgdir/etc/webapps/icingaweb2"
  mkdir -p "$pkgdir/etc/icingaweb2"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2"
  mkdir -p "$pkgdir/var/log/icingaweb2"

  cp -r application bin doc library modules public "$pkgdir/usr/share/webapps/icingaweb2"
  cp -r --parents etc/schema "$pkgdir/usr/share/webapps/icingaweb2"
  ln -s /usr/share/webapps/icingaweb2/bin/icingacli "$pkgdir/usr/bin/icingacli"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/icingaweb2/LICENSE"
  install -Dm644 etc/bash_completion.d/icingacli "$pkgdir/etc/bash_completion.d/icingacli"

  #chmod 2770 "$pkgdir/etc/webapps/icingaweb2"
  chmod 2770 "$pkgdir/etc/icingaweb2"
  chmod 2770 "$pkgdir/var/log/icingaweb2"
}
