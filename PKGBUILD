# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=qtox
pkgname=qtox-git
pkgver=1.5.1.r13.ge4398c7
pkgrel=1
pkgdesc='Powerful Tox client written in C++/Qt that follows the Tox design guidelines.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/tux3/qTox'
license=('GPL3')
depends=('desktop-file-utils'
         'libxss'
         'openal'
         'qrencode'
         'gtk2'
         'ffmpeg'
         'qt5-svg'
         'sqlcipher'
         'toxcore')
makedepends=('git' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/tux3/qTox.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  install -d build
  cd build
  qmake-qt5 ENABLE_SYSTRAY_UNITY_BACKEND=NO CONFIG+=silent ..
  make
}

package() {
  cd $_pkgname/build
  make INSTALL_ROOT="$pkgdir" install
}
