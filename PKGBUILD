# Maintainer: Manuel Schneider  <manuelschneid3r at googles mail>
pkgname=albert
pkgver=0.13.0
pkgrel=1
pkgdesc="A DE agnostic omnilauncher."
arch=('i686' 'x86_64')
url="https://github.com/albertlauncher/albert"
license=('GPL')
depends=('qt5-base' 'libx11' 'qt5-x11extras' 'qt5-svg')
makedepends=('cmake' 'qt5-base' 'qt5-tools' 'virtualbox' 'muparser')
provides=('albert')
conflicts=('albert-git')
source=(https://github.com/ManuelSchneid3r/albert/archive/v${pkgver}.tar.gz)
noextract=()
md5sums=('8969381bd116120884711908d6cc6f3f')

# If you want a debug build, change CMAKE_BUILD_TYPE to 'Debug'
#_build_type="Debug"
_build_type="Release"

build() {
  cat << EOD

   ╭──────────────────────────────────────────────╮
   │                                              │
   │   If you plan to report bugs please modify   │
   │   the PKGBUILD to build the debug version.   │
   │                                              │
   ╰──────────────────────────────────────────────╯

EOD

  [[ -d "${pkgname}-${pkgver}/build" ]] || mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"

  cmake ".." -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=${_build_type}
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install | grep -v '^-- '
}

# vim:set ts=2 sw=2 et:
