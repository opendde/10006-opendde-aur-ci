# Maintainer: physkets
# Contributor: Andrew Crouthamel
# Contributor: Liviu Cristian Mirea-Ghiban
# Contributor: Lars Øyvind Hagland
# Contributor: Vishnu V K
# Contributor: George Shammas
# Contributor: Ainola
# Contributor: Jeff Sharpe
# Contributor: Roman Pearah

# Set to 0 if you don't want to install
# files and dependencies needed for the GUI
_GUI=1

pkgname=netextender
pkgver=10.2.817
pkgrel=1
pkgdesc="SonicWALL SSL VPN Client"
arch=('i686' 'x86_64')
url="https://www.sonicwall.com/en-us/products/remote-access/vpn-client"
license=('custom')
depends=('bash' 'ppp' 'net-tools')
source_i686=("https://software.sonicwall.com/NetExtender/NetExtender.Linux-${pkgver}.x86.tgz"
             "https://www.sonicwall.com/legal/general-product-agreement")
source_x86_64=("https://software.sonicwall.com/NetExtender/NetExtender.Linux-${pkgver}.x86_64.tgz"
               "https://www.sonicwall.com/legal/general-product-agreement")
sha256sums_i686=('42638fa375fa7b54819f8f36a5b4674318a17424813f366285a5c609020c87e1'
                 'SKIP')
sha256sums_x86_64=('1d43b40d411e16c3eeea1b2adf70a62f74340e5c576931deeac7ff91e2336ec1'
                 'SKIP')

if (( $_GUI )); then
    depends+=('java-runtime')
fi


install="${pkgname}.install"
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {

  install -Dm 644 general-product-agreement "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/share/netExtender/icons"
  cd "netExtenderClient"

  install -Dm 644 sslvpn "${pkgdir}/etc/ppp/peers/sslvpn"
  install -Dm 755 netExtender "${pkgdir}/usr/bin/netExtender"
  install -Dm 744 nxMonitor "${pkgdir}/usr/bin/nxMonitor"

  mkdir -p "${pkgdir}/etc/ppp/ip-down.d"
  mkdir -p "${pkgdir}/etc/ppp/ipv6-down.d"
  touch "${pkgdir}/etc/ppp/ip-down.d/sslvpnroutecleanup"
  touch "${pkgdir}/etc/ppp/ipv6-down.d/sslvpnroute6cleanup"
  chmod 757 "${pkgdir}/etc/ppp/ip-down.d/sslvpnroutecleanup"
  chmod 757 "${pkgdir}/etc/ppp/ipv6-down.d/sslvpnroute6cleanup"

  install -Dm 644 netExtender.1 "${pkgdir}/usr/share/man/man1/netExtender.1"
  install -Dm 755 libNetExtender.so "${pkgdir}/usr/lib/libNetExtender.so"
  install -Dm 755 libNetExtenderEpc.so "${pkgdir}/usr/lib/libNetExtenderEpc.so"
  install -Dm 644 ca-bundle.crt "${pkgdir}/usr/share/netExtender/ca-bundle.crt"

  if (( $_GUI )); then
    install -Dm 755 netExtenderGui "${pkgdir}/usr/bin/netExtenderGui"
    # netExtenderGui is hard-coded to check in /usr/lib
    install -Dm 644 NetExtender.jar "${pkgdir}/usr/lib/NetExtender.jar"
    install -Dm 644 icons/* "${pkgdir}/usr/share/netExtender/icons"
    install -Dm 664 NetExtender.desktop "${pkgdir}/usr/share/netExtender/NetExtender.desktop"
    install -Dm 664 NetExtender.desktop "${pkgdir}/usr/share/applications/sonicwall-netextender.desktop"

    chown -f root:root "${pkgdir}/usr/share/applications/sonicwall-netextender.desktop"
  fi
}
