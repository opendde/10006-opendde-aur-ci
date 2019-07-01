# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libpng15
pkgver=1.5.30
_apngver=1.5.30
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files (1.5 branch)"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('zlib')
conflicts=('libpng<1.6')
options=('!libtool')
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-${pkgver}.tar.xz"{,.asc}
	"http://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-${_apngver}-apng.patch.gz")
sha256sums=('7d76275fad2ede4b7d87c5fd46e6f488d2a16b5a69dc968ffa840ab39ba756ed'
            'SKIP'
            '805de5f56272a38e1e7d4bceaafb34d4466762d00620a009cdaaeb8bb8536c34')

build() {
	cd libpng-${pkgver}

	# Add animated PNG (apng) support
	# see http://sourceforge.net/projects/libpng-apng/
	gzip -cd ../libpng-${_apngver}-apng.patch.gz | patch -Np1

	./configure --prefix=/usr
	make
}

package() {
	cd libpng-${pkgver}

	make DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}/usr/"{bin,include,lib/{pkgconfig,libpng.so,libpng.a},share}
}

