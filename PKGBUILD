# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="Release"

##############################################################

pkgname=tomahawk
pkgver=0.6.1
pkgrel=1
pkgdesc="A Music Player App written in C++/Qt"
arch=('i686' 'x86_64')
url="http://tomahawk-player.org/"
license=('GPL3')
depends=('phonon' 'taglib' 'boost' 'clucene' 'libechonest2' 'jreen' 'qtweetlib' 'quazip' 'attica' 'qtwebkit' 'liblastfm')
makedepends=('cmake')
optdepends=('tomahawk-spotify-git: spotify resolver')
provides=('tomahawk')
conflicts=('tomahawk-git')
source=("http://download.tomahawk-player.org/${pkgname}-${pkgver}.tar.bz2")
md5sums=('64106afac08a20b7523317f8680f5f54')

install=tomahawk.install

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build() {
  if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
  mkdir ${srcdir}/${pkgname}-${pkgver}-build
  cd ${srcdir}/${pkgname}-${pkgver}-build

  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib/${pkgname} \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
