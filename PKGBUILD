# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.37.10
pkgrel=1
pkgdesc="NextDNS CLI client (DoH Proxy)"
url="https://github.com/nextdns/nextdns"
arch=(x86_64)
license=(MIT)
depends=()
provides=(nextdns)
conflicts=(nextdns)
backup=(etc/nextdns.conf)

source=(
  https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_amd64.tar.gz
  nextdns.service
)
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=('15540c5839d20c3694fe16d1e581727215046edff636717625e7a96b12a0e0d3'
            '00b0c930275df825475b0d86062f7488131f1b2b5e16e5ec6f9983e53138505b')

build() {
  cd $srcdir
  # post-install:
  # - set a value for key config
  # - consider changing value of keys listen and report-client-info
  # - NB: setup-router overrides listen
  ./nextdns config list | sort > nextdns.conf
}

package() {
  install -Dm 755 nextdns ${pkgdir}/usr/bin/nextdns
  install -Dm 644 $srcdir/nextdns.conf "$pkgdir/etc/nextdns.conf"
  install -Dm 644 $srcdir/nextdns.service "$pkgdir/usr/lib/systemd/system/nextdns.service"
  install -Dm 644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
