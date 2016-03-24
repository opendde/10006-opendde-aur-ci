# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-station-drive
pkgver=4203
pkgrel=1
pkgdesc="Cloud Station Drive is an application which sync files between your computers and Synology NAS via the Internet, so that your data and documents are always up-to-date and stay beside you."
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('qt5-base')
optdepends=('nautilus: For nautilus integration')
install=synology-cloud-station-drive.install

source_x86_64=(http://global.download.synology.com/download/Tools/CloudStationDrive/4.0-${pkgver}/Ubuntu/Installer/x86_64/synology-cloud-station-drive-${pkgver}.x86_64.deb)
md5sums_i686=('f024335ded2e3fbada54013c2a948dfc')
md5sums_x86_64=('cd5fadf8cb1500bacb51efca104a710a')
source_i686=(http://global.download.synology.com/download/Tools/CloudStationDrive/4.0-${pkgver}/Ubuntu/Installer/i686/synology-cloud-station-drive-${pkgver}.i686.deb)

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"

    install -Dm755 usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so "${pkgdir}/usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so"
    install -Dm755 usr/bin/synology-cloud-station-drive "${pkgdir}/usr/bin/synology-cloud-station-drive"
    install -Dm644 usr/share/applications/synology-cloud-station-drive.desktop "${pkgdir}/usr/share/applications/synology-cloud-station-drive.desktop"
}
