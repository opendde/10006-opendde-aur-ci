# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgbase=dnsmasq-china-list-git
pkgname=(dnsmasq-china-list-git smartdns-china-list-git)
pkgver=0.96984.ab47aca5b5
pkgrel=1
pkgdesc="Configuration for hot China domains to accelerate via Dnsmasq"
arch=('any')
url="https://github.com/felixonmars/dnsmasq-china-list"
license=('WTFPL')
makedepends=('git')
source=("git+https://github.com/felixonmars/dnsmasq-china-list.git")
md5sums=('SKIP')

pkgver() {
  cd dnsmasq-china-list
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd dnsmasq-china-list
  make smartdns SERVER=china
}

package_dnsmasq-china-list-git() {
  pkgdesc="Configuration for hot China domains to accelerate via Dnsmasq"
  depends=('dnsmasq')

  install -Dm644 dnsmasq-china-list/accelerated-domains.china.conf "$pkgdir/etc/dnsmasq.d/accelerated-domains.china.conf"
  install -Dm644 dnsmasq-china-list/apple.china.conf "$pkgdir/etc/dnsmasq.d/apple.china.conf"
  install -Dm644 dnsmasq-china-list/google.china.conf "$pkgdir/etc/dnsmasq.d/google.china.conf"
  install -Dm644 dnsmasq-china-list/bogus-nxdomain.china.conf "$pkgdir/etc/dnsmasq.d/bogus-nxdomain.china.conf"
  install -Dm755 dnsmasq-china-list/dnsmasq-update-china-list "$pkgdir/usr/bin/dnsmasq-update-china-list"
}

package_smartdns-china-list-git() {
  pkgdesc="Configuration for hot China domains to accelerate via smartdns"
  depends=('smartdns')

  install -Dm644 dnsmasq-china-list/accelerated-domains.china.smartdns.conf "$pkgdir/etc/smartdns/accelerated-domains.china.smartdns.conf"
  install -Dm644 dnsmasq-china-list/apple.china.smartdns.conf "$pkgdir/etc/smartdns/apple.china.smartdns.conf"
  install -Dm644 dnsmasq-china-list/google.china.smartdns.conf "$pkgdir/etc/smartdns/google.china.smartdns.conf"
}

# vim:set ts=2 sw=2 et:
