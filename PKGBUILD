# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-teamviewer
pkgver=1.3.0.0
pkgrel=3
_builderver=1.4.27.0
pkgdesc="A protocol plugin for Remmina to launch a TeamViewer connection."
arch=('x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina' 'teamviewer')
makedepends=('pkg-config' 'cmake')
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d1bdf6ad7e09ac7955ad0997db5c59af3850ecbd85ed89d0babf5539f97d0e0e'
            '74dc5992854d41947a75eeffd2b164af48b3010c44a6d4c7bce52a426fa4f1a9')

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname}-${pkgver}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_TRACE_CALLS=OFF .
  make
}

package() {
  cd "${srcdir}/build/"
  make DESTDIR="${pkgdir}" install
}
