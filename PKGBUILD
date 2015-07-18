# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Benjamin Hedrich <kiwisauce (a) pagenotfound (dot) de>

pkgname=tvheadend-atsc-epg-git
_gitname='tvheadend'
pkgver=5905+gc8df8b5
pkgrel=1
pkgdesc="TV streaming server for Linux (with PSIP ATSC EPG Grabber)"
arch=('i686' 'x86_64')
url="https://tvheadend.org/"
license=('GPL3')
depends=('avahi' 'openssl' 'python2' 'uriparser' 'ffmpeg')
makedepends=('git')
optdepends=('xmltv: For an alternative source of programme listings')
provides=('tvheadend')
conflicts=('tvheadend' 'hts-tvheadend' 'hts-tvheadend-svn' 'tvheadend-git')
install=tvheadend.install

source=("${_gitname}::git+https://github.com/laurimyllari/tvheadend.git#branch=atsc-epg"
	'tvheadend.service')

md5sums=('SKIP'
         'b546f4486f0d28bea13ad1fb676acb27')

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo $(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${_gitname}"
	./configure --prefix=/usr --mandir=/usr/share/man/man1 --python=python2 --release
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir/" install
	install -D -m 644 "$srcdir/tvheadend.service" "$pkgdir/usr/lib/systemd/system/tvheadend.service"
}

