# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=youplay
pkgver=0.31
pkgrel=1
pkgdesc="Search, download and play music from YouTube."
arch=(any)
url="https://codeberg.org/ralfhersel/youplay"
license=('GPL3')
depends=(mpv ffmpeg python-mpv youtube-dl python-gobject)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"0001-Change-paths-for-packaging.patch"
	"0002-Rename-Internet-catergorie-because-it-does-not-exist.patch")
md5sums=('3c070a7055dd6fd68d87f2c11c779ba8'
         '45141b5634cde06c6805fc9b9a589e64'
         'bacb881be40e69da218f01cf1d9df541')

prepare() {
	cd "${pkgname}"	

	patch -p1 -i ${srcdir}/0001-Change-paths-for-packaging.patch
	patch -p1 -i ${srcdir}/0002-Rename-Internet-catergorie-because-it-does-not-exist.patch
}

package() {
	cd "${pkgname}"
	
	install -Dm755 youplay.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm755 youplay.py ${pkgdir}/usr/share/${pkgname}/${pkgname}.py
	install -Dm644 youplay.svg ${pkgdir}/usr/share/${pkgname}/${pkgname}.svg
	desktop-file-install --dir=${pkgdir}/usr/share/applications youplay.desktop
}
