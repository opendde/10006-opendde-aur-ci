# Maintainer: VHSgunzo <vhsgunzo.github.io>

pkgname='linux-xanmod-headers-bin'
pkgver='5.19.9'
xanmod='1'
pkgrel="$xanmod"
pkgbase="$pkgname"
pkgdesc='Headers and scripts for building modules for the Linux Xanmod - Prebuilt version'
url="http://www.xanmod.org/"
arch=('x86_64')
license=('GPL2')
options=('!strip')
depends=('pahole')
makedepends=('curl')
conflicts=("${pkgname%-bin}")
_url="https://github.com/xanmod/linux/releases"
source=("${_url}$(curl -L -s "${_url}/tag/${pkgver}-xanmod${xanmod}"|grep -o '/download.*linux-headers.*deb'|grep -v 'x64v2')")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha256sums=('33b457a3300f5d100eb809fc31c7403cc35717f31a58d988e6efaa035172de88')

prepare() {
  bsdtar -xf 'data.tar.xz'
}

package() {
  local kernver="${pkgver}-xanmod${xanmod}"
  local modulesdir="$pkgdir/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}"
  cp -r lib/modules/${kernver}/* ${modulesdir}
  cp -r usr/* ${pkgdir}/usr
}
