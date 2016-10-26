# Contributer: SolarAquarion (Shlomo Choina  at gmail dot com)

pkgname=rkward-frameworks-git
pkgver=v0.6.5.r164.g86fb0a7
pkgrel=1
pkgdesc="An Easy to use, transparent frontend to the R-language (kf5 frameworks-edition)"
arch=('i686' 'x86_64')
url="https://rkward.kde.org/"
license=('GPL')
depends=('qt5-base' 'r' 'docbook-xml' 'kxmlgui' 'kcodecs' 'kdewebkit')
makedepends=('cmake' 'docbook-xsl' 'git')
provides=('rkward')
conflicts=('rkward-git' 'rkward')
source=(git+https://anongit.kde.org/rkward.git#branch=frameworks)

pkgver(){
 cd $srcdir/rkward
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
 }
build() {
cd $srcdir/rkward
cmake -DCMAKE_INSTALL_PREFIX=/usr
make
}

package(){
	cd $srcdir/rkward
	make DESTDIR="$pkgdir" install

	# Some cleanup
}
md5sums=('SKIP')
