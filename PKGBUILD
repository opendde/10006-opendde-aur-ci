# Maintainer: SanskritFritz (gmail)

pkgname=gpsmaster
pkgver=0.63.31
pkgrel=1
pkgdesc="Create, view, edit and analyse GPX files."
arch=('any')
license=('GPL2')
depends=('java-runtime')
url="http://gpsmaster.org/"
source=("http://gpsmaster.org/download/GpsMaster_$pkgver.jar"
        "gpsmaster.sh"
        "gpsmaster.desktop")
noextract=("GpsMaster_$pkgver.jar")
md5sums=('54fd82cc5f2338713a92477003fcaab2'
         'ee58fda742aa0a9472a10b367e186f73'
         '219071f074a7b047c5a142b16038c6df')

package() {
	install -Dm644 "GpsMaster_$pkgver.jar" "${pkgdir}/opt/gpsmaster/GpsMaster.jar"
	install -Dm755 "gpsmaster.sh" "${pkgdir}/usr/bin/gpsmaster"
	install -Dm644 "gpsmaster.desktop" "${pkgdir}/usr/share/applications/gpsmaster.desktop"
}

