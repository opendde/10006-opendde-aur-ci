# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=avpnc
pkgver=0.1
pkgrel=1
pkgdesc="A python implementation of the Aviatrix VPN client"
arch=('any')
url=https://github.com/christophgysin/avpnc
license=('MIT')
depends=('python' 'sudo' 'openvpn')
source=('https://raw.githubusercontent.com/christophgysin/avpnc/e4cf4728d6e3fce8e32b7039d8b305e186f6f012/avpnc')
sha512sums=('79323bbaa0be150d372a3b2c807a7d61ee8bd10974152d9674e880eaa27a754a7b7503ae88a3c9d0fa4b53ee45dc6411122c81676d74e87157367d48d595d829')

package() {
  install -Dm755 ${srcdir}/avpnc ${pkgdir}/usr/bin/avpnc
}
