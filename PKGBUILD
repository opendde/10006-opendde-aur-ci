# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules-git
pkgver=5.72.0.r3159.fb6ae44
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=('any')
url='https://projects.kde.org/projects/kdesupport/extra-cmake-modules'
license=('LGPL')
depends=('cmake')
makedepends=('git'
             'python-sphinx'
             'qt5-tools'
             )
conflicts=('extra-cmake-modules')
provides=('extra-cmake-modules')
source=('git+https://invent.kde.org/frameworks/extra-cmake-modules.git')
sha1sums=('SKIP')

pkgver() {
  cd extra-cmake-modules
  _ver="$(cat CMakeLists.txt | grep -m1 'set(VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../extra-cmake-modules \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_QTHELP_DOCS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
