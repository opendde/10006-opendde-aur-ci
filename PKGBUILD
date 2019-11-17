# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=libzia
pkgver=4.18
pkgrel=1
pkgdesc="Support lib. for tucnak4"
arch=('i686' 'x86_64')
url="http://tucnak.nagano.cz/"
license=('GPL')
depends=('sdl' 'gtk2' 'libusb-compat' 'libftdi')
makedepends=('libftdi-compat' 'pkg-config')
conflicts=('libzia3')
source=("http://tucnak.nagano.cz/$pkgname-$pkgver.tar.gz"
	diff.zbfd.c
	diff.zdump.c)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.zbfd.c
	patch -p0 < ../diff.zdump.c
}

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install
}
md5sums=('9ea23e96662efe22ea2bb3c742f7f613'
         '89c0df530740b443ecb9a81fcd56b290'
         '2605f7404324ff64c78d539e37dc3a8a')
sha256sums=('c7ff9ad99dbe5d11e832495cf52f283e6c7ae14deeaa29edcd77e9ce4ac2dced'
            'd7e847934c40ce192ff949c0aa33b2ddf252310d11ade4fbbbd21f47e00c1301'
            '414064189562c05a5d600ead106f77348db4dccc73dc4a3a1b103075befe96ed')
