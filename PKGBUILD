# Maintainer: jose1711 <jose1711 at gmail dot com>

pkgname=jpegtran_crop_bin
pkgver=9b
pkgrel=1
pkgdesc="Stable jpegtran version with the lossless crop and scale feature"
arch=('i686')
url="http://sylvana.net/jpegcrop/jpegtran/"
license=('other')
source=("http://sylvana.net/jpegcrop/jpegcrop.tar.gz")
md5sums=('02eedfe3f31b858632891c30f34ca939')
conflicts=('jpegtran_crop')

build() {
	true
}

package() {
	cd ${srcdir}/jpegcrop/jpeg-${pkgver}
	install -D -m 755 jpegtran $pkgdir/usr/bin/jpegtran
	}
