# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=suricata
pkgver=4.0.1
pkgrel=1
pkgdesc="An Open Source Next Generation Intrusion Detection and Prevention Engine"
arch=('i686' 'x86_64')
url="http://suricata-ids.org/"
license=('GPL2')
depends=('libcap-ng' 'libnet' 'libpcap' 'libyaml' 'pcre')
optdepends=('snort: suricata can use rulesets provided by snort')
backup=('etc/suricata/suricata.yaml')
source=(http://openinfosecfoundation.org/download/$pkgname-$pkgver.tar.gz{,.sig})
validpgpkeys=('801C7171DAC74A6D3A61ED81F7F9B0A300C1B70D') # Open Information Security Foundation
sha256sums=('0e73edb2911791644d82a62ab4f75517bbed339c0f21aadc0eb307b313643885'
            'SKIP')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/var/log/$pkgname

  install -Dm644 $pkgname.yaml "${pkgdir}"/etc/$pkgname/$pkgname.yaml
  install -Dm644 classification.config "${pkgdir}"/etc/$pkgname/classification.config
  install -Dm644 reference.config "${pkgdir}"/etc/$pkgname/reference.config
 
  install -d "${pkgdir}"/etc/$pkgname/rules
  install -Dm644 rules/*.rules "${pkgdir}"/etc/$pkgname/rules/
}
