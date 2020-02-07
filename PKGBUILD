# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: sum01 <sum01@protonmail.com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.6.7
pkgrel=1
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64')
url="https://github.com/alamminsalo/orion/"
license=('GPL3')
depends=('mpv' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-graphicaleffects')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alamminsalo/orion/archive/${pkgver}.tar.gz")
sha256sums=('19d9c170d0bcf21d47947704d8c8e927cff5140f94cb840b51d2b8574b0149fb')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	qmake CONFIG+=mpv
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -Dm644 distfiles/orion.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/orion.svg"
	install -Dm644 distfiles/Orion.desktop "${pkgdir}/usr/share/applications/Orion.desktop"
	install -Dm755 orion "${pkgdir}/usr/bin/orion"
}
