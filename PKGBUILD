# Maintainer: Marco von Rosenberg <codingmarco@gmail.com>

pkgname=glrpt
pkgver=2.4.4
pkgrel=1
pkgdesc="Interactive GUI application for receiving, decoding and displaying LRPT images from the Russian Meteor-M type of weather satellites"
arch=('x86_64')
url="http://www.5b4az.org"
license=('GPLv3')
depends=('gtk3'
         'libglade'
         'soapysdr')
optdepends=('soapyrtlsdr: RTL-SDR support'
            'soapyairspy: Airspy support')
makedepends=('make' 'automake' 'autoconf' 'xorgproto')
source=("http://www.5b4az.org/pkg/lrpt/${pkgname}-${pkgver}.tar.bz2")
md5sums=('18e99a729722d0dc16b44a66d316d579')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
