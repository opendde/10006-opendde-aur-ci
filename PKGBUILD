# Maintainer: heinrich5991 <heinrich5991@gmail.com>
# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=hans
pkgver=0.4.3
pkgrel=1
pkgdesc="IPv4 over ICMP Echo tunnel"
arch=('i686' 'x86_64')
url="http://code.gerade.org/hans/"
license=('GPL2')
source=("https://github.com/friedrich/hans/archive/v${pkgver}.tar.gz")
sha256sums=('5c7fb50e17144ab9195bf6925a027dd111c72af3247a80b6000252c6ec5ed44a')

build() {
  cd ${srcdir}/hans-${pkgver}
  make
}

package() {
  cd ${srcdir}/hans-${pkgver}
  install -Dm644 README.md ${pkgdir}/usr/share/${pkgname}/README
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm744 hans ${pkgdir}/usr/bin/hans
}
