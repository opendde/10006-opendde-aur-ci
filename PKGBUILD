# Contributor: Tom < reztho at archlinux dot us >
pkgname=openmsx-catapult
pkgver=0.15.0
pkgrel=1
pkgdesc="Front-end for openMSX: the MSX emulator that aims for perfection."
arch=('i686' 'x86_64')
url="http://openmsx.org"
license=('GPL')
depends=('libxml2' 'wxgtk' 'zlib' 'libjpeg' 'libpng' 'libtiff' "openmsx=${pkgver}")
makedepends=('python2')
source=("https://github.com/openMSX/wxcatapult/archive/RELEASE_${pkgver//./_}.tar.gz")

build() {
  cd "wxcatapult-RELEASE_${pkgver//./_}"

  # Catapult requires python2
  sed -i 's@=python@=python2@' build/main.mk

  # Changing some default configurations...
  sed -i 's@SYMLINK_FOR_BINARY:=true@SYMLINK_FOR_BINARY:=false@' build/custom.mk
  sed -i 's@/opt/openMSX-Catapult@/usr/share/openmsx-catapult@' build/custom.mk
  sed -i 's@/opt/openMSX/bin/openmsx@/usr/bin/openmsx@' build/custom.mk
  sed -i 's@/opt/openMSX/share@/usr/share/openmsx@' build/custom.mk
  echo 'INSTALL_DOC_DIR:=/usr/share/doc/openmsx-catapult' >> build/custom.mk
  echo 'INSTALL_SHARE_DIR:=/usr/share/openmsx-catapult' >> build/custom.mk
  echo 'INSTALL_BINARY_DIR:=/usr/bin' >> build/custom.mk

  # Compiling
  make
}

package() {
  cd "wxcatapult-RELEASE_${pkgver//./_}"

  mkdir -p "${pkgdir}/usr/share/applications"
  make DESTDIR="${pkgdir}" install

  # Fixing the .desktop file
  sed -i 's@/usr/share/openmsx-catapult/bin/catapult@/usr/bin/catapult@' \
  "${pkgdir}/usr/share/applications/openMSX-Catapult.desktop"
  sed -i 's@/usr/share/openmsx-catapult/doc/@/usr/share/doc/openmsx-catapult/@' \
  "${pkgdir}/usr/share/applications/openMSX-Catapult.desktop"
}

md5sums=('636938c4e882196f3896e7c6598b74ae')
