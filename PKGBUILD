# Contributor: Andrew Panchenko <panchenkoac at gmail>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=qmmp-plugin-pack
pkgver=1.0.0
pkgrel=1
pkgdesc="Qmmp Plugin Pack"
arch=('i686' 'x86_64')
url="http://qmmp.ylsoftware.com"
license=('GPL')
depends=("qmmp>=$pkgver" 'qt4>=4.6' 'taglib>=1.7.0' 'mpg123>=1.13.0' 'libxmp>=4.2.0')
makedepends=('cmake>=2.8.6' 'yasm')
source=(http://qmmp.ylsoftware.com/files/plugins/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('df098cfa59857ac7d5227e824d96a7fd30f61edb')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DLIB_DIR=/usr/lib -DCMAKE_BUILD_TYPE=RELEASE -DUSE_FFAP:BOOL=TRUE
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
