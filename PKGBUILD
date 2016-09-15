# Maintainer: Sebastian Meyer <mail@bastimeyer.de>

pkgname=livestreamer-twitch-gui-git
_pkgname=livestreamer-twitch-gui
pkgver=1239.feaa6dc
pkgrel=1
pkgdesc="A multi platform Twitch.tv browser for Livestreamer"
arch=("i686" "x86_64")
url="https://github.com/bastimeyer/livestreamer-twitch-gui"
license=("MIT")
provides=("livestreamer-twitch-gui")
conflicts=("livestreamer-twitch-gui")
depends=(
	"alsa-lib"
	"gconf"
	"gtk2"
	"libnotify"
	"libxtst"
	"livestreamer"
	"nss"
	"xdg-utils"
	"xorg-xwininfo"
)
makedepends=(
	"git"
	"nodejs"
	"npm"
	"bower"
	"nodejs-grunt-cli"
)
options=(!strip)
install=${pkgname}.install
source=(${_pkgname}::"git+https://github.com/bastimeyer/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	npm install
	grunt release
}

package() {
	# go to folder of the built application
	cd "${srcdir}/${_pkgname}/build/releases/${_pkgname}/$(echo ${CARCH} | sed -e 's/x86_64/linux64/' -e 's/i686/linux32/')/"

	# replace executable path in the menuitem and disable checking for new versions
	sed -i "s:Exec=\$HERE/start.sh:Exec=/usr/bin/${_pkgname}:g" add-menuitem.sh
	sed -i "s:CHECKNEWVERSIONS=true:CHECKNEWVERSIONS=false:g" start.sh

	# create package folders and copy application content
	install -d "${pkgdir}/opt/${_pkgname}"
	install -d "${pkgdir}/usr/bin/"
	cp -R * "${pkgdir}/opt/${_pkgname}"

	# sym link from /usr/bin/${_pkgname} to start.sh
	ln -s "/opt/${_pkgname}/start.sh" "${pkgdir}/usr/bin/${_pkgname}"
	# workaround for missing libudev.so (see start.sh)
	ln -s "/usr/lib/libudev.so" "${pkgdir}/opt/${_pkgname}/libudev.so.0"

	# copy the license file
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	cp "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
