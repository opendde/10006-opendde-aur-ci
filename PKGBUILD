# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin'
pkgver=1.2.1
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Binary Release, Provides GUI"
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'python-atspi' 'libdrm' 'libxcb')
conflicts=('chia' 'chia-gui')
provides=('chia' 'chia-gui')
options=('!strip')
source_x86_64=("https://github.com/Chia-Network/chia-blockchain/releases/download/$pkgver/chia-blockchain_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/Chia-Network/chia-blockchain/releases/download/$pkgver/chia-blockchain_${pkgver}_arm64.deb")
sha256sums_x86_64=('5f0fe4447d265c18d0b88ecddad11753cf01f501f6a1b7d5832bdf0aa86cee91')
sha256sums_aarch64=('bbc12b8e87e4353df62a8abc145cd65f9928e296ed0f8b395da62a011b729bd2')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
	rm -rf "$pkgdir/usr/share/doc"
	rm -rf "$pkgdir/usr/share/lintian"
	ln -s /usr/lib/chia-blockchain/resources/app.asar.unpacked/daemon/chia "$pkgdir/usr/bin/chia"
}
