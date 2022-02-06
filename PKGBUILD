# Contributor: Mettacrawer <metta.crawler@gmail.com>
# Contributor: luizribeiro <luizribeiro@gmail.com>
# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>
# Maintainer:  graysky <graysky AT archlinux DOT us>

pkgname=pi-hole-ftl
_pkgname=FTL
_servicename=pihole-FTL
pkgver=5.13
pkgrel=1
_now=`date +%N`
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="The Pi-hole FTL engine"
url="https://github.com/pi-hole/FTL"
license=('EUPL-1.2')
depends=('nettle' 'gmp' 'libidn')
makedepends=('cmake' 'sqlite')
conflicts=('dnsmasq')
provides=('dnsmasq')
install=$pkgname.install
backup=('etc/pihole/pihole-FTL.conf' 'etc/pihole/pihole-FTL.db')
source=($pkgname-v$pkgver.tar.gz::"https://github.com/pi-hole/FTL/archive/v$pkgver.tar.gz"
        arch-ftl-$pkgver-$_now.patch::"https://raw.githubusercontent.com/max72bra/pi-hole-ftl-archlinux-customization/master/arch-ftl-$pkgver.patch"
        "$pkgname.tmpfile"
        "$pkgname.sysuser"
        "$pkgname.service"
        "$pkgname.db"
        "$pkgname.conf")
sha256sums=('e9dd05aa7889f5fdd53af451bd2bd38a4df9a078f167301afb496835ee313fc0'
            '267e2800131f8ebdf494cf06c9dfe96f7004021fbea0f2c779ccc1f7adfd9c0d'
            '538d2f66e30eabeeb0ac6794ac388b96ddf1830d9e988a0aaa810cb17c5c69fc'
            '39ef7bfd672ce59440bbf89e812992adc4d40091bc8d70fa24bd586381979064'
            '7f9ed05cec17c483077c0f14fecc5b7555bd4eeb0d8898a4f0c8b878fc82c9d6'
            '8beb120ac275f88c4b72bf2dde583f27f0c1e1fb9766c2d7c60285bd342867ed'
            'bd4794a73bea22f3301cf6ab8d9029d8e671e6411a26493a2ffbdf462129268c')

prepare() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  patch -Np1 -i "$srcdir"/arch-ftl-$pkgver-$_now.patch
}

build() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm775 "$_pkgname"-$pkgver/pihole-FTL "${pkgdir}"/usr/bin/pihole-FTL
  
  install -Dm644 "$pkgname.tmpfile" "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 "$pkgname.sysuser" "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf

  install -dm775 "$pkgdir"/etc/pihole
  install -Dm644 "$pkgname.conf" "$pkgdir"/etc/pihole/pihole-FTL.conf
  install -Dm644 "$pkgname.db" "$pkgdir"/etc/pihole/pihole-FTL.db

  install -Dm644 "$pkgname.service" "$pkgdir"/usr/lib/systemd/system/$_servicename.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../$_servicename.service "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_servicename.service"
  
  install -dm755 "$pkgdir"/usr/share/licenses/pihole
  install -Dm644 "$_pkgname"-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/pihole/Pi-hole-FTL
  
  # ver. 5.0 dnamasq dropin support
  ln -s ./pihole-FTL "$pkgdir/usr/bin/dnsmasq"
}
