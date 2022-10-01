# Maintainer: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributer: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributer: candroid_man <candroid_man@protonmail.com>
# Contributer: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>

pkgname=notesnook
pkgver=2.2.1
pkgrel=1
pkgdesc="Take private notes, capture ideas, make lists & sync them anywhere"
arch=('x86_64')
url="https://notesnook.com/"
license=('GPLv3')
depends=('gtk3' 'nss')
source=("notesnook_${pkgver}_amd64.deb"::"https://github.com/streetwriters/notesnook/releases/download/v$pkgver/notesnook_linux_amd64.deb")
sha256sums=('c83e24137bd70fb37bd4ba5a41f3ab14d96379e5465165443cd8458b2c5d3e63')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"

	# Link to the binary
	mkdir -p "${pkgdir}/usr/bin"
	ln -s '/opt/Notesnook/Notesnook' "${pkgdir}/usr/bin/Notesnook"
}

post_install() {
	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "${pkgdir}/opt/Notesnook/chrome-sandbox" || true

	update-mime-database /usr/share/mime || true
	update-desktop-database /usr/share/applications || true
}
