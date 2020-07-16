# Maintainer:  nissen22

# This PKGBUILD is heavily inspired by the cudatext-gtk2-bin package by ragouel
# You need to manually download the .deb file and place it where this
#  PKGBUILD is located, since FossHub does not allow static linking.
#  "https://www.fosshub.com/CudaText.html?dwl=cudatext-linux-qt5-amd64-1.107.0.0.tar.xz"
pkgname=cudatext-qt5-bin
_pkgname=cudatext
pkgver=1.107.0.0
pkgrel=0
pkgdesc="Cross-platform text editor, written in Lazarus. Qt5 edition."
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('qt5pas'
         'python')
makedepends=('gendesk')
provides=('cudatext')
options=('!strip')
source=("local://cudatext-linux-qt5-amd64-${pkgver}.tar.xz")
sha256sums=(eab4c3933a82cf89f98501a4376173542402bdc4c86f845d17b1496f61986b16)

prepare() {
	echo "Creating desktop file"
	gendesk -f -n --pkgname ${_pkgname} --pkgdesc "${pkgdesc}" --categories "Developement" --icon "cudatext-512" --exec "cudatext"
}

package() {
	install -Dm0755 ${srcdir}/cudatext ${pkgdir}/usr/bin/cudatext
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/cudatext-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cudatext-512.png"
	mkdir "${pkgdir}/usr/share/cudatext"
	chmod 755 "${pkgdir}/usr/share/cudatext"
	cp -r "${srcdir}/data" "${pkgdir}/usr/share/cudatext/"
	cp -r "${srcdir}/py" "${pkgdir}/usr/share/cudatext/"
	cp -r "${srcdir}/settings_default" "${pkgdir}/usr/share/cudatext/"
}
