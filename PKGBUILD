# maintainer: hzy068808 at gmail.com
# contributer: a304yuanyuan at gmail.com
# contributer: rob.til.freedman@googlemail.com

pkgname=moonplayer
pkgver=2.4.r363
pkgrel=1
pkgdesc="A qt font-end for mplayer with the abilities of watching and downloading videos from chinese network"
arch=('i686' 'x86_64')
url="https://github.com/coslyk/moonplayer"
license=('GPL')
depends=('qt5-base' 'qt5-x11extras' 'qt5-webkit' 'python' 'python2' 'mpv' 'qtermwidget')
makedepends=('git')
source=(
	"git+https://github.com/coslyk/moonplayer#branch=master"
	)
sha1sums=('SKIP')

pkgver(){
	cd $srcdir/$pkgname
	echo $(grep "Latest version" README.md | awk '{ print $3 }' | sed 's/^v//g')."r$(git rev-list --count HEAD)"
}
build() {
	cd $srcdir/$pkgname/src
#
	find . -name '*.py' -exec sed -i \
	's|#![ ]*/usr/bin/python$|&2|;s|#![ ]*/usr/bin/env python$|&2|' {} +

	qmake-qt5 PREFIX=/usr moonplayer.pro

	make
}

package() {
	cd $srcdir/$pkgname/src

	make INSTALL_ROOT=$pkgdir install

	#clean pyc
	rm $pkgdir/usr/share/moonplayer/plugins/*.pyc

	cd $pkgdir/usr/share

	mv icons pixmaps
}
