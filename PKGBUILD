# Contributor: Flamelab <panosfilip@gmail.com>
# Based on kipi-plugins-svn PKGBUILD

pkgname=kipi-plugins-git
pkgver=r11330.10738ee
pkgrel=1
pkgdesc='A collection of plugins extending the KDE graphics and image applications as digiKam'
license=('GPL' 'LGPL' 'FDL')
arch=('i686' 'x86_64')
url="http://www.kipi-plugins.org/"
depends=('libkipi-git' 'libkexiv2-git' 'libkdcraw-git' 'libksane-git')
makedepends=('git' 'extra-cmake-modules' 'kcalcore' 'libkgeomap-git')
optdepends=('hugin: for expoblending plugin'
	    'kcalcore: Calendar plugin'
	    'libkgeomap-git: A tool to geolocalize pictures')
#	    'libmediawiki-git: A tool to export images to Mediawiki based web service')
#	    'libkvkontakte-git: A tool to export images to VKontakte web service')
conflicts=('kipi-plugins')
provides=('kipi-plugins')
install=kipi-plugins-git.install
source=('kipi-plugins::git+git://anongit.kde.org/kipi-plugins')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/kipi-plugins"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
if [[ -d "${srcdir}/build" ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "${srcdir}/kipi-plugins" -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DLIB_INSTALL_DIR=lib \
                -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
                -DBUILD_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
