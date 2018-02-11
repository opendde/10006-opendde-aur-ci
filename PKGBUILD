# Contributor: Raffaele Zamorano
# Contributor: Jose Riha <jose1711 gmail com>
# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=gpxsee
pkgver=5.0
pkgrel=1
pkgdesc='GPX viewer and analyzer'
arch=('i686' 'x86_64')
url="http://www.gpxsee.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/tumic0/GPXSee/archive/${pkgver}.tar.gz")
sha256sums=('7002f92b80bdc624700f95990450ce24036a4db91fdf76b6e3aacb34152d764f')

build() {
  cd GPXSee-${pkgver}

  lrelease gpxsee.pro
  qmake gpxsee.pro
  make
}

package() {
  cd GPXSee-${pkgver}

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share/applications
  install -d 755 ${pkgdir}/usr/share/pixmaps
  install -d 755 ${pkgdir}/usr/share/mime/packages
  install -d 755 ${pkgdir}/usr/share/${pkgname}
  install -d 755 ${pkgdir}/usr/share/${pkgname}/maps
  install -d 755 ${pkgdir}/usr/share/${pkgname}/csv
  install -d 755 ${pkgdir}/usr/share/${pkgname}/translations

  install -m 755 GPXSee ${pkgdir}/usr/bin/${pkgname}
  install -m 644 pkg/maps/* ${pkgdir}/usr/share/${pkgname}/maps
  install -m 644 pkg/csv/* ${pkgdir}/usr/share/${pkgname}/csv
  install -m 644 lang/*.qm ${pkgdir}/usr/share/${pkgname}/translations
  install -m 644 icons/gpxsee.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -m 644 pkg/gpxsee.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -m 644 pkg/gpxsee.xml ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
}
