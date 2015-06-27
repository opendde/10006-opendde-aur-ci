# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=dynamips
pkgver=0.2.15
pkgrel=1
pkgdesc='Cisco router emulator.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/dynamips'
license=('GPL2')
depends=('libpcap' 'elfutils')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d4559daf61674452b91ec24b4028a8c4')

build() {
  if test ${CARCH} == x86_64; then
    export DYNAMIPS_ARCH=amd64
  fi
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake ./ -DCMAKE_INSTALL_PREFIX:PATH=/usr
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
