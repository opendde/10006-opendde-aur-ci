# Maintainer: Nicola Mori <nicolamori (at) aol (dot) com>
# Contributor: Sven Schneider <archlinux.sandmann (at) googlemail (dot) com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>

pkgname=cmakeed
pkgver=1.18.0
pkgrel=1
pkgdesc="CMake plugin for Eclipse"
arch=('any')
url="https://github.com/15knots/cmakeed"
license=('EPL')
depends=('eclipse-cpp')
source=("https://dl.cloudsmith.io/public/15knots/p2-zip/raw/files/CMakeEd-${pkgver}.zip")
noextract=()
md5sums=('d83281a6cb078860ca2a818ff27fb9ae')

package() {
  
  _dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname}/eclipse"
	
  install -d ${_dest}
	
  cp -a "features" ${_dest}
  cp -a "plugins" ${_dest}
}
