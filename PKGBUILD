# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>
# Contributor: Martchus <martchus@gmx.net>

# You can install/update Subtitle Composer from repository if you add following to /etc/pacman.conf
# [subtitlecomposer]
# # Subtitle Composer
# SigLevel = PackageRequired
# Server = http://smoothware.net/$repo/$arch

_name=subtitlecomposer
pkgname=${_name}-git
pkgver=0.6.0
pkgrel=1
pkgdesc="A KDE subtitle editor (git version)"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/${_name}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'gstreamer')
makedepends=('extra-cmake-modules' 'git')
# Comment/uncomment the following dependencies to disable/enable
# building of plugins for MPV and Xine player backends.
makedepends+=('xine-lib')
makedepends+=('mpv')
conflicts=(${_name})
install=${_name}.install
optdepends=(
            'mpv: for MPV backend'
            'mplayer: for MPlayer backend'
            'xine-lib: for Xine backend'
            'ruby: for scripting'
            'python: for scripting')
source=("git+https://github.com/maxrd2/${_name}.git")
md5sums=('SKIP')

pkgver() {
  export APP_VER=${pkgver}
  cd ${srcdir}/${_name}
  git describe --always | sed 's|-|.|g' | sed -e 's/^v//g'
}

build() {
  cd ${srcdir}/${_name}
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/${_name}
  make DESTDIR=${pkgdir} install
}
