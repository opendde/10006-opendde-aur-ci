# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Arto Puranen <purcher@gmail.com>

pkgname=arno-iptables-firewall
pkgver=2.1.1
pkgrel=1
pkgdesc="A secure stateful firewall for both single and multi-homed machine"
arch=('any')
url="https://github.com/arno-iptables-firewall/aif/"
license=('GPL')
depends=('iptables' 'iproute2')
makedepends=('patch')
backup=(etc/${pkgname}/firewall.conf
        etc/${pkgname}/custom-rules
        etc/${pkgname}/plugins/dmz-dnat.conf
        etc/${pkgname}/plugins/dsl-ppp-modem.conf
        etc/${pkgname}/plugins/dyndns-host-open.conf
        etc/${pkgname}/plugins/ids-protection.conf
        etc/${pkgname}/plugins/ipsec-vpn.conf
        etc/${pkgname}/plugins/ipv6-over-ipv4.conf
        etc/${pkgname}/plugins/linux-upnp-igd.conf
        etc/${pkgname}/plugins/mac-address-filter.conf
        etc/${pkgname}/plugins/multiroute.conf
        etc/${pkgname}/plugins/nat-loopback.conf
        etc/${pkgname}/plugins/outbound-snat.conf
        etc/${pkgname}/plugins/parasitic-net.conf
        etc/${pkgname}/plugins/pptp-vpn-passthrough.conf
        etc/${pkgname}/plugins/pptp-vpn.conf
        etc/${pkgname}/plugins/rpc.conf
        etc/${pkgname}/plugins/sip-voip.conf
        etc/${pkgname}/plugins/ssh-brute-force-protection.conf
        etc/${pkgname}/plugins/traffic-accounting.conf
        etc/${pkgname}/plugins/traffic-shaper.conf
        etc/${pkgname}/plugins/transparent-dnat.conf
        etc/${pkgname}/plugins/transparent-proxy.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/arno-iptables-firewall/aif/archive/${pkgver}.tar.gz
        $pkgname.patch)
sha256sums=('6f5ae0e671b8ded8eb80efa48d4d0aa50324acde6ffdc4b3d34c7f8cc4fce598'
            'fbac95bced8565b00f5ff7b403579b1aaf7d386deb61c0f4a9acf50408a8200d')

prepare() {
  cd "${srcdir}"/aif-${pkgver}

  patch -Np0 -i "${srcdir}"/${pkgname}.patch
}

package() {
  cd "${srcdir}"/aif-${pkgver}

# conf files
  install -d -m 0755 etc/${pkgname}/plugins/ "${pkgdir}"/etc/${pkgname}/plugins/
  for i in `find etc/${pkgname} -type f`; do install -T -m 0600 $i "${pkgdir}"/$i ;done
  install -Dm0644 share/${pkgname}/environment "${pkgdir}"/usr/share/${pkgname}/environment

# plugins
  install -d -m 0755 share/${pkgname}/plugins/ "${pkgdir}"/usr/share/${pkgname}/plugins/
  for i in share/${pkgname}/plugins/*plugin; do install -T -m 0644 $i "${pkgdir}"/usr/$i ;done
  install -Dm0744 share/${pkgname}/plugins/dyndns-host-open-helper \
    "${pkgdir}"/usr/share/${pkgname}/plugins/dyndns-host-open-helper
  install -Dm0744 share/${pkgname}/plugins/traffic-accounting-helper \
    "${pkgdir}"/usr/share/${pkgname}/plugins/traffic-accounting-helper
  install -Dm0744 share/${pkgname}/plugins/traffic-accounting-log-rotate \
    "${pkgdir}"/usr/share/${pkgname}/plugins/traffic-accounting-log-rotate
  install -Dm0744 share/${pkgname}/plugins/traffic-accounting-show \
    "${pkgdir}"/usr/share/${pkgname}/plugins/traffic-accounting-show

# binary
  install -Dm0744 bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -Dm0744 bin/arno-fwfilter "${pkgdir}"/usr/bin/arno-fwfilter
  install -Dm0744 contrib/adsl-failover "${pkgdir}"/usr/bin/adsl-failover

# man files
  install -Dm0644 share/man/man1/arno-fwfilter.1 "${pkgdir}"/usr/share/man/man1/arno-fwfilter.1
  install -Dm0644 share/man/man8/${pkgname}.8 "${pkgdir}"/usr/share/man/man8/${pkgname}.8

# systemd script
  install -Dm0644 "${srcdir}"/aif-${pkgver}/lib/systemd/system/${pkgname}.service \
    "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
  sed 's|local/s||g' -i "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
}
