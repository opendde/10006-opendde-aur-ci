# Maintainer: Jacob Mischka <jacob@mischka.me>
pkgname=brave
pkgver=0.7.15dev
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default.'
arch=('i686' 'x86_64')
url='https://www.brave.com/'
license=('custom':"MPL2")
makedepends=('npm')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'libxtst' 'desktop-file-utils')
source=("https://github.com/brave/browser-laptop/archive/v${pkgver}.tar.gz"
		"Brave.desktop")
md5sums=('d43ce03461ab210b093891c77b2e81c2'
         '6919ccb899e04cf785696ff2a0172938')

build() {
	cd "${srcdir}/browser-laptop-${pkgver}"
	npm install node-gyp@3.2.1
	npm install
	npm run build-package
}

package() {
	case $CARCH in
	    'i686') _arch='x86';;
	    'x86_64') _arch='x64';;
	esac

	# Install files
	cd "${srcdir}/browser-laptop-${pkgver}"
	install -d "${pkgdir}/opt/brave"
	cp -a "Brave-linux-${_arch}/." "${pkgdir}/opt/brave"

	chmod 755 "${pkgdir}/opt/brave/Brave"

	install -d "${pkgdir}/usr/share/applications"
	install "${srcdir}/Brave.desktop" "${pkgdir}/usr/share/applications"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/brave/Brave" "${pkgdir}/usr/bin/brave"

	install -d "${pkgdir}/usr/share/pixmaps"
	install "res/app.png" "${pkgdir}/usr/share/pixmaps/brave.png"

	install -Dm644 "${pkgdir}/opt/brave/LICENSE" "${pkgdir}/usr/share/licenses/brave/LICENSE"
	rm "${pkgdir}/opt/brave/LICENSE"
}
