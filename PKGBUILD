# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=jellyfin-web-bin
pkgver="10.7.1_1"
_pkgver=$(echo "$pkgver" | cut -f1 -d"_")
_pkgverfull="${pkgver//_/-}"
pkgrel=1
pkgdesc='The Free Software Media System - web package'
arch=('any')
url='https://jellyfin.org/'
license=('GPL2')
provides=('jellyfin-web')
conflicts=('jellyfin-web' 'jellyfin-web-git')
source=("https://repo.jellyfin.org/releases/server/debian/stable/web/jellyfin-web_${_pkgverfull}_all.deb")
sha256sums=('051a5750cf54663232291f8e835d7f364b8c31cf7241f421d96eb9a2d26ba8ba')

options=('staticlibs')

package() {
	tar -xf data.tar.xz
	cp -r "$srcdir"/usr "$pkgdir"/
}

