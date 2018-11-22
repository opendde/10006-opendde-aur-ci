# Maintainer: Hamza BENDALI BRAHAM <hbendali@ya.ru>
# Contributor: Hamza BENDALI BRAHAM <hbendali@ya.ru>
pkgname=mongoose-os
pkgver=201811161855+0fc1db0
pkgrel=1
pkgdesc="This package contains the Mongoose OS - IoT Firmware Development Framework."
arch=('x86_64' 'i686')
url="https://mongoose-os.com"
license=('Apache 2.0')
groups=('')
depends=('libftdi-compat' 'libusb>=1.0.16')
options=('!strip' '!emptydirs')
source_i686=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos-latest_201811161855+0fc1db0~bionic0_i386.deb")
source_x86_64=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos-latest_201811161855+0fc1db0~bionic0_amd64.deb")
sha512sums_x86_64=('d6dc6991c2e946416a74531d49b30a7b5995dcbbbd73c44c7b07af948d67c7d04d80be8dc7f2fe92909c392fa4e3285b5b396a0a60a511ce97b6710d9e6bdab8')
sha512sums_i686=('87403e1939bc10155d6387c11e2f4d0c4f941134c1908c893c25fed1027c29e8ae0c3598f4840ebc8cda6731e3491bd171dc2b795ecafaa089cbf5557e455e7b')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
