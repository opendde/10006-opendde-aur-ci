# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>

pkgname=cmakeed
pkgver=1.1.6
pkgrel=2
pkgdesc="CMake plugin for Eclipse"
arch=('any')
url="http://www.cthing.com/CMakeEd.asp"
license=('CPL')
depends=('eclipse-common')
source=(http://downloads.sourceforge.net/${pkgname}/CMakeEd-${pkgver}.zip)
noextract=()
md5sums=('25599c51944ac11b42a90bf6559474ff')
sha256sums=('b8ba8c295080a77d0a9d5da904626e00946f773dd59f85fb7ee6840b780350d5')
sha384sums=('f36959502c75b03d8d56fbeec7f1c4fb08d198f19d607c721c525a4faa6021146a122eac0c2d8aabb060b47f54d2a987')
sha512sums=('65c656a49cb33a0ff64e7ee313ed4addc72e546c2fa925a9509c5192757bc79269876379688c366f7acb938fdcbda46d78a418a693383f66ff5673465905cb5b')

package() {
  cd "${srcdir}/CMakeEd-${pkgver}"
	
  _dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname}/eclipse"
	
  install -d ${_dest}
	
  cp -a "features" ${_dest}
  cp -a "plugins" ${_dest}
}
