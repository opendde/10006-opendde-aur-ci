# Maintainer:  Peter Mattern <pmattern@arcor.de>
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-panel
pkgname=$_pkgname-git
pkgver=0.11.0.7.gf73d164
pkgrel=1
pkgdesc='The LXQt desktop panel'
arch=('i686' 'x86_64')
url='https://github.com/lxde/lxqt-panel'
license=('GPL2')
depends=(
      "alsa-lib" "libpulse" "lm_sensors" "libstatgrab" "libsysstat-git"
      "solid"
      "menu-cache" "libxcomposite" "lxmenu-data" "libdbusmenu-qt5"
      "lxqt-globalkeys"
)
makedepends=("git" "cmake" "qt5-tools" "lxqt-build-tools-git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
      cd "$srcdir/$_pkgname"
      git describe --always | sed "s/-/./g"
}

build() {
      mkdir -p build
      cd build
      cmake "$srcdir/$_pkgname" \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=/usr/lib
      make
}

package() {
      cd build
      make DESTDIR="$pkgdir" install
}
