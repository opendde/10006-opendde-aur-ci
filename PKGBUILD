# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# You can change it to for example RelWithDebInfo to help with debugging.

_buildtype="Release"

##############################################################

pkgname=libechonest
pkgver=1.2.1
pkgrel=4
pkgdesc="C++ library for interfacing with Echo Nest"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/libs/libechonest"
license=('GPL')
depends=('qjson')
makedepends=('cmake')
provides=('libechonest')
conflicts=('libechonest-git' 'libechonest2')
source=("http://pwsp.cleinias.com/${pkgname}-${pkgver}.tar.bz2")
md5sums=('038c4e390651b207575a12315ed3e687')

if [[ ! ${_buildtype} == "Release" ]] && [[ ! ${_buildtype} == "release" ]]; then
  options=('debug')
fi

prepare() {
  if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
  mkdir ${srcdir}/${pkgname}-${pkgver}-build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-build

  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
