
# Maintainer: Malte Veerman <maldela@halloarsch.de>

pkgname=fancontrol-common
<<<<<<< HEAD
_srcname=fancontrol-gui-0.6
pkgver=v0.6
=======
_srcname=fancontrol-gui
pkgver=v0.5
>>>>>>> d071268bf87804cc79daa4eb7928c49768ed2752
pkgrel=1
pkgdesc="Common resources used by fancontrol-gui and fancontrol-kcm"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('qt5-declarative' 'qt5-quickcontrols' 'kirigami2' 'hicolor-icon-theme' 'lm_sensors' 'kauth' 'kpackage')
makedepends=('git' 'extra-cmake-modules')
<<<<<<< HEAD
source=('https://github.com/Maldela/fancontrol-gui/archive/v0.6.tar.gz')
md5sums=('5088db3b423c098b56d2b0bc73f27aa1')
=======
source=('fancontrol-gui::git+https://github.com/Maldela/fancontrol-gui.git#branch=0.5')
md5sums=('SKIP')
>>>>>>> d071268bf87804cc79daa4eb7928c49768ed2752



build() {
  msg "Starting build..."

  cd "$srcdir/$_srcname"

  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_TESTING=off \
        -DSTANDARD_CONFIG_FILE=/etc/fancontrol \
        -DSTANDARD_SERVICE_NAME=fancontrol \
        -DBUILD_GUI=off \
        -DBUILD_KCM=off \
        -DBUILD_HELPER=on \
        -DINSTALL_SHARED=on
  make
}

package() {
  cd "$srcdir/$_srcname"
  make DESTDIR="$pkgdir/" install
}
