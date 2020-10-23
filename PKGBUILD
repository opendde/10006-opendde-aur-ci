# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>

# BUILD INSTRUCTIONS
#
# The source for `elftosb` is available behind a login wall.
#
# By default, `nxp-dlagent` is used to fetch, you can avoid the prompts
# by setting `NXP_USERNAME` and `NXP_PASSWORD` for your account.
#
# Alternatively, visit <https://www.nxp.com/webapp/Download?colCode=elftosb_5.1.19&appType=license>,
# accept the license terms, and place the downloaded ZIP file in the same directory as this PKGBUILD.

pkgname=elftosb
pkgver=5.1.19
pkgname_pkgver=${pkgname}_$pkgver
pkgrel=2
pkgdesc="ELF to Secure Binary Utility for NXP MCUs"
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuboot-mcu-bootloader-for-nxp-microcontrollers:MCUBOOT"
# could also support 32-bit with some more work
arch=(x86_64)
license=(custom:NXP)
makedepends=(nxp-dlagent)
depends=()

DLAGENTS=("nxp::/usr/bin/nxp-dl %u")
source=("elftosb_5.1.19.zip"::"nxp://elftosb_5.1.19")
sha256sums=("c5becbe8905ce4002c4bd351ecb585125cf8090c1ae043b324432598707a5d2b")

build() {
  cd $srcdir/$pkgname_pkgver/proj/$pkgname
  make all
}

package() {
  bld=$srcdir/$pkgname_pkgver/proj/$pkgname/bld/linux
  install -Dm 755 $bld/elftosb -t $pkgdir/usr/bin
}
