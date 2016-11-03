# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=exrtools
pkgver=0.4
pkgrel=1
pkgdesc="A set of simple command-line utilities for manipulating high dynamic range images in OpenEXR format."
url="http://scanline.ca/exrtools/"
arch=('x86_64' 'i686')
license=('custom')
depends=('openexr' 'libpng' 'libjpeg')

source=("http://scanline.ca/exrtools/exrtools-0.4.tar.gz"
        "${pkgname}.patch")
sha512sums=('f4da32091275b25aa17c0bdffb0b7525575dc25703c5289e70f6a4954ccc14ad9036b927cd63af9adca8e36b8f2ead6e191d470ea33bf22c1cbe982afce7c92e'
            '0268d541eca001311f80228c3f6dde035830a52f14fcaaf38c145ea6ff23f6620ca910ffb08d0d532e5870d9cb7866dcfaffec5f4e29d1d8a616138a46e75489')

prepare() {
	cd "${srcdir}"
	patch -p1 -i ${pkgname}.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
