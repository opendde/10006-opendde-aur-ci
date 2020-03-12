# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kiconthemes-git
pkgver=v4.100.0.rc1.r351.ga15b9f7
pkgrel=1
pkgdesc='KIconThemes'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kiconthemes'
license=('LGPL')
depends=('qt5-svg' 'kconfigwidgets-git' 'kitemviews-git' 'karchive-git')
makedepends=('extra-cmake-modules-git' 'git' 'python')
groups=('kf5')
conflicts=(kiconthemes)
provides=(kiconthemes)
source=('git://anongit.kde.org/kiconthemes.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kiconthemes \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
