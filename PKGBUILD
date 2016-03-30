# Maintainer: Brian Allred <brian.d.allred@gmail.com>
# This script is licensed under the MIT license.

pkgname=gpmdp
pkgver=3.1.0
pkgrel=1
pkgdesc="A beautiful cross platform Desktop Player for Google Play Music. Stable release."
arch=('i686' 'x86_64')
url="http://www.googleplaymusicdesktopplayer.com"
source=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-")
depends=('libnotify' 'alsa-lib' 'gconf' 'gtk2' 'nss')
optdepends=('gnome-keyring' 'lsb-release' 'libxtst')
license=('MIT')

case $CARCH in
	'x86_64')
		_arch='amd64'
		md5sums=('b6bd198456d8e5aed669cce2904a4054')
		;;
	'i686')
		_arch='i386'
		md5sums=('c94ed674b5b3de2e66e93ea5dc1b3422')
		;;
esac

source=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v${pkgver}/google-play-music-desktop-player_${pkgver}_${_arch}.deb")

package() {
	tar -xf data.tar.xz -C "${pkgdir}"
	rm -rf "${pkgdir}"/usr/share/lintian
	chmod -R 755 "${pkgdir}"/usr
}
