# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=dm-writeboost
pkgver=2.2.9
pkgrel=1
pkgdesc="Log-structured Caching for Linux"
arch=('any')
url="https://github.com/akiradeveloper/dm-writeboost"
license=('GPL2')
depends=('dkms')
options=(!strip)
source=("https://github.com/akiradeveloper/dm-writeboost/archive/v${pkgver}.tar.gz")

package() {
	install -dm755 ${pkgdir}/usr/src/${pkgname}-${pkgver}/
	install -m644 ${pkgname}-${pkgver}/src/* ${pkgdir}/usr/src/${pkgname}-${pkgver}/
}

md5sums=('dea559bed23c662a3539e1b4c51b3ed7')
