# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=wireguard
pkgname=(wireguard-dkms wireguard-tools)
pkgver=0.0.20161105
pkgrel=1
pkgdesc='next generation secure network tunnel'
arch=('x86_64' 'i686')
url='http://www.wireguard.io/'
license=('GPL')
makedepends=('git' 'libmnl')
source=("${pkgbase}-${pkgver}.tar.xz::https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-${pkgver}.tar.xz"
	'dkms.conf')
sha256sums=('3e98535184a9e00e739c8f2b6cc9b20aea876157e36d72726ca7662c9b5556b5'
            'f34dced05d2b1d9713da12eeef02e71db213646a4c8f6852227430bd84127433')

prepare() {
	sed -i '/^include/d' WireGuard-experimental-${pkgver}/src/Makefile
}

build() {
	cd WireGuard-experimental-${pkgver}/src/tools/

	make
}

package_wireguard-dkms() {
	arch=('any')
	depends=('dkms')

	cd WireGuard-experimental-${pkgver}/src/

	install -d -m0755 "${pkgdir}"/usr/src/wireguard-${pkgver}/{crypto,selftest}/
	install -D -m0644 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/wireguard-${pkgver}/dkms.conf
	install -m0644 Kbuild Kconfig Makefile *.c *.h "${pkgdir}"/usr/src/wireguard-${pkgver}/
	install -m0644 crypto/* "${pkgdir}"/usr/src/wireguard-${pkgver}/crypto/
	install -m0644 selftest/* "${pkgdir}"/usr/src/wireguard-${pkgver}/selftest/
}

package_wireguard-tools() {
	depends=('libmnl')

	cd WireGuard-experimental-${pkgver}/src/tools/

	make DESTDIR="${pkgdir}/" install
}

